package br.com.ifpe.psyChomics.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.ifpe.psyChomics.model.Pedido;
import br.com.ifpe.psyChomics.util.ConnectionFactory;

public class PedidoDao {

	private Connection connection;

	public PedidoDao() {

		try {
			this.connection = new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void cadastrar(Pedido pedido) {

		String sql = "INSERT INTO pedido (descricao) VALUES (?)";
		PreparedStatement stmt;
		try {
			stmt = connection.prepareStatement(sql);
			stmt.setString(1, pedido.getDescricao());
			stmt.execute();
			stmt.close();
			connection.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<Pedido> listar() {
		try {
			List<Pedido> listaPedido = new ArrayList<Pedido>();
			PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM pedido ORDER BY descricao");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Pedido pedido = new Pedido();
				pedido.setId(rs.getInt("id"));
				pedido.setDescricao(rs.getString("descricao"));
				listaPedido.add(pedido);
			}
			stmt.execute();
			connection.close();
			return listaPedido;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void remover(Pedido pedido) {
		String sql = "DELETE FROM pedido WHERE id = ?";
		PreparedStatement stmt;
		try {
			stmt = connection.prepareStatement(sql);
			stmt.setInt(1, pedido.getId());
			stmt.execute();
			connection.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public Pedido buscarPorId(int id) {
		try {
			Pedido pedidoCompleto = new Pedido();
			PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM pedido WHERE id =  ?");
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				pedidoCompleto.setId(rs.getInt("id"));
				pedidoCompleto.setDescricao(rs.getString("descricao"));
			}
			rs.close();
			stmt.close();
			connection.close();
			return pedidoCompleto;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void alterar(Pedido pedido) {
		String sql = "UPDATE pedido SET descricao = ? WHERE id = ?";
		PreparedStatement stmt;
		try {
			stmt = connection.prepareStatement(sql);
			stmt.setString(1, pedido.getDescricao());
			stmt.setInt(2, pedido.getId());
			stmt.execute();
			connection.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}