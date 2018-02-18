package br.com.ifpe.psyChomics.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.ifpe.psyChomics.model.ComentarioProduto;
import br.com.ifpe.psyChomics.model.ComentarioProdutoDao;

public class ComentarioProdutoController {

	@RequestMapping("/exibirCadastroComentarioProduto")
	public String exibirCadastroComentarioProduto() {

		return "PsyChomics/comentarioProduto/cadastrarComentarioProduto";
	}

	@RequestMapping("cadastrarComentarioProduto")
	public String cadastrarComentarioProduto(ComentarioProduto comentarioProduto, Model model) {

		ComentarioProdutoDao dao = new ComentarioProdutoDao();
		dao.cadastrar(comentarioProduto);
		model.addAttribute("msg", "O comentario " + comentarioProduto.getComentario() + " foi Inserido com Sucesso !");

		return "forward:listarComentarioProduto";
	}
}
