package br.com.ifpe.psyChomics.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.ifpe.psyChomics.model.CategoriaProduto;
import br.com.ifpe.psyChomics.model.GeneroProduto;
import br.com.ifpe.psyChomics.model.Produto;
import br.com.ifpe.psyChomics.util.ConnectionFactory;

public class ProdutoDao {

	private Connection connection;

	public ProdutoDao() {
		try {
			this.connection = new ConnectionFactory().getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void cadastrar(Produto produto) {
		String sql = "INSERT INTO produto (codigo, nome, preco, imagem, descricao, categoria_id, genero_id) VALUES (?,?,?,?,?,?,?)";
		PreparedStatement stmt;
		try {
			stmt = connection.prepareStatement(sql);
			stmt.setString(1, produto.getCodigo());
			stmt.setString(2, produto.getNome());
			stmt.setDouble(3, produto.getPreco());
			stmt.setString(4, produto.getImagem());
			stmt.setString(5, produto.getDescricao());
			stmt.setInt(6, produto.getCategoriaProduto().getId());
			stmt.setInt(7, produto.getGeneroProduto().getId());
			stmt.execute();
			stmt.close();
			connection.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<Produto> listar() {
		try {
			List<Produto> listarProduto = new ArrayList<Produto>();
			PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM produto ORDER BY nome");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Produto produto = new Produto();
				produto.setId(rs.getInt("id"));
				produto.setCodigo(rs.getString("codigo"));

				int idCategoria = rs.getInt("categoria_id");
				CategoriaProdutoDao dao = new CategoriaProdutoDao();
				CategoriaProduto cp = dao.buscarPorId(idCategoria);
				produto.setCategoriaProduto(cp);
				
				int idGenero = rs.getInt("genero_id");
				GeneroProdutoDao dao2 = new GeneroProdutoDao();
				GeneroProduto cp2 = dao2.buscarPorId(idGenero);
				produto.setGeneroProduto(cp2);
		
				produto.setNome(rs.getString("nome"));
				produto.setPreco(rs.getDouble("preco"));
				produto.setImagem(rs.getString("imagem"));
				produto.setDescricao(rs.getString("descricao"));
				listarProduto.add(produto);
			}
			stmt.execute();
			connection.close();
			return listarProduto;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void remover(Produto produto) {
		String sql = "DELETE FROM produto WHERE id = ?";
		PreparedStatement stmt;
		try {
			stmt = connection.prepareStatement(sql);
			stmt.setInt(1, produto.getId());
			stmt.execute();
			connection.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public Produto buscarPorId(int id) {
		try {
			Produto produtoCompleto = new Produto();
			PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM produto WHERE id =  ?");
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				produtoCompleto.setId(rs.getInt("id"));
				produtoCompleto.setCodigo(rs.getString("codigo"));

				int idCategoria = rs.getInt("categoria_id");
				CategoriaProdutoDao dao = new CategoriaProdutoDao();
				CategoriaProduto cp = dao.buscarPorId(idCategoria);
				produtoCompleto.setCategoriaProduto(cp);
				
				int idGenero = rs.getInt("genero_id");
				GeneroProdutoDao dao2 = new GeneroProdutoDao();
				GeneroProduto cp2 = dao2.buscarPorId(idGenero);
				produtoCompleto.setGeneroProduto(cp2);

				produtoCompleto.setNome(rs.getString("nome"));
				produtoCompleto.setPreco(rs.getDouble("preco"));
				;
				produtoCompleto.setImagem(rs.getString("imagem"));
				produtoCompleto.setDescricao(rs.getString("descricao"));
			}
			rs.close();
			stmt.close();
			connection.close();
			return produtoCompleto;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void alterar(Produto produto) {
		String sql = "UPDATE produto SET codigo = ?, nome = ?, preco = ?, descricao = ? WHERE id = ?";
		PreparedStatement stmt;
		try {
			stmt = connection.prepareStatement(sql);
			stmt.setString(1, produto.getCodigo());
			stmt.setString(2, produto.getNome());
			stmt.setDouble(3, produto.getPreco());
			stmt.setString(4, produto.getDescricao());
			stmt.setInt(5, produto.getId());
			stmt.execute();
			connection.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<Produto> buscar(Produto p) {
		try {
			List<Produto> listarProduto = new ArrayList<Produto>();
			PreparedStatement stmt;
			String sql;

			if ((p.getDescricao() != null && !p.getDescricao().equals("")) && (p.getCategoriaProduto() == null)) {

				sql = "SELECT * FROM produto WHERE descricao like ? ORDER BY descricao";
				stmt = this.connection.prepareStatement(sql);
				stmt.setString(1, "%" + p.getDescricao() + "%");

			} else if ((p.getDescricao() == null || p.getDescricao().equals("")) && (p.getCategoriaProduto() != null)) {

				sql = "SELECT * FROM produto WHERE categoria_id = ? ORDER BY descricao";
				stmt = this.connection.prepareStatement(sql);
				stmt.setInt(1, p.getCategoriaProduto().getId());

			} else if ((p.getDescricao() != null && !p.getDescricao().equals(""))
					&& (p.getCategoriaProduto() != null)) {

				sql = "SELECT * FROM produto WHERE descricao like ? AND categoria_id = ? ORDER BY descricao";
				stmt = this.connection.prepareStatement(sql);
				stmt.setString(1, "%" + p.getDescricao() + "%");
				stmt.setInt(2, p.getCategoriaProduto().getId());

			} else {

				sql = "SELECT * FROM produto ORDER BY descricao";
				stmt = this.connection.prepareStatement(sql);
			}

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {

				Produto produto = new Produto();
				produto.setId(rs.getInt("id"));
				produto.setCodigo(rs.getString("codigo"));

				int idCategoria = rs.getInt("categoria_id");
				CategoriaProdutoDao dao = new CategoriaProdutoDao();
				CategoriaProduto cp = dao.buscarPorId(idCategoria);
				produto.setCategoriaProduto(cp);
				
				int idGenero = rs.getInt("genero_id");
				GeneroProdutoDao dao2 = new GeneroProdutoDao();
				GeneroProduto cp2 = dao2.buscarPorId(idGenero);
				produto.setGeneroProduto(cp2);

				produto.setNome(rs.getString("nome"));
				produto.setPreco(rs.getDouble("preco"));
				produto.setImagem(rs.getString("imagem"));
				produto.setDescricao(rs.getString("descricao"));

				listarProduto.add(produto);
			}
			rs.close();
			stmt.close();
			connection.close();
			return listarProduto;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<Produto> listarIndex() {
		try {
			List<Produto> listarProdutoIndex = new ArrayList<Produto>();
			PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM produto ORDER BY nome");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Produto prouto = new Produto();
				prouto.setCodigo(rs.getString("codigo"));
				prouto.setId(rs.getInt("id"));
				prouto.setNome(rs.getString("nome"));
				prouto.setPreco(rs.getDouble("preco"));
				prouto.setImagem(rs.getString("imagem"));
				prouto.setDescricao(rs.getString("descricao"));
				listarProdutoIndex.add(prouto);
			}
			stmt.execute();
			connection.close();
			return listarProdutoIndex;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<Produto> listarDescricao() {
		try {
			List<Produto> listarDescricaoProduto = new ArrayList<Produto>();
			PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM produto ORDER BY descricao");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Produto produto = new Produto();
				produto.setId(rs.getInt("id"));
				produto.setCodigo(rs.getString("codigo"));

				int idCategoria = rs.getInt("categoria_id");
				CategoriaProdutoDao dao = new CategoriaProdutoDao();
				CategoriaProduto cp = dao.buscarPorId(idCategoria);
				produto.setCategoriaProduto(cp);

				produto.setNome(rs.getString("nome"));
				produto.setPreco(rs.getDouble("preco"));
				produto.setImagem(rs.getString("imagem"));
				produto.setDescricao(rs.getString("descricao"));
				listarDescricaoProduto.add(produto);
			}
			stmt.execute();
			connection.close();
			return listarDescricaoProduto;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
