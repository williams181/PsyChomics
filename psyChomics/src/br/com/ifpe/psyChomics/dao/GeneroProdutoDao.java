package br.com.ifpe.psyChomics.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.ifpe.psyChomics.model.GeneroProduto;
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

	public void salvar(GeneroProduto generoProduto) {

		try {

			String sql = "INSERT INTO genero_produto (codigo, descricao) VALUES (?,?)";
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, generoProduto.getCodigo());
			stmt.setString(2, generoProduto.getDescricao());
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
			PreparedStatement stmt = this.connection
					.prepareStatement("SELECT * FROM genero_produto ORDER BY descricao");

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				listarGeneroProduto.add(montarObjeto(rs));
			}

			rs.close();
			stmt.close();
			connection.close();

			return listarGeneroProduto;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void remover(GeneroProduto generoProduto) {

		try {
			PreparedStatement stmt = connection.prepareStatement("DELETE FROM genero_produto WHERE id = ?");
			stmt.setLong(1, generoProduto.getId());
			stmt.execute();
			stmt.close();
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

	public void alterar(GeneroProduto generoProduto) {

		String sql = "UPDATE genero_produto SET codigo = ? , descricao = ? WHERE id = ?";

		try {

			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, generoProduto.getCodigo());
			stmt.setString(2, generoProduto.getDescricao());
			stmt.setInt(3, generoProduto.getId());
			stmt.execute();
			stmt.close();
			connection.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	private GeneroProduto montarObjeto(ResultSet rs) throws SQLException {

		GeneroProduto generoProduto = new GeneroProduto();
		generoProduto.setId(rs.getInt("id"));
		generoProduto.setCodigo(rs.getString("codigo"));
		generoProduto.setDescricao(rs.getString("descricao"));

		return generoProduto;
	}
}
