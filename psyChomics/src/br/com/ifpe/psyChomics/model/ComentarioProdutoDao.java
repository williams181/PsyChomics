package br.com.ifpe.psyChomics.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import br.com.ifpe.psyChomics.util.ConnectionFactory;

public class ComentarioProdutoDao {

	
	private Connection connection;

	public ComentarioProdutoDao() {

		try {
			this.connection = new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void cadastar(ComentarioProduto comentarioProduto) {

		String sql = "INSERT INTO comentario_produto (comentario) VALUES (?)";
		PreparedStatement stmt;

		try {
			stmt = connection.prepareStatement(sql);

			stmt.setString(1, comentarioProduto.getComentario());


			stmt.execute();
			stmt.close();
			connection.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	
}
