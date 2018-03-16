package br.com.ifpe.psyChomics.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import br.com.ifpe.psyChomics.dao.ProdutoDao;
import br.com.ifpe.psyChomics.model.ItemCarrinho;
import br.com.ifpe.psyChomics.model.Produto;

@Controller
public class CarrinhoController {

    @RequestMapping("/exibirAdicionarCarrinho")
    public String exibirAdicionarCarrinho(Produto produto, Model model) {

	ProdutoDao dao = new ProdutoDao();
	Produto produtoCompleto = dao.buscarPorId(produto.getId());
	model.addAttribute("p", produtoCompleto);

	return "produto/adicionarCarrinho";
    }
    
    @RequestMapping("/adicionarAoCarrinho")
    public String adicionarAoCarrinho(@RequestParam("id") String id, @RequestParam("quantidade") String qtd, HttpSession session, Model model) {

	ProdutoDao dao = new ProdutoDao();
	Produto produtoCompleto = dao.buscarPorId(Integer.valueOf(id));

	List<ItemCarrinho> listaCarrinho = (List<ItemCarrinho>) session.getAttribute("listaCarrinho");
	if (listaCarrinho != null) {

	    ItemCarrinho item = new ItemCarrinho();
	    item.setProduto(produtoCompleto);
	    item.setQuantidade(Integer.valueOf(qtd));

	    listaCarrinho.add(item);

	} else {

	    ItemCarrinho item = new ItemCarrinho();
	    item.setProduto(produtoCompleto);
	    item.setQuantidade(Integer.valueOf(qtd));

	    listaCarrinho = new ArrayList<ItemCarrinho>();
	    listaCarrinho.add(item);
	}

	session.setAttribute("listaCarrinho", listaCarrinho);

	model.addAttribute("msg", "Produto Adicionado ao Carrinho!");
	return "forward:exibirCarrinho";
    }

    @RequestMapping("/exibirCarrinho")
    public String exibirCarrinho(HttpSession session, Model model) {

	List<ItemCarrinho> listaCarrinho = (List<ItemCarrinho>) session.getAttribute("listaCarrinho");

	if (listaCarrinho != null) {

	    double valorTotal = 0;

	    for (ItemCarrinho item : listaCarrinho) {
		valorTotal = valorTotal + (item.getProduto().getPreco() * item.getQuantidade());
	    }

	    model.addAttribute("valorTotal", valorTotal);
	}

	return "produto/listarCarrinho";
    }
}
