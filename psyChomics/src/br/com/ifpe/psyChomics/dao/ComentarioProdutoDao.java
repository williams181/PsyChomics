package br.com.ifpe.psyChomics.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.ifpe.psyChomics.model.ComentarioProduto;
import br.com.ifpe.psyChomics.model.Produto;
import br.com.ifpe.psyChomics.model.Usuario;
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

	public List<ComentarioProduto> listar() {

		try {
			List<ComentarioProduto> listarComentarioProduto = new ArrayList<ComentarioProduto>();
			PreparedStatement stmt = this.connection
					.prepareStatement("SELECT * FROM comentario_produto ORDER BY comentario");

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				listarComentarioProduto.add(montarObjeto(rs));
			}

			rs.close();
			stmt.close();
			connection.close();

			return listarComentarioProduto;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void remover(ComentarioProduto comentarioProduto) {

		try {
			PreparedStatement stmt = connection.prepareStatement("DELETE FROM comentario_produto WHERE id = ?");
			stmt.setLong(1, comentarioProduto.getId());
			stmt.execute();
			stmt.close();
			connection.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public ComentarioProduto buscarPorId(int id) {
		try {
			ComentarioProduto comentarioProdutoCompleto = new ComentarioProduto();
			PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM comentario_produto WHERE id =  ?");
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				comentarioProdutoCompleto.setId(rs.getInt("id"));
				comentarioProdutoCompleto.setData(rs.getDate("data"));
				comentarioProdutoCompleto.setComentario(rs.getString("comentario"));

				int idProduto = rs.getInt("produto_id");
				ProdutoDao dao = new ProdutoDao();
				Produto cp = dao.buscarPorId(idProduto);
				comentarioProdutoCompleto.setProduto(cp);

				int idUsuario = rs.getInt("usuario_id");
				UsuarioDao dao2 = new UsuarioDao();
				Usuario cp2 = dao2.buscarPorId(idUsuario);
				comentarioProdutoCompleto.setUsuario(cp2);

			}
			rs.close();
			stmt.close();
			connection.close();
			return comentarioProdutoCompleto;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}


	public void alterar(ComentarioProduto comentarioProduto) {

		String sql = "UPDATE comentario_produto SET comentario = ? WHERE id = ?";

		try {

			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, comentarioProduto.getComentario());
			stmt.setInt(2, comentarioProduto.getId());
			stmt.execute();
			stmt.close();
			connection.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	private ComentarioProduto montarObjeto(ResultSet rs) throws SQLException {

		ComentarioProduto comentarioProduto = new ComentarioProduto();
		comentarioProduto.setId(rs.getInt("id"));
		comentarioProduto.setData(rs.getDate("data"));
		comentarioProduto.setComentario(rs.getString("comentario"));
		return comentarioProduto;
	}
}
