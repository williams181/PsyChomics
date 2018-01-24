package br.com.ifpe.psyChomics.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProdutoController {

	@RequestMapping("/exibirCadastroProduto")
	public String exibirCadastroProduto() {
		return "psyChomics/produto/cadastrarProduto";
	}
}
