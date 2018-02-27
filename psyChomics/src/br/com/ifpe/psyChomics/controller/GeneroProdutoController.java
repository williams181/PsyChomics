package br.com.ifpe.psyChomics.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.ifpe.psyChomics.dao.GeneroProdutoDao;
import br.com.ifpe.psyChomics.model.GeneroProduto;

@Controller
public class GeneroProdutoController {

	@RequestMapping("/exibirIncluirGeneroProduto")
	public String exibirIncluirGeneroProduto() {

		return "generoProduto/incluirGeneroProduto";
	}

	@RequestMapping("incluirGeneroProduto")
	public String incluirGeneroProduto(GeneroProduto generoProduto, Model model) {

		GeneroProdutoDao dao = new GeneroProdutoDao();
		dao.salvar(generoProduto);
		model.addAttribute("msg", "O Genero " + generoProduto.getCodigo() + " foi Inserido com Sucesso !");

		return "forward:listarGeneroProduto";
	}

	@RequestMapping("/listarGeneroProduto")
	public String listarGeneroProduto(Model model) {

		GeneroProdutoDao dao = new GeneroProdutoDao();
		List<GeneroProduto> listarGeneroProduto = dao.listar();
		model.addAttribute("listarGeneroProduto", listarGeneroProduto);

		return "generoProduto/pesquisarGeneroProduto";
	}

	@RequestMapping("removerGeneroProduto")
	public String removerGeneroProduto(GeneroProduto generoProduto, Model model) {

		GeneroProdutoDao dao = new GeneroProdutoDao();
		dao.remover(generoProduto);
		model.addAttribute("msg", "Genero Removido com Sucesso !");

		return "forward:listarCategoriaProduto";
	}

	@RequestMapping("exibirAlterarGeneroProduto")
	public String exibirAlterarGeneroProduto(GeneroProduto generoProduto, Model model) {

		GeneroProdutoDao dao = new GeneroProdutoDao();
		GeneroProduto generoProdutoPreenchida = dao.buscarPorId(generoProduto.getId());
		model.addAttribute("generoProduto", generoProdutoPreenchida);

		return "generoProduto/alterarGeneroProduto";
	}

	@RequestMapping("alterarGeneroProduto")
	public String alterarGeneroProduto(GeneroProduto generoProduto, Model model) {

		GeneroProdutoDao dao = new GeneroProdutoDao();
		dao.alterar(generoProduto);
		model.addAttribute("msg", "Genero do Produto Alterado com Sucesso !");

		return "forward:listarGeneroProduto";
	}

}
