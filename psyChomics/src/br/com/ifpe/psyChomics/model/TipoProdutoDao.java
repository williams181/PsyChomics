package br.com.ifpe.psyChomics.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.ifpe.psyChomics.util.ConnectionFactory;

public class TipoProdutoDao {

	private Connection connection;

	public TipoProdutoDao() {

		try {
			this.connection = new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void cadastrar(TipoProduto tipoProduto) {

		String sql = "INSERT INTO tipo_produto (tipo) VALUES (?)";
		PreparedStatement stmt;

		try {
			stmt = connection.prepareStatement(sql);

			stmt.setString(1, tipoProduto.getTipo());

			stmt.execute();
			stmt.close();
			connection.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<TipoProduto> listar() {
		try {
			List<TipoProduto> listarTipoProduto = new ArrayList<TipoProduto>();
			PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM tipo_produto ORDER BY tipo");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				TipoProduto tipoProduto = new TipoProduto();
				tipoProduto.setId(rs.getInt("id"));
				tipoProduto.setTipo(rs.getString("tipo"));

				listarTipoProduto.add(tipoProduto);
			}
			stmt.execute();
			connection.close();
			return listarTipoProduto;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void remover(TipoProduto tipoProduto) {

		String sql = "DELETE FROM tipo_produto WHERE id = ?";
		PreparedStatement stmt;
		try {

			stmt = connection.prepareStatement(sql);
			stmt.setInt(1, tipoProduto.getId());
			stmt.execute();
			connection.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public TipoProduto buscarPorId(int id) {

		try {
			PreparedStatement stmt = connection.prepareStatement("SELECT * FROM tipo_produto WHERE id = ?");
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();

			TipoProduto tipoProduto = null;
			if (rs.next()) {
				tipoProduto = montarObjeto(rs);
			}

			rs.close();
			stmt.close();
			connection.close();
			return tipoProduto;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	private TipoProduto montarObjeto(ResultSet rs) throws SQLException {

		TipoProduto tipoProduto = new TipoProduto();
		tipoProduto.setId(rs.getInt("id"));
		tipoProduto.setTipo(rs.getString("tipo"));

		return tipoProduto;
	}

	public void alterar(TipoProduto tipoProduto) {

		String sql = "UPDATE tipo_produto SET tipo = ? WHERE id = ?";
		PreparedStatement stmt;
		try {

			stmt = connection.prepareStatement(sql);
			stmt.setString(1, tipoProduto.getTipo());
			stmt.setInt(2, tipoProduto.getId());

			stmt.execute();
			connection.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<TipoProduto> buscar(TipoProduto TipoProd) {

		try {
			List<TipoProduto> buscarTipoProduto = new ArrayList<TipoProduto>();
			PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM tipo_produto WHERE tipo like ?");
			stmt.setString(1, "%" + TipoProd.getTipo() + "%");
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {

				TipoProduto tipoProduto = new TipoProduto();
				tipoProduto.setId(rs.getInt("id"));
				tipoProduto.setTipo(rs.getString("tipo"));

				buscarTipoProduto.add(tipoProduto);
			}

			rs.close();
			stmt.close();
			connection.close();

			return buscarTipoProduto;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
