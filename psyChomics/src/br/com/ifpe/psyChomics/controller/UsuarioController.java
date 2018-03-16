package br.com.ifpe.psyChomics.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.ifpe.psyChomics.dao.UsuarioDao;
import br.com.ifpe.psyChomics.model.Usuario;

@Controller
public class UsuarioController {

	@RequestMapping("/exibirLoginUsuario")
	public String exibirLoginUsuario() {
		return "usuario/loginUsuario";
	}

	@RequestMapping("efetuarLogin")
	public String efetuarLogin(Usuario usuario, HttpSession session, Model model) {
	UsuarioDao dao = new UsuarioDao();
	Usuario usuarioLogado = dao.buscarUsuario(usuario);
	if (usuarioLogado != null) {
	 session.setAttribute("usuarioLogado", usuarioLogado);
	 return "psyChomics/quemSomos";
	}
	model.addAttribute("msg", "Não foi encontrado um usuário com o login e senha informados.");
	 return "usuario/loginUsuario";
	}
	
    @RequestMapping("logout")
    public String logout(HttpSession session) {
    	session.invalidate();
    	 return "forward:listarProdutoIndex";
    }

	@RequestMapping("/exibirCadastrarUsuario")
	public String exibirCadastrarUsuario() {
		return "usuario/cadastrarUsuario";
	}

	@RequestMapping("cadastrarUsuario")
	public String cadastrarUsuario(Usuario usuario, Model model) {
		UsuarioDao dao = new UsuarioDao();
		dao.cadastrar(usuario);
		model.addAttribute("msg", "Usuario Incluido com Sucesso");
		return "psyChomics/quemSomos";
	}

	@RequestMapping("listarUsuario")
	public String listarUsuario(Model model) {
		UsuarioDao dao = new UsuarioDao();
		List<Usuario> listarUsuario = dao.listar();
		model.addAttribute("listarUsuario", listarUsuario);
		return "usuario/listarUsuario";
	}

	@RequestMapping("removerUsuario")
	public String removerUsuario(Usuario usuario, Model model) {
		UsuarioDao dao = new UsuarioDao();
		dao.remover(usuario);
		model.addAttribute("msg", "Usuário removido com sucesso!");
		System.out.println("remover usuario");
		return "forward:listarUsuario";
	}

	@RequestMapping("/exibirAlterarUsuario")
	public String exibirAlterarUsuario(Usuario usuario, Model model) {

		UsuarioDao dao = new UsuarioDao();
		Usuario usuarioCompleto = dao.buscarPorId(usuario.getId());
		model.addAttribute("usuario", usuarioCompleto);

		return "usuario/alterarUsuario";
	}

	@RequestMapping("alterarUsuario")
	public String alterarUsuario(Usuario usuario, Model model) {

		UsuarioDao dao = new UsuarioDao();
		dao.alterar(usuario);
		model.addAttribute("msg", "Usuario Alterado com Sucesso!");

		return "forward:listarUsuario";
	}
	
	@RequestMapping("buscarUsuario")
	public String buscarUsuario(Usuario usuario, Model model) {
		UsuarioDao dao = new UsuarioDao();
		List<Usuario> listarUsuario = dao.buscar(usuario);
		model.addAttribute("listarUsuario", listarUsuario);
		return "usuario/buscarUsuario";
	}
	
	@RequestMapping("/exibirQuemSomos")
	public String exibirQuemSomos() {
		return "psyChomics/quemSomos";
	}
	
}
