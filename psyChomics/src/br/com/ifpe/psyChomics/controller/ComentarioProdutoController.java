package br.com.ifpe.psyChomics.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.ifpe.psyChomics.model.ComentarioProduto;
import br.com.ifpe.psyChomics.model.ComentarioProdutoDao;
import br.com.ifpe.psyChomics.model.Produto;
import br.com.ifpe.psyChomics.model.ProdutoDao;


@Controller
public class ComentarioProdutoController {

	@RequestMapping("/exibircadastrarComentarioProduto")
	public String exibircadastrarComentarioProduto(Model model) {
		// Código para popular o combo de produto
		ProdutoDao dao = new ProdutoDao();
		List<Produto> listaProduto = dao.listar();
		model.addAttribute("listaProduto", listaProduto);
		System.out.println("Exibindo cadastrar comentario do produto");
		return "psyChomics/produto/cadastrarComentarioProduto";
	}

	@RequestMapping("cadastrarComentarioProduto")
	public String cadastrarComentarioProduto(ComentarioProduto comentarioProduto, Model model) {

		ComentarioProdutoDao dao = new ComentarioProdutoDao();
		dao.cadastrar(comentarioProduto);
		model.addAttribute("msg", "O comentario " + comentarioProduto.getComentario() + " foi Inserido com Sucesso !");
		System.out.println("cadastro de comentario de produto");
		return "psyChomics/produto/cadastrarComentarioProduto";
	}

	@RequestMapping("/exibirListarComentarioProduto")
	public String exibirListarComentarioProduto() {
		System.out.println("exibir listar de comentarios dos produtos");
		return "psyChomics/produto/listarComentarioProduto";
	}

	@RequestMapping("/listarComentarioProduto")
	public String listarComentarioProduto(Model model) {

		ComentarioProdutoDao dao = new ComentarioProdutoDao();
		List<ComentarioProduto> listaComentarioProduto = dao.listar();
		model.addAttribute("listaComentarioProduto", listaComentarioProduto);

		return "psyChomics/produto/listarComentarioProduto";
	}
}
