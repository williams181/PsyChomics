package br.com.ifpe.psyChomics.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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

	public void cadastar(Usuario usuario) {

		String sql = "INSERT INTO usuario (email, senha, nick, nome_usuario, cpf) VALUES (?,?,?,?,?)";
		PreparedStatement stmt;

		try {
			stmt = connection.prepareStatement(sql);

			stmt.setString(1, usuario.getEmail());
			stmt.setString(2, usuario.getSenha());
			stmt.setString(3, usuario.getNick());
			stmt.setString(4, usuario.getNomeUsuario());
			stmt.setString(5, usuario.getCpf());

			stmt.execute();
			stmt.close();
			connection.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public List<Usuario> listar() {
		try {
			List<Usuario> listaUsuario = new ArrayList<Usuario>();
			PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM usuario ORDER BY nome_usuario");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Usuario usuario = new Usuario();
				usuario.setId(rs.getInt("id"));
				usuario.setEmail(rs.getString("email"));
				usuario.setNick(rs.getString("nick"));
				usuario.setSenha(rs.getString("senha"));
				usuario.setNomeUsuario(rs.getString("nome_usuario"));
				usuario.setCpf(rs.getString("cpf"));

				listaUsuario.add(usuario);
			}
			stmt.execute();
			connection.close();
			return listaUsuario;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
