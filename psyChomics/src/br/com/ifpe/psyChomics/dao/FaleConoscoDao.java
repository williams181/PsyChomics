package br.com.ifpe.psyChomics.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.ifpe.psyChomics.model.FaleConosco;
import br.com.ifpe.psyChomics.util.ConnectionFactory;

public class FaleConoscoDao {
	
	private Connection connection;

	public FaleConoscoDao() {

		try {
			this.connection = new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void salvar(FaleConosco faleConosco) {

		try {

			String sql = "INSERT INTO fale_conosco (nome_usuario, email, data, mensagem) VALUES (?,?,?,?)";
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, faleConosco.getNomeUsuario());	
			stmt.setString(2, faleConosco.getEmail());	
			stmt.setDate(3, new java.sql.Date(faleConosco.getData().getTime()));
			stmt.setString(4, faleConosco.getMensagem());	
			stmt.execute();
			stmt.close();
			connection.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<FaleConosco> listar() {

		try {
			List<FaleConosco> listarFaleConosco = new ArrayList<FaleConosco>();
			PreparedStatement stmt = this.connection
					.prepareStatement("SELECT * FROM fale_conosco ORDER BY email");

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				listarFaleConosco.add(montarObjeto(rs));
			}

			rs.close();
			stmt.close();
			connection.close();

			return listarFaleConosco;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void remover(FaleConosco faleConosco) {

		try {
			PreparedStatement stmt = connection.prepareStatement("DELETE FROM fale_conosco WHERE id = ?");
			stmt.setLong(1, faleConosco.getId());
			stmt.execute();
			stmt.close();
			connection.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public FaleConosco buscarPorId(int id) {
		try {
			FaleConosco faleConoscoCompleto = new FaleConosco();
			PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM comentario_produto WHERE id =  ?");
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				faleConoscoCompleto.setId(rs.getInt("id"));
				faleConoscoCompleto.setData(rs.getDate("data"));
				faleConoscoCompleto.setNomeUsuario(rs.getString("nome_usuario"));
				faleConoscoCompleto.setEmail(rs.getString("email"));
				faleConoscoCompleto.setMensagem(rs.getString("mensagem"));

			}
			rs.close();
			stmt.close();
			connection.close();
			return faleConoscoCompleto;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}


	public void alterar(FaleConosco faleConosco) {

		String sql = "UPDATE fale_conosco SET nome_usuario = ?, email = ?, mensagem = ? WHERE id = ?";

		try {

			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, faleConosco.getNomeUsuario());	
			stmt.setString(2, faleConosco.getEmail());	
			stmt.setDate(3, new java.sql.Date(faleConosco.getData().getTime()));
			stmt.setString(4, faleConosco.getMensagem());
			stmt.setInt(5, faleConosco.getId());
			stmt.execute();
			stmt.close();
			connection.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	private FaleConosco montarObjeto(ResultSet rs) throws SQLException {

		FaleConosco faleConosco = new FaleConosco();
		faleConosco.setId(rs.getInt("id"));
		faleConosco.setData(rs.getDate("data"));
		faleConosco.setNomeUsuario(rs.getString("nome_usuario"));
		faleConosco.setEmail(rs.getString("email"));
		faleConosco.setMensagem(rs.getString("mensagem"));
		return faleConosco;
	}

}
