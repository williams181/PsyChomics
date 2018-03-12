package br.com.ifpe.psyChomics.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.ifpe.psyChomics.dao.ProdutoDao;
import br.com.ifpe.psyChomics.model.Carrinho;
import br.com.ifpe.psyChomics.model.Item;
import br.com.ifpe.psyChomics.model.Produto;

@Controller
public class CarrinhoController {

	@RequestMapping("/exibirIncluirProdutoCarrinho")
	public String exibirIncluirProdutoCarrinho(Integer id, HttpSession session, Model model) {

		ProdutoDao dao = new ProdutoDao();
		Produto produtoPreenchido = dao.buscarPorId(id);
		Carrinho carrinho = (Carrinho) session.getAttribute("carrinho");
		if (carrinho == null) {
			carrinho = new Carrinho();
		}
		Item item = new Item();
		item.setProduto(produtoPreenchido);
		item.setCarrinho(carrinho);
		item.setQuantidade(1);
		carrinho.getItens().add(item);

		return "carrinho/IncluirProdutoCarrinho";
	}
}
