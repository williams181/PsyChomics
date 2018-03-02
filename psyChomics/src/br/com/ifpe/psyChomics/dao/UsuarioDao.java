package br.com.ifpe.psyChomics.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.ifpe.psyChomics.model.Usuario;
import br.com.ifpe.psyChomics.util.ConnectionFactory;

public class UsuarioDao {

	private Connection connection;

	public UsuarioDao() {
		try {
			this.connection = new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void cadastrar(Usuario usuario) {
		String sql = "INSERT INTO usuario (email, senha, nick, nome_usuario, cpf, notificacao) VALUES (?,?,?,?,?,?)";
		PreparedStatement stmt;
		try {
			stmt = connection.prepareStatement(sql);
			stmt.setString(1, usuario.getEmail());
			stmt.setString(2, usuario.getSenha());
			stmt.setString(3, usuario.getNick());
			stmt.setString(4, usuario.getNomeUsuario());
			stmt.setString(5, usuario.getCpf());
			stmt.setString(6, usuario.getNotificacao());
			stmt.execute();
			stmt.close();
			connection.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<Usuario> listar() {
		try {
			List<Usuario> listarUsuario = new ArrayList<Usuario>();
			PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM usuario ORDER BY nome_usuario");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Usuario usuario = new Usuario();
				usuario.setId(rs.getInt("id"));
				usuario.setEmail(rs.getString("email"));
				usuario.setSenha(rs.getString("senha"));
				usuario.setNick(rs.getString("nick"));
				usuario.setNomeUsuario(rs.getString("nome_usuario"));
				usuario.setCpf(rs.getString("cpf"));
				usuario.setNotificacao(rs.getString("notificacao"));
				listarUsuario.add(usuario);
			}
			stmt.execute();
			connection.close();
			return listarUsuario;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void remover(Usuario usuario) {
		String sql = "DELETE FROM usuario WHERE id = ?";
		PreparedStatement stmt;
		try {
			stmt = connection.prepareStatement(sql);
			stmt.setInt(1, usuario.getId());
			stmt.execute();
			connection.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public Usuario buscarPorId(int id) {
		try {
			Usuario usuarioCompleto = new Usuario();
			PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM usuario WHERE id =  ?");
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				usuarioCompleto.setId(rs.getInt("id"));
				usuarioCompleto.setEmail(rs.getString("email"));
				usuarioCompleto.setSenha(rs.getString("senha"));
				usuarioCompleto.setNick(rs.getString("nick"));
				usuarioCompleto.setNomeUsuario(rs.getString("nome_usuario"));
				usuarioCompleto.setCpf(rs.getString("cpf"));
				usuarioCompleto.setNotificacao(rs.getString("notificacao"));
			}
			rs.close();
			stmt.close();
			connection.close();
			return usuarioCompleto;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<Usuario> buscar(Usuario usua) {
		try {
			List<Usuario> buscarUsuario = new ArrayList<Usuario>();
			PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM usuario WHERE nome_usuario like ?");
			stmt.setString(1, "%" + usua.getNomeUsuario() + "%");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Usuario usuario = new Usuario();
				usuario.setId(rs.getInt("id"));
				usuario.setEmail(rs.getString("email"));
				usuario.setSenha(rs.getString("senha"));
				usuario.setNick(rs.getString("nick"));
				usuario.setNomeUsuario(rs.getString("nome_usuario"));
				usuario.setCpf(rs.getString("cpf"));
				usuario.setNotificacao(rs.getString("notificacao"));
				buscarUsuario.add(usuario);
			}
			rs.close();
			stmt.close();
			connection.close();
			return buscarUsuario;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	private Usuario montarObjeto(ResultSet rs) throws SQLException {

		Usuario usuario = new Usuario();

		usuario.setId(rs.getInt("id"));
		usuario.setEmail(rs.getString("email"));
		usuario.setSenha(rs.getString("senha"));
		usuario.setNick(rs.getString("nick"));
		usuario.setNomeUsuario(rs.getString("nome_usuario"));
		usuario.setCpf(rs.getString("cpf"));
		usuario.setNotificacao(rs.getString("notificacao"));
		return usuario;
	}

	public Usuario buscarUsuario(Usuario usuario) {

		try {

			Usuario usuarioConsultado = null;
			PreparedStatement stmt = this.connection.prepareStatement("select * from usuario where email = ? and senha = ?");
			stmt.setString(1, usuario.getEmail());
			stmt.setString(2, usuario.getSenha());
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				usuarioConsultado = montarObjeto(rs);
			}

			rs.close();
			stmt.close();

			return usuarioConsultado;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
}
