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

		String sql = "INSERT INTO produto (nome, preco, genero) VALUES (?,?,?)";
		PreparedStatement stmt;

		try {
			stmt = connection.prepareStatement(sql);

			stmt.setString(1, produto.getNome());
			stmt.setDouble(2, produto.getPreco());
			stmt.setString(3, produto.getGenero());
			
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
			PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM produto ORDER BY genero");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Produto prouto = new Produto();
				prouto.setId(rs.getInt("id"));
				prouto.setNome(rs.getString("nome"));
				prouto.setPreco(rs.getDouble("preco"));
				prouto.setGenero(rs.getString("genero"));


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
}
