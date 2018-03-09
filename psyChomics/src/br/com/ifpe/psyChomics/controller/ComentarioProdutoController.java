package br.com.ifpe.psyChomics.controller;


import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.ifpe.psyChomics.dao.ComentarioProdutoDao;
import br.com.ifpe.psyChomics.dao.ProdutoDao;
import br.com.ifpe.psyChomics.model.ComentarioProduto;
import br.com.ifpe.psyChomics.model.Produto;
import br.com.ifpe.psyChomics.model.Usuario;

@Controller
public class ComentarioProdutoController {

	@RequestMapping("/exibirCadastrarComentarioProduto")
	public String exibirCadastrarComentarioProduto(Integer id, Model model) {
		
		ProdutoDao dao = new ProdutoDao();
		Produto produtoPreenchido = dao.buscarPorId(id);
		model.addAttribute("produto", produtoPreenchido);

		return "comentarioProduto/cadastrarComentarioProduto";
	}

	@RequestMapping("cadastrarComentarioProduto")
	public String cadastrarComentarioProduto(ComentarioProduto comentarioProduto,HttpSession session, Model model) {
		comentarioProduto.setData(new Date());
		ComentarioProdutoDao dao = new ComentarioProdutoDao();
		Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
		comentarioProduto.setUsuario(usuario);
		dao.salvar(comentarioProduto);
		model.addAttribute("msg", "O comentario do produto foi Inserido com Sucesso !");

		return "psyChomics/quemSomos";
	}

	@RequestMapping("listarComentarioProduto")
	public String listarComentarioProduto(Model model) {

		ComentarioProdutoDao dao = new ComentarioProdutoDao();
		List<ComentarioProduto> listarComentarioProduto = dao.listar();
		model.addAttribute("listarComentarioProduto", listarComentarioProduto);

		return "tipoProduto/pesquisarTipoProduto";
	}

	@RequestMapping("removerComentarioProduto")
	public String removerComentarioProduto(ComentarioProduto comentarioProduto, Model model) {

		ComentarioProdutoDao dao = new ComentarioProdutoDao();
		dao.remover(comentarioProduto);
		model.addAttribute("msg", "Comentario do produto Removido com Sucesso !");

		return "forward:listarComentarioProduto";
	}

	@RequestMapping("/exibirAlterarComentarioProduto")
	public String exibirAlterarComentarioProduto(ComentarioProduto comentarioProduto, Model model) {

		ComentarioProdutoDao dao = new ComentarioProdutoDao();
		ComentarioProduto comentarioProdutoPreenchido = dao.buscarPorId(comentarioProduto.getId());
		model.addAttribute("comentarioProduto", comentarioProdutoPreenchido);

		return "comentarioProduto/alterarComentarioProduto";
	}

	@RequestMapping("alterarComentarioProduto")
	public String alterarComentarioProduto(ComentarioProduto comentarioProduto, Model model) {

		ComentarioProdutoDao dao = new ComentarioProdutoDao();
		dao.alterar(comentarioProduto);
		model.addAttribute("msg", "O comentario do Produto foi Alterado com Sucesso !");

		return "forward:listarComentarioProduto";
	}

}
