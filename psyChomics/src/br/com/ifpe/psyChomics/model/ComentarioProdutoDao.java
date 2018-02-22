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

	public void cadastrar(ComentarioProduto comentarioProduto) {

		String sql = "INSERT INTO comentario_produto (idusuario, idproduto, data, comentario) VALUES (?,?,?,?)";
		PreparedStatement stmt;

		try {
			stmt = connection.prepareStatement(sql);
			
			stmt.setInt(1, comentarioProduto.getUsuario().getId());
			stmt.setInt(2, comentarioProduto.getProduto().getId());
			stmt.setDate(3, new java.sql.Date(comentarioProduto.getData().getTime()));
			stmt.setString(4, comentarioProduto.getComentario());

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
				
				int idUsuario = rs.getInt("idusuario");
				UsuarioDao dao = new UsuarioDao();
				Usuario cp = dao.buscarPorId(idUsuario);
				comentarioProduto.setUsuario(cp);
				
				int idProduto = rs.getInt("idproduto");
				ProdutoDao dao2 = new ProdutoDao();
				Produto cp2 = dao2.buscarPorId(idProduto);
				comentarioProduto.setProduto(cp2);
				
				comentarioProduto.setData(rs.getDate("data"));

				listaComentarioProduto.add(comentarioProduto);
			}
			stmt.execute();
			connection.close();
			return listaComentarioProduto;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public ComentarioProduto buscarPorId(int id) {

		try {

			ComentarioProduto ComentarioProdutoCompleto = new ComentarioProduto();

			PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM comentario_produto WHERE id =  ?");
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {

				ComentarioProdutoCompleto.setId(rs.getInt("id"));
				ComentarioProdutoCompleto.setComentario(rs.getString("comentario"));
				
				int idUsuario = rs.getInt("idusuario");
				UsuarioDao dao = new UsuarioDao();
				Usuario cp = dao.buscarPorId(idUsuario);
				ComentarioProdutoCompleto.setUsuario(cp);
				
				int idProduto = rs.getInt("idproduto");
				ProdutoDao dao2 = new ProdutoDao();
				Produto cp2 = dao2.buscarPorId(idProduto);
				ComentarioProdutoCompleto.setProduto(cp2);
				
				ComentarioProdutoCompleto.setData(rs.getDate("data"));

			}

			rs.close();
			stmt.close();
			connection.close();

			return ComentarioProdutoCompleto;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
