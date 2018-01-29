package br.com.ifpe.psyChomics.controller;

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
		model.addAttribute("mensagem", "Usuario Incluído com Sucesso");
		return "psyChomics/usuario/cadastrarUsuario";
	}
	
	@RequestMapping("/exibirlistarUsuario")
	public String exibirlistarUsuario() {
		return "psyChomics/usuario/listarUsuario";
	}

    @RequestMapping("removerUsuario")
    public String removerUsuario(Usuario usuario, Model model) {
    	UsuarioDao dao = new UsuarioDao();
    	dao.remover(usuario);
    	model.addAttribute("msg", "Usuario removido com sucesso!");
    	
    	 return "psyChomics/usuario/listarUsuario";
    }
}
