package br.com.ifpe.psyChomics.controller;

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

}
