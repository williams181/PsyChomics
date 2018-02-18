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
	
	@RequestMapping("/listarGeneroProduto")
    public String listarGeneroProduto(Model model) {

		GeneroProdutoDao dao = new GeneroProdutoDao();
	List<GeneroProduto> listarGeneroProduto = dao.listar();
	model.addAttribute("listarGeneroProduto", listarGeneroProduto);

	return "psyChomics/generoProduto/listarGeneroProduto";
    }
}
