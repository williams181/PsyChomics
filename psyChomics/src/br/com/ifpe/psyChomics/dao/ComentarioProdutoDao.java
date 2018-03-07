package br.com.ifpe.psyChomics.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import br.com.ifpe.psyChomics.model.ComentarioProduto;
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

	public void salvar(ComentarioProduto comentarioProduto) {

		try {

			String sql = "INSERT INTO comentario_produto (data, comentario, usuario_id, produto_id) VALUES (?,?,?,?)";
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setDate(1, new java.sql.Date(comentarioProduto.getData().getTime()));
			stmt.setString(2, comentarioProduto.getComentario());
			stmt.setInt(3, comentarioProduto.getUsuario().getId());
			stmt.setInt(4, comentarioProduto.getProduto().getId());
			stmt.execute();
			stmt.close();
			connection.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
