package br.com.ifpe.psyChomics.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.ifpe.psyChomics.model.GeneroProduto;
import br.com.ifpe.psyChomics.model.GeneroProdutoDao;


@Controller
public class GeneroProdutoController {

	@RequestMapping("/exibircadastrarGeneroProduto")
	public String exibircadastrarGeneroProduto() {
		System.out.println("Exibindo cadastrar genero de Produto");
		return "psyChomics/generoProduto/cadastrarGeneroProduto";
	}

	@RequestMapping("cadastrarGeneroProduto")
	public String cadastrarGeneroProduto(GeneroProduto generoProduto, Model model) {

		GeneroProdutoDao dao = new GeneroProdutoDao();
		dao.cadastrar(generoProduto);
		model.addAttribute("msg", "O genero " + generoProduto.getGenero() + " foi Inserido com Sucesso !");
		System.out.println("cadastro de genero de produto");
		return "psyChomics/generoProduto/cadastrarGeneroProduto";
	}

	@RequestMapping("/exibirlistarGeneroProduto")
	public String exibirlistarGeneroProduto() {
		System.out.println("Exibindo lista de genero de produto");
		return "psyChomics/generoProduto/listarGeneroProduto";
	}

	@RequestMapping("/listarGeneroProduto")
	public String listarGeneroProduto(Model model) {

		GeneroProdutoDao dao = new GeneroProdutoDao();
		List<GeneroProduto> listarGeneroProduto = dao.listar();
		model.addAttribute("listarGeneroProduto", listarGeneroProduto);
		System.out.println("lista de genero de produto");
		return "psyChomics/generoProduto/listarGeneroProduto";
	}

	@RequestMapping("removerGeneroProduto")
	public String removerGeneroProduto(GeneroProduto generoProduto, Model model) {
		GeneroProdutoDao dao = new GeneroProdutoDao();
		dao.remover(generoProduto);
		model.addAttribute("msg", "Produto removido com sucesso!");
		System.out.println("remover genero do produto");
		return "psyChomics/generoProduto/listarGeneroProduto";
	}

	@RequestMapping("/exibirAlterarGeneroProduto")
	public String exibirAlterarGeneroProduto() {

		System.out.println("Exibindo alterar genero do produtoproduto");
		return "psyChomics/generoProduto/alterarGeneroProduto";
	}

	@RequestMapping("alterarGeneroProduto")
	public String alterarGeneroProduto(GeneroProduto generoProduto, Model model) {

		GeneroProdutoDao dao = new GeneroProdutoDao();
		GeneroProduto generoProdutoCompleto = dao.buscarPorId(generoProduto.getId());
		model.addAttribute("generoProduto", generoProdutoCompleto);
		System.out.println("alterar genero do produto");
		return "psyChomics/generoProduto/listarGeneroProduto";
	}

}
