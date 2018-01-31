package br.com.ifpe.psyChomics.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.ifpe.psyChomics.model.Produto;
import br.com.ifpe.psyChomics.util.ConnectionFactory;

public class ProdutoDao {

	private Connection connection;

	public ProdutoDao() {

		try {
			this.connection = new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void cadastar(Produto produto) {

		String sql = "INSERT INTO produto (nome, preco, genero, imagem) VALUES (?,?,?,?)";
		PreparedStatement stmt;

		try {
			stmt = connection.prepareStatement(sql);

			stmt.setString(1, produto.getNome());
			stmt.setDouble(2, produto.getPreco());
			stmt.setString(3, produto.getGenero());
			stmt.setString(4, produto.getImagem());

			stmt.execute();
			stmt.close();
			connection.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<Produto> listar() {
		try {
			List<Produto> listaProduto = new ArrayList<Produto>();
			PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM produto ORDER BY nome");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Produto prouto = new Produto();
				prouto.setId(rs.getInt("id"));
				prouto.setNome(rs.getString("nome"));
				prouto.setPreco(rs.getDouble("preco"));
				prouto.setGenero(rs.getString("genero"));
				prouto.setImagem(rs.getString("imagem"));

				listaProduto.add(prouto);
			}
			stmt.execute();
			connection.close();
			return listaProduto;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void remover(Produto produto) {

		String sql = "DELETE FROM produto WHERE id = ?";
		PreparedStatement stmt;
		try {

			stmt = connection.prepareStatement(sql);
			stmt.setInt(1, produto.getId());
			stmt.execute();
			connection.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}


	
	public Produto buscarPorId(int id) {

		try {

			Produto produtoCompleto = new Produto();

			PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM produto WHERE id =  ?");
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {

				produtoCompleto.setId(rs.getInt("id"));
				produtoCompleto.setNome(rs.getString("nome"));
				produtoCompleto.setPreco(rs.getDouble("preco"));
				produtoCompleto.setGenero(rs.getString("genero"));
				produtoCompleto.setImagem(rs.getString("imagem"));

			}

			rs.close();
			stmt.close();
			connection.close();

			return produtoCompleto;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public void alterar(Produto produto) {

		String sql = "UPDATE produto SET nome = ?, preco = ?, genero = ? WHERE id = ?";
		PreparedStatement stmt;
		try {

			stmt = connection.prepareStatement(sql);

			stmt.setString(1, produto.getNome());
			stmt.setDouble(2, produto.getPreco());
			stmt.setString(3, produto.getGenero());
			stmt.setInt(4, produto.getId());

			stmt.execute();
			connection.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public List<Produto> buscar(Produto prod) {

		try {
			List<Produto> buscarProduto = new ArrayList<Produto>();
			PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM produto WHERE genero like ?");
			stmt.setString(1, "%"+prod.getGenero()+"%");
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {

				Produto produto = new Produto();

				produto.setId(rs.getInt("id"));
				produto.setNome(rs.getString("nome"));
				produto.setPreco(rs.getDouble("preco"));
				produto.setGenero(rs.getString("genero"));
				produto.setImagem(rs.getString("imagem"));



				buscarProduto.add(produto);
			}

			rs.close();
			stmt.close();
			connection.close();

			return buscarProduto;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}


}
