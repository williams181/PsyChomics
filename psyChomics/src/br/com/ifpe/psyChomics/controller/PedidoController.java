package br.com.ifpe.psyChomics.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.ifpe.psyChomics.dao.PedidoDao;
import br.com.ifpe.psyChomics.model.Pedido;

@Controller
public class PedidoController  {

	@RequestMapping("/exibircadastrarPedido")
	public String exibircadastrarPedido() {
		System.out.println("Exibindo cadastrar pedido");
		return "pedido/cadastrarPedido";
	}

	@RequestMapping("cadastrarPedido")
	public String cadastrarPedido(Pedido pedido, Model model) {

		PedidoDao dao = new PedidoDao();
		dao.cadastrar(pedido);
		model.addAttribute("msg", "O pedido foi Inserido com Sucesso !");
		System.out.println("cadastro de pedido");
		return "pedido/cadastrarPedido";
	}

	@RequestMapping("/exibirListarPedido")
	public String exibirListarPedido() {
		System.out.println("exibir lista de pedidos dos produtos");
		return "pedido/listarPedido";
	}

	@RequestMapping("/listarPedido")
	public String listarPedido(Model model) {

		PedidoDao dao = new PedidoDao();
		List<Pedido> listaPedido = dao.listar();
		model.addAttribute("listaPedido", listaPedido);

		return "pedido/listarPedido";
	}
	
	@RequestMapping("removerPedido")
	public String removerPedido(Pedido pedido, Model model) {
		PedidoDao dao = new PedidoDao();
		dao.remover(pedido);
		model.addAttribute("msg", "O pedido do produto foi removido com sucesso!");
		System.out.println("remover pedido do produto");
		return "pedido/listarPedido";
	}
}
