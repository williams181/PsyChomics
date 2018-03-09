package br.com.ifpe.psyChomics.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.ifpe.psyChomics.model.TipoProduto;
import br.com.ifpe.psyChomics.util.ConnectionFactory;



public class TipoProdutoDao {

    private Connection connection;

    public TipoProdutoDao() {

	try {
	    this.connection = new ConnectionFactory().getConnection();
	} catch (SQLException e) {
	    throw new RuntimeException(e);
	}
    }

    public void salvar(TipoProduto tipoProduto) {

	try {

	    String sql = "INSERT INTO tipo_produto (descricao) VALUES (?)";
	    PreparedStatement stmt = connection.prepareStatement(sql);
	    stmt.setString(1, tipoProduto.getDescricao());
	    stmt.execute();
	    stmt.close();
	    connection.close();

	} catch (SQLException e) {
	    throw new RuntimeException(e);
	}
    }

    public List<TipoProduto> listar() {

	try {
	    List<TipoProduto> listarTipoProduto = new ArrayList<TipoProduto>();
	    PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM tipo_produto ORDER BY descricao");

	    ResultSet rs = stmt.executeQuery();

	    while (rs.next()) {
	    	listarTipoProduto.add(montarObjeto(rs));
	    }

	    rs.close();
	    stmt.close();
	    connection.close();

	    return listarTipoProduto;

	} catch (SQLException e) {
	    throw new RuntimeException(e);
	}
    }

    public void remover(TipoProduto tipoProduto) {

	try {
	    PreparedStatement stmt = connection.prepareStatement("DELETE FROM tipo_produto WHERE id = ?");
	    stmt.setLong(1, tipoProduto.getId());
	    stmt.execute();
	    stmt.close();
	    connection.close();
	} catch (SQLException e) {
	    throw new RuntimeException(e);
	}
    }

    public TipoProduto buscarPorId(int id) {

	try {
	    PreparedStatement stmt = connection.prepareStatement("SELECT * FROM tipo_produto WHERE id = ?");
	    stmt.setInt(1, id);
	    ResultSet rs = stmt.executeQuery();

	    TipoProduto tipoProduto = null;
	    if (rs.next()) {
		tipoProduto = montarObjeto(rs);
	    }

	    rs.close();
	    stmt.close();
	    connection.close();
	    return tipoProduto;

	} catch (SQLException e) {
	    throw new RuntimeException(e);
	}
    }

    public void alterar(TipoProduto tipoProduto) {

	String sql = "UPDATE tipo_produto SET descricao = ? WHERE id = ?";

	try {

	    PreparedStatement stmt = connection.prepareStatement(sql);
	    stmt.setString(1, tipoProduto.getDescricao());
	    stmt.setInt(2, tipoProduto.getId());
	    stmt.execute();
	    stmt.close();
	    connection.close();

	} catch (SQLException e) {
	    throw new RuntimeException(e);
	}
    }

    private TipoProduto montarObjeto(ResultSet rs) throws SQLException {

    	TipoProduto tipoProduto = new TipoProduto();
    	tipoProduto.setId(rs.getInt("id"));
    	tipoProduto.setDescricao(rs.getString("descricao"));

	return tipoProduto;
    }
}
