package br.com.ifpe.psyChomics.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import br.com.ifpe.psyChomics.dao.ProdutoDao;
import br.com.ifpe.psyChomics.dao.VendaHibernateDao;
import br.com.ifpe.psyChomics.model.ItemCarrinho;
import br.com.ifpe.psyChomics.model.ItemVenda;
import br.com.ifpe.psyChomics.model.Produto;
import br.com.ifpe.psyChomics.model.Usuario;
import br.com.ifpe.psyChomics.model.Venda;

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
	public String adicionarAoCarrinho(@RequestParam("id") String id, @RequestParam("quantidade") String qtd,
			HttpSession session, Model model) {

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

	@RequestMapping("/concluirVenda")
	public String concluirVenda(HttpSession session, Model model) {

		List<ItemCarrinho> listaCarrinho = (List<ItemCarrinho>) session.getAttribute("listaCarrinho");

		if (listaCarrinho != null) {

			Venda venda = new Venda();
			venda.setUsuario((Usuario) session.getAttribute("usuarioLogado"));
			venda.setDataVenda(new Date());

			List<ItemVenda> itensVenda = new ArrayList<ItemVenda>();
			for (ItemCarrinho itemCarrinho : listaCarrinho) {

				venda.setValorTotal(venda.getValorTotal() + (itemCarrinho.getProduto().getPreco() * itemCarrinho.getQuantidade()));

				ItemVenda itemVenda = new ItemVenda();
				itemVenda.setProduto(itemCarrinho.getProduto());
				itemVenda.setQuantidade(itemCarrinho.getQuantidade());
				itemVenda.setValor(itemCarrinho.getProduto().getPreco());
				itemVenda.setVenda(venda);
				itensVenda.add(itemVenda);
			}

			venda.setListaItens(itensVenda);

			VendaHibernateDao dao = new VendaHibernateDao();
			dao.inserir(venda);
			model.addAttribute("msg", "Compra realizada com sucesso!");

		} else {

			model.addAttribute("msg", "N�o h� itens adicionados ao carrinho");
		}

		return "forward:listarProduto";
	}
}
