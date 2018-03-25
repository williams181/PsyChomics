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
		// Cria codigo para popular o combo de categoria de produto
		CategoriaProdutoDao dao = new CategoriaProdutoDao();
		List<CategoriaProduto> listarCategoriaProduto = dao.listar();

		// Cria codigo para popular o combo de genero de produto
		GeneroProdutoDao dao2 = new GeneroProdutoDao();
		List<GeneroProduto> listarGeneroProduto = dao2.listar();

		// Cria codigo para popular o combo de tipo de produto
		TipoProdutoDao dao3 = new TipoProdutoDao();
		List<TipoProduto> listarTipoProduto = dao3.listar();

		model.addAttribute("listarCategoriaProduto", listarCategoriaProduto);
		model.addAttribute("listarGeneroProduto", listarGeneroProduto);
		model.addAttribute("listarTipoProduto", listarTipoProduto);
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
		return "forward:listarProduto";
	}

	@RequestMapping("listarProduto")
	public String listarProduto(Model model) {
		ProdutoDao dao = new ProdutoDao();
		List<Produto> listarProduto = dao.listar();
		model.addAttribute("listarProduto", listarProduto);

		// Cria codigo para popular o combo de categoria de produto
		CategoriaProdutoDao dao2 = new CategoriaProdutoDao();
		List<CategoriaProduto> listarCategoriaProduto = dao2.listar();

		// Cria codigo para popular o combo de genero de produto
		GeneroProdutoDao dao3 = new GeneroProdutoDao();
		List<GeneroProduto> listarGeneroProduto = dao3.listar();

		// Cria codigo para popular o combo de tipo de produto
		TipoProdutoDao dao4 = new TipoProdutoDao();
		List<TipoProduto> listarTipoProduto = dao4.listar();

		model.addAttribute("listarCategoriaProduto", listarCategoriaProduto);
		model.addAttribute("listarGeneroProduto", listarGeneroProduto);
		model.addAttribute("listarTipoProduto", listarTipoProduto);
		return "produto/listarProduto";
	}
	
	@RequestMapping("listarProdutoUsuario")
	public String listarProdutoUsuario(Model model) {
		ProdutoDao dao = new ProdutoDao();
		List<Produto> listarProdutoUsuario = dao.listar();
		model.addAttribute("listarProdutoUsuario", listarProdutoUsuario);

		// Cria codigo para popular o combo de categoria de produto
		CategoriaProdutoDao dao2 = new CategoriaProdutoDao();
		List<CategoriaProduto> listarCategoriaProduto = dao2.listar();

		// Cria codigo para popular o combo de genero de produto
		GeneroProdutoDao dao3 = new GeneroProdutoDao();
		List<GeneroProduto> listarGeneroProduto = dao3.listar();

		// Cria codigo para popular o combo de tipo de produto
		TipoProdutoDao dao4 = new TipoProdutoDao();
		List<TipoProduto> listarTipoProduto = dao4.listar();

		model.addAttribute("listarCategoriaProduto", listarCategoriaProduto);
		model.addAttribute("listarGeneroProduto", listarGeneroProduto);
		model.addAttribute("listarTipoProduto", listarTipoProduto);
		return "produto/listarProdutoUsuario";
	}

	@RequestMapping("removerProduto")
	public String removerProduto(Produto produto, Model model) {
		ProdutoDao dao = new ProdutoDao();
		dao.remover(produto);
		model.addAttribute("msg", "Produto removido com sucesso!");
		return "forward:listarProduto";
	}

	@RequestMapping("/exibirAlterarProduto")
	public String exibirAlterarProduto(Produto produto, Model model) {

		ProdutoDao dao = new ProdutoDao();
		Produto produtoCompleto = dao.buscarPorId(produto.getId());
		model.addAttribute("produto", produtoCompleto);
		return "produto/alterarProduto";
	}

	@RequestMapping("alterarProduto")
	public String alterarProduto(Produto produto, Model model) {

		ProdutoDao dao = new ProdutoDao();
		dao.alterar(produto);
		model.addAttribute("msg", "Produto Alterado com Sucesso!");
		return "forward:listarProduto";
	}

	@RequestMapping("buscarProduto")
	public String buscarProduto(Produto produto, Model model) {
		ProdutoDao dao = new ProdutoDao();
		List<Produto> buscarProduto = dao.buscar(produto);
		model.addAttribute("buscarProduto", buscarProduto);

		// Cria codigo para popular o combo de categoria de produto
		CategoriaProdutoDao dao2 = new CategoriaProdutoDao();
		List<CategoriaProduto> listarCategoriaProduto = dao2.listar();

		// Cria codigo para popular o combo de genero de produto
		GeneroProdutoDao dao3 = new GeneroProdutoDao();
		List<GeneroProduto> listarGeneroProduto = dao3.listar();

		// Cria codigo para popular o combo de tipo de produto
		TipoProdutoDao dao4 = new TipoProdutoDao();
		List<TipoProduto> listarTipoProduto = dao4.listar();

		model.addAttribute("listarCategoriaProduto", listarCategoriaProduto);
		model.addAttribute("listarGeneroProduto", listarGeneroProduto);
		model.addAttribute("listarTipoProduto", listarTipoProduto);
		return "produto/buscarProduto";

	}

	@RequestMapping("listarProdutoIndex")
	public String listarProdutoIndex(Model model) {
		ProdutoDao dao = new ProdutoDao();
		List<Produto> listaProdutoIndex = dao.listarIndex();
		model.addAttribute("listaProdutoIndex", listaProdutoIndex);

		ProdutoDao dao2 = new ProdutoDao();
		List<Produto> listaProdutoIndex2 = dao2.listarIndex2();
		model.addAttribute("listaProdutoIndex2", listaProdutoIndex2);
		return "index";
	}

	@RequestMapping("/exibirDescricaoProduto")
	public String exibirDescricaoProduto(Produto produto, Model model) {

		ProdutoDao dao = new ProdutoDao();
		Produto produtoCompleto = dao.buscarPorId(produto.getId());
		model.addAttribute("produto", produtoCompleto);

		// Cria codigo para popular o combo de categoria de produto
		CategoriaProdutoDao dao2 = new CategoriaProdutoDao();
		List<CategoriaProduto> listarCategoriaProduto = dao2.listar();

		// Cria codigo para popular o combo de genero de produto
		GeneroProdutoDao dao3 = new GeneroProdutoDao();
		List<GeneroProduto> listarGeneroProduto = dao3.listar();

		// Cria codigo para popular o combo de tipo de produto
		TipoProdutoDao dao4 = new TipoProdutoDao();
		List<TipoProduto> listarTipoProduto = dao4.listar();

		model.addAttribute("listarCategoriaProduto", listarCategoriaProduto);
		model.addAttribute("listarGeneroProduto", listarGeneroProduto);
		model.addAttribute("listarTipoProduto", listarTipoProduto);

		return "produto/descricaoProduto";
	}

}
