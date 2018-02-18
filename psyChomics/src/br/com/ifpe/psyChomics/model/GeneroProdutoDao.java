package br.com.ifpe.psyChomics.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.ifpe.psyChomics.util.ConnectionFactory;

public class GeneroProdutoDao {

	private Connection connection;

	public GeneroProdutoDao() {

		try {
			this.connection = new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void cadastrar(GeneroProduto generoProduto) {

		String sql = "INSERT INTO genero_produto (genero) VALUES (?)";
		PreparedStatement stmt;

		try {
			stmt = connection.prepareStatement(sql);

			stmt.setString(1, generoProduto.getGenero());

			stmt.execute();
			stmt.close();
			connection.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<GeneroProduto> listar() {
		try {
			List<GeneroProduto> listarGeneroProduto = new ArrayList<GeneroProduto>();
			PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM genero_produto ORDER BY genero");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				GeneroProduto generoProduto = new GeneroProduto();
				generoProduto.setId(rs.getInt("id"));
				generoProduto.setGenero(rs.getString("genero"));

				listarGeneroProduto.add(generoProduto);
			}
			stmt.execute();
			connection.close();
			return listarGeneroProduto;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void remover(GeneroProduto generoProduto) {

		String sql = "DELETE FROM genero_produto WHERE id = ?";
		PreparedStatement stmt;
		try {

			stmt = connection.prepareStatement(sql);
			stmt.setInt(1, generoProduto.getId());
			stmt.execute();
			connection.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public GeneroProduto buscarPorId(int id) {

		try {
			PreparedStatement stmt = connection.prepareStatement("SELECT * FROM genero_produto WHERE id = ?");
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();

			GeneroProduto generoProduto = null;
			if (rs.next()) {
				generoProduto = montarObjeto(rs);
			}

			rs.close();
			stmt.close();
			connection.close();
			return generoProduto;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	private GeneroProduto montarObjeto(ResultSet rs) throws SQLException {

		GeneroProduto generoProduto = new GeneroProduto();
		generoProduto.setId(rs.getInt("id"));
		generoProduto.setGenero(rs.getString("genero"));

		return generoProduto;
	}

	public void alterar(GeneroProduto generoProduto) {

		String sql = "UPDATE genero_produto SET genero = ? WHERE id = ?";
		PreparedStatement stmt;
		try {

			stmt = connection.prepareStatement(sql);
			stmt.setString(1, generoProduto.getGenero());
			stmt.setInt(2, generoProduto.getId());

			stmt.execute();
			connection.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<GeneroProduto> buscar(GeneroProduto generoProd) {

		try {
			List<GeneroProduto> buscarGeneroProduto = new ArrayList<GeneroProduto>();
			PreparedStatement stmt = this.connection
					.prepareStatement("SELECT * FROM genero_produto WHERE genero like ?");
			stmt.setString(1, "%" + generoProd.getGenero() + "%");
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {

				GeneroProduto generoProduto = new GeneroProduto();

				generoProduto.setId(rs.getInt("id"));
				generoProduto.setGenero(rs.getString("genero"));

				buscarGeneroProduto.add(generoProduto);
			}

			rs.close();
			stmt.close();
			connection.close();

			return buscarGeneroProduto;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
