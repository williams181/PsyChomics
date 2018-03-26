package br.com.ifpe.psyChomics.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.ifpe.psyChomics.dao.PedidoDao;
import br.com.ifpe.psyChomics.model.Pedido;
import br.com.ifpe.psyChomics.model.Usuario;




@Controller
public class PedidoController {
	
	@RequestMapping("/exibirPedido")
	public String exibirPedido() {

		return "pedido/cadastrarPedido";
	}

	@RequestMapping("cadastrarPedido")
	public String cadastrarPedido(Pedido pedido, HttpSession session, Model model) {
		pedido.setData(new Date());
		PedidoDao dao = new PedidoDao();
		Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
		pedido.setUsuario(usuario);
		dao.salvar(pedido);
		model.addAttribute("msg", "O Pedido do produto foi Inserido com Sucesso!");

		return "pedido/cadastrarPedido";
	}

	@RequestMapping("listarPedido")
	public String listarPedido(Model model) {

		PedidoDao dao = new PedidoDao();
		List<Pedido> listarPedido = dao.listar();
		model.addAttribute("listarPedido", listarPedido);

		return "pedido/pesquisarPedido";
	}

	@RequestMapping("removerPedido")
	public String removerPedido(Pedido pedido, Model model) {

		PedidoDao dao = new PedidoDao();
		dao.remover(pedido);
		model.addAttribute("msg", "O pedido de produto foi Removido com Sucesso !");

		return "forward:listarPedido";
	}

	@RequestMapping("/exibirAlterarPedido")
	public String exibirAlterarPedido(Pedido pedido, Model model) {

		PedidoDao dao = new PedidoDao();
		Pedido pedidoPreenchido = dao.buscarPorId(pedido.getId());
		model.addAttribute("pedido", pedidoPreenchido);

		return "pedido/alterarPedido";
	}

	@RequestMapping("alterarPedido")
	public String alterarPedido(Pedido pedido, Model model) {

		PedidoDao dao = new PedidoDao();
		dao.alterar(pedido);
		model.addAttribute("msg", "O pedido foi Alterado com Sucesso !");

		return "forward:listarPedido";
	}

}
