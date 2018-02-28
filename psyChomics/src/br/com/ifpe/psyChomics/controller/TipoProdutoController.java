package br.com.ifpe.psyChomics.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.ifpe.psyChomics.dao.TipoProdutoDao;
import br.com.ifpe.psyChomics.model.TipoProduto;

@Controller
public class TipoProdutoController {

	@RequestMapping("/exibirIncluirTipoProduto")
	public String exibirIncluirTipoProduto() {

		return "tipoProduto/incluirTipoProduto";
	}

	@RequestMapping("incluirTipoProduto")
	public String incluirTipoProduto(TipoProduto tipoProduto, Model model) {

		TipoProdutoDao dao = new TipoProdutoDao();
		dao.salvar(tipoProduto);
		model.addAttribute("msg", "O tipo " + tipoProduto.getCodigo() + " foi Inserido com Sucesso !");

		return "forward:listarTipoProduto";
	}

	@RequestMapping("/listarTipoProduto")
	public String listarTipoProduto(Model model) {

		TipoProdutoDao dao = new TipoProdutoDao();
		List<TipoProduto> listarTipoProduto = dao.listar();
		model.addAttribute("listarTipoProduto", listarTipoProduto);

		return "tipoProduto/pesquisarTipoProduto";
	}

	@RequestMapping("removerTipoProduto")
	public String removerTipoProduto(TipoProduto tipoProduto, Model model) {

		TipoProdutoDao dao = new TipoProdutoDao();
		dao.remover(tipoProduto);
		model.addAttribute("msg", "Tipo Removida com Sucesso !");

		return "forward:listarTipoProduto";
	}

	@RequestMapping("exibirAlterarTipoProduto")
	public String exibirAlterarTipoProduto(TipoProduto tipoProduto, Model model) {

		TipoProdutoDao dao = new TipoProdutoDao();
		TipoProduto tipoProdutoPreenchida = dao.buscarPorId(tipoProduto.getId());
		model.addAttribute("tipoProduto", tipoProdutoPreenchida);

		return "tipoProduto/alterarTipoProduto";
	}

	@RequestMapping("alterarTipoProduto")
	public String alterarTipoProduto(TipoProduto tipoProduto, Model model) {

		TipoProdutoDao dao = new TipoProdutoDao();
		dao.alterar(tipoProduto);
		model.addAttribute("msg", "Tipo de Produto Alterada com Sucesso !");

		return "forward:listarTipoProduto";
	}

}
