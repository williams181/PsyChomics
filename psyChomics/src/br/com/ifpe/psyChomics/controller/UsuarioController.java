package br.com.ifpe.psyChomics.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import br.com.ifpe.psyChomics.model.Usuario;
import br.com.ifpe.psyChomics.model.UsuarioDao;

@Controller
public class UsuarioController {

	@RequestMapping("/exibirIndex")
	public String exibirIndex() {
		return "psyChomics/index";
	}

	@RequestMapping("/exibirLoginUsuario")
	public String exibirLoginUsuario() {
		return "psyChomics/usuario/loginUsuario";
	}

	@RequestMapping("/exibirCadastroUsuario")
	public String exibirCadastroUsuario() {
		return "psyChomics/usuario/cadastrarUsuario";
	}

	@RequestMapping("cadastroUsuario")
	public String cadastroUsuario(Usuario usuario, Model model) {
		UsuarioDao dao = new UsuarioDao();
		dao.cadastar(usuario);
		model.addAttribute("mensagem", "Usuario Inclu�do com Sucesso");
		return "psyChomics/usuario/cadastrarUsuario";
	}

	@RequestMapping("/exibirlistarUsuario")
	public String exibirlistarUsuario() {
		return "psyChomics/usuario/listarUsuario";
	}

	@RequestMapping("/listarUsuario")
	public String listarUsuario(Model model) {
		UsuarioDao dao = new UsuarioDao();
		List<Usuario> listaUsuario = dao.listar();
		model.addAttribute("listaUsuario", listaUsuario);
		System.out.println("Exibindo listagem de Usuario.");
		return "psyChomics/usuario/listarUsuario";
	}

	@RequestMapping("removerUsuario")
	public String removerUsuario(Usuario usuario, Model model) {
		UsuarioDao dao = new UsuarioDao();
		dao.remover(usuario);
		model.addAttribute("msg", "Usuario removido com sucesso!");

		return "psyChomics/usuario/listarUsuario";
	}

	@RequestMapping("/exibirAlterarUsuario")
	public String exibirAlterarUsuario(Usuario usuario, Model model) {

		UsuarioDao dao = new UsuarioDao();
		Usuario usuarioCompleto = dao.buscarPorId(usuario.getId());
		model.addAttribute("usuario", usuarioCompleto);

		return "psyChomics/usuario/alterarUsuario";
	}

	@RequestMapping("alterarUsuario")
	public String alterarUsuario(Usuario usuario, Model model) {

		UsuarioDao dao = new UsuarioDao();
		dao.alterar(usuario);
		model.addAttribute("msg", "Usuario Alterado com Sucesso!");

		return "psyChomics/usuario/listarUsuario";
	}

	@RequestMapping("/busca")
	public String busca(Usuario usuario, Model model) {
		UsuarioDao dao = new UsuarioDao();
		List<Usuario> buscarUsuario = dao.buscar(usuario);
		model.addAttribute("listaUsuario", buscarUsuario);
		return "psyChomics/usuario/listarUsuario";

	}

}
