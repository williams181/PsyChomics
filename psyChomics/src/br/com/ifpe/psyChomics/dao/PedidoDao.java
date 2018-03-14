package br.com.ifpe.psyChomics.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.ifpe.psyChomics.model.Pedido;
import br.com.ifpe.psyChomics.model.Usuario;
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

	public void salvar(Pedido pedido) {

		try {

			String sql = "INSERT INTO pedido (data, mensagem, usuario_id) VALUES (?,?,?)";
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setDate(1, new java.sql.Date(pedido.getData().getTime()));
			stmt.setString(2, pedido.getMensagem());
			stmt.setInt(3, pedido.getUsuario().getId());	
			stmt.execute();
			stmt.close();
			connection.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<Pedido> listar() {

		try {
			List<Pedido> listarPedido = new ArrayList<Pedido>();
			PreparedStatement stmt = this.connection
					.prepareStatement("SELECT * FROM pedido ORDER BY mensagem");

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				listarPedido.add(montarObjeto(rs));
			}

			rs.close();
			stmt.close();
			connection.close();

			return listarPedido;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void remover(Pedido pedido) {

		try {
			PreparedStatement stmt = connection.prepareStatement("DELETE FROM pedido WHERE id = ?");
			stmt.setLong(1, pedido.getId());
			stmt.execute();
			stmt.close();
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
				pedidoCompleto.setData(rs.getDate("data"));
				pedidoCompleto.setMensagem(rs.getString("mensagem"));
				
				int idUsuario = rs.getInt("usuario_id");
				UsuarioDao dao = new UsuarioDao();
				Usuario cp = dao.buscarPorId(idUsuario);
				pedidoCompleto.setUsuario(cp);

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

		String sql = "UPDATE pedido SET mensagem = ? WHERE id = ?";

		try {

			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, pedido.getMensagem());
			stmt.setInt(2, pedido.getId());
			stmt.execute();
			stmt.close();
			connection.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	private Pedido montarObjeto(ResultSet rs) throws SQLException {

		Pedido pedido = new Pedido();
		pedido.setId(rs.getInt("id"));
		pedido.setData(rs.getDate("data"));
		pedido.setMensagem(rs.getString("mensagem"));
		return pedido;
	}

}
