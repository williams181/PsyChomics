package br.com.ifpe.psyChomics.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.ifpe.psyChomics.dao.ComentarioProdutoDao;
import br.com.ifpe.psyChomics.model.ComentarioProduto;

@Controller
public class ComentarioProdutoController {

	@RequestMapping("CadastrarComentarioProduto")
	public String CadastrarComentarioProduto(ComentarioProduto comentarioProduto, Model model) {
		ComentarioProdutoDao dao = new ComentarioProdutoDao();
		dao.salvar(comentarioProduto);
		model.addAttribute("msg", "O comentario do produto Incluido com Sucesso");
		return "index";
	}
}
