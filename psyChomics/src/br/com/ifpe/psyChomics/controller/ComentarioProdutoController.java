package br.com.ifpe.psyChomics.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.ifpe.psyChomics.dao.ComentarioProdutoDao;
import br.com.ifpe.psyChomics.dao.ProdutoDao;
import br.com.ifpe.psyChomics.dao.UsuarioDao;
import br.com.ifpe.psyChomics.model.ComentarioProduto;
import br.com.ifpe.psyChomics.model.Produto;
import br.com.ifpe.psyChomics.model.Usuario;


@Controller
public class ComentarioProdutoController {

	@RequestMapping("/exibircadastrarComentarioProduto")
	public String exibircadastrarComentarioProduto(Model model) {
		// Código para popular o combo de produto
		ProdutoDao dao = new ProdutoDao();
		List<Produto> listaProduto = dao.listar();
		model.addAttribute("listaProduto", listaProduto);
		
		// Código para popular o combo de usuario
		UsuarioDao dao2 = new UsuarioDao();
		List<Usuario> listaUsuario = dao2.listar();
		model.addAttribute("listaUsuario", listaUsuario);
		System.out.println("Exibindo cadastrar comentario do produto");
		return "comentarioProduto/cadastrarComentarioProduto";
	}

	@RequestMapping("cadastrarComentarioProduto")
	public String cadastrarComentarioProduto(ComentarioProduto comentarioProduto, Model model) {

		ComentarioProdutoDao dao = new ComentarioProdutoDao();
		dao.cadastrar(comentarioProduto);
		model.addAttribute("msg", "O comentario foi Inserido com Sucesso !");
		System.out.println("cadastro de comentario de produto");
		return "comentarioProduto/cadastrarComentarioProduto";
	}

	@RequestMapping("/exibirListarComentarioProduto")
	public String exibirListarComentarioProduto() {
		System.out.println("exibir listar de comentarios dos produtos");
		return "comentarioProduto/listarComentarioProduto";
	}

	@RequestMapping("/listarComentarioProduto")
	public String listarComentarioProduto(Model model) {

		ComentarioProdutoDao dao = new ComentarioProdutoDao();
		List<ComentarioProduto> listarComentarioProduto = dao.listar();
		model.addAttribute("listarComentarioProduto", listarComentarioProduto);

		return "comentarioProduto/listarComentarioProduto";
	}
	
	@RequestMapping("removerComentarioProduto")
	public String removerComentarioProduto(ComentarioProduto comentarioProduto, Model model) {
		ComentarioProdutoDao dao = new ComentarioProdutoDao();
		dao.remover(comentarioProduto);
		model.addAttribute("msg", "O comentario do produto foi removido com sucesso!");
		System.out.println("remover comentario do produto");
		return "comentarioProduto/listarComentarioProduto";
	}

	
	
}
