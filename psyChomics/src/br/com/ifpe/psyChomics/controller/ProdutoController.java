package br.com.ifpe.psyChomics.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import br.com.ifpe.psyChomics.dao.CategoriaProdutoDao;
import br.com.ifpe.psyChomics.dao.GeneroProdutoDao;
import br.com.ifpe.psyChomics.dao.ProdutoDao;
import br.com.ifpe.psyChomics.dao.TipoProdutoDao;
import br.com.ifpe.psyChomics.model.CategoriaProduto;
import br.com.ifpe.psyChomics.model.GeneroProduto;
import br.com.ifpe.psyChomics.model.Produto;
import br.com.ifpe.psyChomics.model.TipoProduto;
import br.com.ifpe.psyChomics.util.Util;

@Controller
public class ProdutoController {

	@RequestMapping("/exibirCadastrarProduto")
	public String exibirCadastrarProduto(Model model) {
		// Código para popular o combo de categoria de produto
		CategoriaProdutoDao dao = new CategoriaProdutoDao();
		List<CategoriaProduto> listarCategoriaProduto = dao.listar();

		// Código para popular o combo de genero de produto
		GeneroProdutoDao dao2 = new GeneroProdutoDao();
		List<GeneroProduto> listarGeneroProduto = dao2.listar();

		// Código para popular o combo de tipo de produto
		TipoProdutoDao dao3 = new TipoProdutoDao();
		List<TipoProduto> listarTipoProduto = dao3.listar();

		model.addAttribute("listarCategoriaProduto", listarCategoriaProduto);
		model.addAttribute("listarGeneroProduto", listarGeneroProduto);
		model.addAttribute("listarTipoProduto", listarTipoProduto);

		System.out.println("Exibindo cadastrar Produto");
		return "produto/cadastrarProduto";
	}

	@RequestMapping("cadastrarProduto")
	public String cadastrarProduto(Produto produto, @RequestParam("file") MultipartFile imagem, Model model) {
		if (Util.fazerUploadImagem(imagem)) {
			produto.setImagem(Util.obterMomentoAtual() + " - " + imagem.getOriginalFilename());
		}

		ProdutoDao dao = new ProdutoDao();
		dao.cadastrar(produto);
		model.addAttribute("msg", "Produto Incluido com Sucesso");
		System.out.println("cadastro de produto");
		return "forward:listarProduto";
	}

	@RequestMapping("/listarProduto")
	public String listarProduto(Model model) {
		ProdutoDao dao = new ProdutoDao();
		List<Produto> listarProduto = dao.listar();
		model.addAttribute("listarProduto", listarProduto);

		// Código para popular o combo de categoria de produto
		CategoriaProdutoDao dao2 = new CategoriaProdutoDao();
		List<CategoriaProduto> listarCategoriaProduto = dao2.listar();

		// Código para popular o combo de genero de produto
		GeneroProdutoDao dao3 = new GeneroProdutoDao();
		List<GeneroProduto> listarGeneroProduto = dao3.listar();

		// Código para popular o combo de tipo de produto
		TipoProdutoDao dao4 = new TipoProdutoDao();
		List<TipoProduto> listarTipoProduto = dao4.listar();

		model.addAttribute("listarCategoriaProduto", listarCategoriaProduto);
		model.addAttribute("listarGeneroProduto", listarGeneroProduto);
		model.addAttribute("listarTipoProduto", listarTipoProduto);

		System.out.println("lista de produto");
		return "produto/buscarProduto";
	}

	@RequestMapping("removerProduto")
	public String removerProduto(Produto produto, Model model) {
		ProdutoDao dao = new ProdutoDao();
		dao.remover(produto);
		model.addAttribute("msg", "Produto removido com sucesso!");
		System.out.println("remover produto");
		return "forward:listarProduto";
	}

	@RequestMapping("/exibirAlterarProduto")
	public String exibirAlterarProduto(Produto produto, Model model) {

		ProdutoDao dao = new ProdutoDao();
		Produto produtoCompleto = dao.buscarPorId(produto.getId());
		model.addAttribute("produto", produtoCompleto);

		// Código para popular o combo de categoria de produto
		CategoriaProdutoDao dao2 = new CategoriaProdutoDao();
		List<CategoriaProduto> listarCategoriaProduto = dao2.listar();
		model.addAttribute("listarCategoriaProduto", listarCategoriaProduto);

		System.out.println("Exibindo alterar produto");
		return "produto/alterarProduto";
	}

	@RequestMapping("alterarProduto")
	public String alterarProduto(Produto produto, Model model) {

		ProdutoDao dao = new ProdutoDao();
		dao.alterar(produto);
		model.addAttribute("msg", "Produto Alterado com Sucesso!");
		System.out.println("alterar produto");
		return "forward:listarProduto";
	}

	@RequestMapping("/buscarProduto")
	public String buscarProduto(Produto produto, Model model) {
		ProdutoDao dao = new ProdutoDao();
		List<Produto> buscarProduto = dao.buscar(produto);
		model.addAttribute("buscarProduto", buscarProduto);

		// Código para popular o combo de categoria de produto
		CategoriaProdutoDao dao2 = new CategoriaProdutoDao();
		List<CategoriaProduto> listarCategoriaProduto = dao2.listar();

		// Código para popular o combo de genero de produto
		GeneroProdutoDao dao3 = new GeneroProdutoDao();
		List<GeneroProduto> listarGeneroProduto = dao3.listar();

		// Código para popular o combo de tipo de produto
		TipoProdutoDao dao4 = new TipoProdutoDao();
		List<TipoProduto> listarTipoProduto = dao4.listar();

		model.addAttribute("listarCategoriaProduto", listarCategoriaProduto);
		model.addAttribute("listarGeneroProduto", listarGeneroProduto);
		model.addAttribute("listarTipoProduto", listarTipoProduto);

		System.out.println("busca produto");
		return "produto/buscarProduto";

	}

	@RequestMapping("/listarProdutoIndex")
	public String listarProdutoIndex(Model model) {
		ProdutoDao dao = new ProdutoDao();
		List<Produto> listaProdutoIndex = dao.listarIndex();
		model.addAttribute("listaProdutoIndex", listaProdutoIndex);
		System.out.println("listagem de produto no index.");
		return "index";
	}

	@RequestMapping("/exibirDescricaoProduto")
	public String exibirDescricaoProduto(Produto produto, Model model) {

		ProdutoDao dao = new ProdutoDao();
		Produto produtoCompleto = dao.buscarPorId(produto.getId());
		model.addAttribute("produto", produtoCompleto);

		// Código para popular o combo de categoria de produto
		CategoriaProdutoDao dao2 = new CategoriaProdutoDao();
		List<CategoriaProduto> listarCategoriaProduto = dao2.listar();

		// Código para popular o combo de genero de produto
		GeneroProdutoDao dao3 = new GeneroProdutoDao();
		List<GeneroProduto> listarGeneroProduto = dao3.listar();

		// Código para popular o combo de tipo de produto
		TipoProdutoDao dao4 = new TipoProdutoDao();
		List<TipoProduto> listarTipoProduto = dao4.listar();

		model.addAttribute("listarCategoriaProduto", listarCategoriaProduto);
		model.addAttribute("listarGeneroProduto", listarGeneroProduto);
		model.addAttribute("listarTipoProduto", listarTipoProduto);

		System.out.println("exibir listagem de descricao do produto");
		return "produto/descricaoProduto";
	}

}
