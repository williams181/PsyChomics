package br.com.ifpe.psyChomics.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.ifpe.psyChomics.model.ComentarioProduto;
import br.com.ifpe.psyChomics.model.ComentarioProdutoDao;

@Controller
public class ComentarioProdutoController {

	@RequestMapping("/exibirCadastroComentarioProduto")
	public String exibirCadastroComentarioProduto() {
		return "psyChomics/produto/cadastrarComentarioProduto";
	}

	@RequestMapping("CadastroComentarioProduto")
	public String CadastroComentarioProduto(ComentarioProduto comentarioProduto, Model model) {

		ComentarioProdutoDao dao = new ComentarioProdutoDao();
		dao.cadastar(comentarioProduto);
		model.addAttribute("mensagem", "Comentario do Produto Incluido com Sucesso");
		return "psyChomics/produto/cadastrarComentarioProduto";
	}

	@RequestMapping("/exibirlistarComentarioProduto")
	public String exibirlistarComentarioProduto(Model model) {
		//Código para popular o combo de comentario de produto
		ComentarioProdutoDao dao = new ComentarioProdutoDao();
		List<ComentarioProduto> listaComentarioProduto = dao.listar();
		model.addAttribute("listaComentarioProduto", listaComentarioProduto);

		return "psyChomics/produto/listarComentarioProduto";
	}

}
