package br.com.ifpe.psyChomics.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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

		String sql = "INSERT INTO produto (codigo, nome, preco, imagem, descricao, idgenero) VALUES (?,?,?,?,?,?)";
		PreparedStatement stmt;

		try {
			stmt = connection.prepareStatement(sql);
			
			stmt.setString(1, produto.getCodigo());
			stmt.setString(2, produto.getNome());
			stmt.setDouble(3, produto.getPreco());
			stmt.setString(4, produto.getImagem());
			stmt.setString(5, produto.getDescricao());
			stmt.setInt(6, produto.getGeneroProduto().getId());

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
				
				Produto produto = new Produto();
				
				
				produto.setId(rs.getInt("id"));
				produto.setCodigo(rs.getString("codigo"));
				produto.setNome(rs.getString("nome"));
				
				int idGenero = rs.getInt("idgenero");
				GeneroProdutoDao dao = new GeneroProdutoDao();
				GeneroProduto cp = dao.buscarPorId(idGenero);
				produto.setGeneroProduto(cp);
				
				int idTipoProduto = rs.getInt("idtipo_produto");
				TipoProdutoDao dao2 = new TipoProdutoDao();
				TipoProduto cp2 = dao2.buscarPorId(idTipoProduto);
				produto.setTipoProduto(cp2);
				
				produto.setPreco(rs.getDouble("preco"));
				produto.setImagem(rs.getString("imagem"));
				produto.setDescricao(rs.getString("descricao"));

				listaProduto.add(produto);
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
				produtoCompleto.setCodigo(rs.getString("codigo"));
				produtoCompleto.setNome(rs.getString("nome"));
				
				int idGenero = rs.getInt("idgenero");
				GeneroProdutoDao dao = new GeneroProdutoDao();
				GeneroProduto gp = dao.buscarPorId(idGenero);
				produtoCompleto.setGeneroProduto(gp);
				
				
				produtoCompleto.setPreco(rs.getDouble("preco"));;
				produtoCompleto.setImagem(rs.getString("imagem"));
				produtoCompleto.setDescricao(rs.getString("descricao"));
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

		String sql = "UPDATE produto SET codigo = ?, nome = ?, preco = ?, descricao = ? WHERE id = ?";
		PreparedStatement stmt;
		try {

			stmt = connection.prepareStatement(sql);

			stmt.setString(1, produto.getCodigo());
			stmt.setString(2, produto.getNome());
			stmt.setDouble(3, produto.getPreco());
			stmt.setString(4, produto.getDescricao());
			stmt.setInt(5, produto.getId());

			stmt.execute();
			connection.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public List<Produto> buscar(Produto prod) {

		try {
			List<Produto> buscarProduto = new ArrayList<Produto>();
			PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM produto WHERE nome like ?");
			stmt.setString(1, "%"+prod.getNome()+"%");
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {

				Produto produto = new Produto();
				
				produto.setCodigo(rs.getString("codigo"));
				produto.setId(rs.getInt("id"));
				produto.setNome(rs.getString("nome"));
				
				int idGenero = rs.getInt("idgenero");
				GeneroProdutoDao dao = new GeneroProdutoDao();
				GeneroProduto cp = dao.buscarPorId(idGenero);
				produto.setGeneroProduto(cp);
				
				produto.setPreco(rs.getDouble("preco"));
				produto.setImagem(rs.getString("imagem"));
				produto.setDescricao(rs.getString("descricao"));



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


	public List<Produto> listarIndex() {
		try {
			List<Produto> listaProdutoIndex = new ArrayList<Produto>();
			PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM produto ORDER BY nome");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Produto prouto = new Produto();
				
				prouto.setCodigo(rs.getString("codigo"));
				
				prouto.setId(rs.getInt("id"));
				prouto.setNome(rs.getString("nome"));
				
				int idGenero = rs.getInt("idgenero");
				GeneroProdutoDao dao = new GeneroProdutoDao();
				GeneroProduto cp = dao.buscarPorId(idGenero);
				prouto.setGeneroProduto(cp);
				
				prouto.setPreco(rs.getDouble("preco"));
				prouto.setImagem(rs.getString("imagem"));
				prouto.setDescricao(rs.getString("descricao"));

				listaProdutoIndex.add(prouto);
			}
			stmt.execute();
			connection.close();
			return listaProdutoIndex;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	
	
	public List<Produto> listarDescricaoProduto() {
		try {
			List<Produto> listaDescricaoProduto = new ArrayList<Produto>();
			PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM produto ORDER BY nome");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Produto produto = new Produto();
				
				produto.setId(rs.getInt("id"));
				produto.setCodigo(rs.getString("codigo"));
				produto.setNome(rs.getString("nome"));
				
				int idGenero = rs.getInt("idgenero");
				GeneroProdutoDao dao = new GeneroProdutoDao();
				GeneroProduto cp = dao.buscarPorId(idGenero);
				produto.setGeneroProduto(cp);
				
				produto.setImagem(rs.getString("imagem"));
				produto.setDescricao(rs.getString("descricao"));

				listaDescricaoProduto.add(produto);
			}
			stmt.execute();
			connection.close();
			return listaDescricaoProduto;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
