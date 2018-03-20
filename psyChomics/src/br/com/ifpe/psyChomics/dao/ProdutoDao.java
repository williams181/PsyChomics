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
import br.com.ifpe.psyChomics.model.TipoProduto;
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
		String sql = "INSERT INTO produto (nome, preco, imagem, descricao, nacionalidade, categoria_id, genero_id, tipo_id) VALUES (?,?,?,?,?,?,?,?)";
		PreparedStatement stmt;
		try {
			stmt = connection.prepareStatement(sql);
			stmt.setString(1, produto.getNome());
			stmt.setDouble(2, produto.getPreco());
			stmt.setString(3, produto.getImagem());
			stmt.setString(4, produto.getDescricao());
			stmt.setString(5, produto.getNacionalidade());
			stmt.setInt(6, produto.getCategoriaProduto().getId());
			stmt.setInt(7, produto.getGeneroProduto().getId());
			stmt.setInt(8, produto.getTipoProduto().getId());
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

				int idCategoria = rs.getInt("categoria_id");
				CategoriaProdutoDao dao = new CategoriaProdutoDao();
				CategoriaProduto cp = dao.buscarPorId(idCategoria);
				produto.setCategoriaProduto(cp);

				int idGenero = rs.getInt("genero_id");
				GeneroProdutoDao dao2 = new GeneroProdutoDao();
				GeneroProduto cp2 = dao2.buscarPorId(idGenero);
				produto.setGeneroProduto(cp2);

				int idTipo = rs.getInt("tipo_id");
				TipoProdutoDao dao3 = new TipoProdutoDao();
				TipoProduto cp3 = dao3.buscarPorId(idTipo);
				produto.setTipoProduto(cp3);

				produto.setNome(rs.getString("nome"));
				produto.setPreco(rs.getDouble("preco"));
				produto.setImagem(rs.getString("imagem"));
				produto.setDescricao(rs.getString("descricao"));
				produto.setNacionalidade(rs.getString("nacionalidade"));
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

				int idCategoria = rs.getInt("categoria_id");
				CategoriaProdutoDao dao = new CategoriaProdutoDao();
				CategoriaProduto cp = dao.buscarPorId(idCategoria);
				produtoCompleto.setCategoriaProduto(cp);

				int idGenero = rs.getInt("genero_id");
				GeneroProdutoDao dao2 = new GeneroProdutoDao();
				GeneroProduto cp2 = dao2.buscarPorId(idGenero);
				produtoCompleto.setGeneroProduto(cp2);

				int idTipo = rs.getInt("tipo_id");
				TipoProdutoDao dao3 = new TipoProdutoDao();
				TipoProduto cp3 = dao3.buscarPorId(idTipo);
				produtoCompleto.setTipoProduto(cp3);
				
				produtoCompleto.setNome(rs.getString("nome"));
				produtoCompleto.setPreco(rs.getDouble("preco"));
				produtoCompleto.setImagem(rs.getString("imagem"));
				produtoCompleto.setDescricao(rs.getString("descricao"));
				produtoCompleto.setNacionalidade(rs.getString("nacionalidade"));
			}
			rs.close();
			stmt.close();
			connection.close();
			return produtoCompleto;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public Produto descricaoPorId(int id) {
		try {
			Produto produtoCompleto = new Produto();
			PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM produto WHERE id =  ?");
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				produtoCompleto.setId(rs.getInt("id"));

				int idCategoria = rs.getInt("categoria_id");
				CategoriaProdutoDao dao = new CategoriaProdutoDao();
				CategoriaProduto cp = dao.buscarPorId(idCategoria);
				produtoCompleto.setCategoriaProduto(cp);

				int idGenero = rs.getInt("genero_id");
				GeneroProdutoDao dao2 = new GeneroProdutoDao();
				GeneroProduto cp2 = dao2.buscarPorId(idGenero);
				produtoCompleto.setGeneroProduto(cp2);
				
				int idTipo = rs.getInt("tipo_id");
				TipoProdutoDao dao3 = new TipoProdutoDao();
				TipoProduto cp3 = dao3.buscarPorId(idTipo);
				produtoCompleto.setTipoProduto(cp3);

				produtoCompleto.setNome(rs.getString("nome"));
				produtoCompleto.setPreco(rs.getDouble("preco"));
				produtoCompleto.setImagem(rs.getString("imagem"));
				produtoCompleto.setDescricao(rs.getString("descricao"));
				produtoCompleto.setNacionalidade(rs.getString("nacionalidade"));

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
		String sql = "UPDATE produto SET nome = ?, preco = ?, descricao = ? WHERE id = ?";
		PreparedStatement stmt;
		try {
			stmt = connection.prepareStatement(sql);
			stmt.setString(1, produto.getNome());
			stmt.setDouble(2, produto.getPreco());
			stmt.setString(3, produto.getDescricao());
			stmt.setInt(4, produto.getId());
			stmt.execute();
			connection.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<Produto> buscar(Produto prod) {

		try {
			List<Produto> buscarProduto = new ArrayList<Produto>();
			PreparedStatement stmt = this.connection
					.prepareStatement("SELECT * FROM produto WHERE nome like ? or genero_id like ?");
			stmt.setString(1, "%" + prod.getNome() + "%");
			stmt.setString(2, "%" + prod.getGeneroProduto() + "%");
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {

				Produto produto = new Produto();
				produto.setId(rs.getInt("id"));

				int idCategoria = rs.getInt("categoria_id");
				CategoriaProdutoDao dao = new CategoriaProdutoDao();
				CategoriaProduto cp = dao.buscarPorId(idCategoria);
				produto.setCategoriaProduto(cp);

				int idGenero = rs.getInt("genero_id");
				GeneroProdutoDao dao2 = new GeneroProdutoDao();
				GeneroProduto cp2 = dao2.buscarPorId(idGenero);
				produto.setGeneroProduto(cp2);

				int idTipo = rs.getInt("tipo_id");
				TipoProdutoDao dao3 = new TipoProdutoDao();
				TipoProduto cp3 = dao3.buscarPorId(idTipo);
				produto.setTipoProduto(cp3);

				produto.setNome(rs.getString("nome"));
				produto.setPreco(rs.getDouble("preco"));
				produto.setImagem(rs.getString("imagem"));
				produto.setDescricao(rs.getString("descricao"));

				buscarProduto.add(produto);
			}
			rs.close();
			stmt.close();
			connection.close();
			return buscarProduto;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<Produto> listarIndex() {
		try {
			List<Produto> listarProdutoIndex = new ArrayList<Produto>();
			PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM produto where nacionalidade like '%nacional%' ORDER BY nome limit 4");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Produto produto = new Produto();
				produto.setId(rs.getInt("id"));
				produto.setNome(rs.getString("nome"));
				produto.setPreco(rs.getDouble("preco"));
				produto.setImagem(rs.getString("imagem"));
				produto.setDescricao(rs.getString("descricao"));
				produto.setNacionalidade(rs.getString("nacionalidade"));
				listarProdutoIndex.add(produto);
			}
			stmt.execute();
			connection.close();
			return listarProdutoIndex;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public List<Produto> listarIndex2() {
		try {
			List<Produto> listarProdutoIndex = new ArrayList<Produto>();
			PreparedStatement stmt = this.connection.prepareStatement("SELECT * FROM produto where nacionalidade like '%importado%' ORDER BY nome limit 4");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Produto produto = new Produto();
				produto.setId(rs.getInt("id"));
				produto.setNome(rs.getString("nome"));
				produto.setPreco(rs.getDouble("preco"));
				produto.setImagem(rs.getString("imagem"));
				produto.setDescricao(rs.getString("descricao"));
				produto.setNacionalidade(rs.getString("nacionalidade"));
				listarProdutoIndex.add(produto);
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

				int idCategoria = rs.getInt("categoria_id");
				CategoriaProdutoDao dao = new CategoriaProdutoDao();
				CategoriaProduto cp = dao.buscarPorId(idCategoria);
				produto.setCategoriaProduto(cp);

				int idGenero = rs.getInt("genero_id");
				GeneroProdutoDao dao2 = new GeneroProdutoDao();
				GeneroProduto cp2 = dao2.buscarPorId(idGenero);
				produto.setGeneroProduto(cp2);

				int idTipo = rs.getInt("tipo_id");
				TipoProdutoDao dao3 = new TipoProdutoDao();
				TipoProduto cp3 = dao3.buscarPorId(idTipo);
				produto.setTipoProduto(cp3);
				
				produto.setNome(rs.getString("nome"));
				produto.setPreco(rs.getDouble("preco"));
				produto.setImagem(rs.getString("imagem"));
				produto.setDescricao(rs.getString("descricao"));
				produto.setNacionalidade(rs.getString("nacionalidade"));
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
