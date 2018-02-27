package br.com.ifpe.psyChomics.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.ifpe.psyChomics.dao.CategoriaProdutoDao;
import br.com.ifpe.psyChomics.model.CategoriaProduto;


@Controller
public class CategoriaProdutoController {

    @RequestMapping("/exibirIncluirCategoriaProduto")
    public String exibirIncluirCategoriaProduto() {

	return "categoriaProduto/incluirCategoriaProduto";
    }

    @RequestMapping("incluirCategoriaProduto")
    public String incluirCategoriaProduto(CategoriaProduto categoriaProduto, Model model) {

	CategoriaProdutoDao dao = new CategoriaProdutoDao();
	dao.salvar(categoriaProduto);
	model.addAttribute("msg", "A categoria " + categoriaProduto.getCodigo() + " foi Inserida com Sucesso !");

	return "forward:listarCategoriaProduto";
    }

    @RequestMapping("/listarCategoriaProduto")
    public String listarCategoriaProduto(Model model) {

	CategoriaProdutoDao dao = new CategoriaProdutoDao();
	List<CategoriaProduto> listarCategoriaProduto = dao.listar();
	model.addAttribute("listarCategoriaProduto", listarCategoriaProduto);

	return "categoriaProduto/pesquisarCategoriaProduto";
    }

    @RequestMapping("removerCategoriaProduto")
    public String removerCategoriaProduto(CategoriaProduto categoriaProduto, Model model) {

	CategoriaProdutoDao dao = new CategoriaProdutoDao();
	dao.remover(categoriaProduto);
	model.addAttribute("msg", "Categoria Removida com Sucesso !");

	return "forward:listarCategoriaProduto";
    }

    @RequestMapping("exibirAlterarCategoriaProduto")
    public String exibirAlterarCategoriaProduto(CategoriaProduto categoriaProduto, Model model) {

	CategoriaProdutoDao dao = new CategoriaProdutoDao();
	CategoriaProduto categoriaProdutoPreenchida = dao.buscarPorId(categoriaProduto.getId());
	model.addAttribute("categoriaProduto", categoriaProdutoPreenchida);

	return "categoriaProduto/alterarCategoriaProduto";
    }

    @RequestMapping("alterarCategoriaProduto")
    public String alterarCategoriaProduto(CategoriaProduto categoriaProduto, Model model) {

	CategoriaProdutoDao dao = new CategoriaProdutoDao();
	dao.alterar(categoriaProduto);
	model.addAttribute("msg", "Categoria de Produto Alterada com Sucesso !");

	return "forward:listarCategoriaProduto";
    }

}
