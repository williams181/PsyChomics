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

	@RequestMapping("exibirLoginUsuario")
	public String exibirLoginUsuario() {
		System.out.println("Exibindo login do Usuario");
		return "usuario/loginUsuario";
	}

	@RequestMapping("efetuarLogin")
	public String efetuarLogin(Usuario usuario, HttpSession session, Model model) {
	UsuarioDao dao = new UsuarioDao();
	Usuario usuarioLogado = dao.buscarUsuario(usuario);
	if (usuarioLogado != null) {
	 session.setAttribute("usuarioLogado", usuarioLogado);
	 return "index";
	}
	model.addAttribute("msg", "N�o foi encontrado um usu�rio com o login e senha informados.");
	 return "usuario/loginUsuario";
	}
	
    @RequestMapping("logout")
    public String logout(HttpSession session) {

    	session.invalidate();
    	return "index";
    }

	@RequestMapping("exibirCadastrarUsuario")
	public String exibirCadastrarUsuario() {
		System.out.println("Exibindo cadastar Usuario");
		return "usuario/cadastrarUsuario";
	}

	@RequestMapping("cadastrarUsuario")
	public String cadastrarUsuario(Usuario usuario, Model model) {

		UsuarioDao dao = new UsuarioDao();
		dao.cadastrar(usuario);
		
		model.addAttribute("msg", "Usuario Incluido com Sucesso");
		System.out.println("cadastro de Usuario");
		return "usuario/cadastrarUsuario";
	}

	@RequestMapping("/listarUsuario")
	public String listarUsuario(Model model) {
		UsuarioDao dao = new UsuarioDao();
		List<Usuario> listarUsuario = dao.listar();
		model.addAttribute("listarUsuario", listarUsuario);
		System.out.println("lista de usuario");
		return "usuario/listarUsuario";
	}

	@RequestMapping("removerUsuario")
	public String removerUsuario(Usuario usuario, Model model) {
		UsuarioDao dao = new UsuarioDao();
		dao.remover(usuario);
		model.addAttribute("msg", "Usu�rio removido com sucesso!");
		System.out.println("remover usuario");
		return "forward:listarUsuario";
	}

	@RequestMapping("/buscarUsuario")
	public String buscarUsuario(Usuario usuario, Model model) {
		UsuarioDao dao = new UsuarioDao();
		List<Usuario> listarUsuario = dao.buscar(usuario);
		model.addAttribute("listarUsuario", listarUsuario);

		System.out.println("busca Usuario");
		return "usuario/buscarUsuario";
	}
	
	@RequestMapping("/exibirQuemSomos")
	public String exibirQuemSomos() {
		System.out.println("exibir quem somos");
		return "psyChomics/quemSomos";
	}
	
}
