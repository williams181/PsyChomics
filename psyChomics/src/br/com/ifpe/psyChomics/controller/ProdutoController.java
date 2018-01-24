package br.com.ifpe.psyChomics.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.ifpe.psyChomics.model.Produto;
import br.com.ifpe.psyChomics.model.ProdutoDao;


@Controller
public class ProdutoController {

	@RequestMapping("/exibirCadastroProduto")
	public String exibirCadastroProduto() {
		return "psyChomics/produto/cadastrarProduto";
	}
	
	@RequestMapping("cadastroProduto")
	public String cadastroProduto(Produto produto, Model model) {
		ProdutoDao dao = new ProdutoDao();
		dao.cadastar(produto);
		model.addAttribute("mensagem", "Produto Incluído com Sucesso");
		return "psyChomics/produto/cadastrarProduto";
	}
	
	@RequestMapping("/exibirlistarProduto")
	public String exibirlistarProduto() {
		return "psyChomics/produto/listarProduto";
	}

    @RequestMapping("removerProduto")
    public String removerProduto(Produto produto, Model model) {
    	ProdutoDao dao = new ProdutoDao();
    	dao.remover(produto);
    	model.addAttribute("msg", "Prodtuo removido com sucesso!");
    	
    	 return "psyChomics/produto/listarProduto";
    }
}
