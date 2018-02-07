package br.com.ifpe.psyChomics.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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

	public List<ComentarioProduto> listar() {
		try {
			List<ComentarioProduto> listaComentarioProduto = new ArrayList<ComentarioProduto>();
			PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM comentario_produto ORDER BY comentario");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				ComentarioProduto comentarioProduto = new ComentarioProduto();
				comentarioProduto.setId(rs.getInt("id"));
				comentarioProduto.setComentario(rs.getString("comentario"));

				listaComentarioProduto.add(comentarioProduto);
			}
			stmt.execute();
			connection.close();
			return listaComentarioProduto;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	
}
