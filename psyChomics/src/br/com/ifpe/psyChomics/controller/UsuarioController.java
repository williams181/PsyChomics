package br.com.ifpe.psyChomics.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.ifpe.psyChomics.model.Usuario;
import br.com.ifpe.psyChomics.model.UsuarioDao;

@Controller
public class UsuarioController {

	@RequestMapping("/exibirCadastroPsyChomics")
	public String exibirCadastrarUsuario() {
		return "psyChomics/cadastrarUsuario";
	}

	@RequestMapping("cadastroPsyChomics")
	public String cadastrarUsuario(Usuario usuario) {
		UsuarioDao dao = new UsuarioDao();
		dao.cadastar(usuario);
		return "psyChomics/cadastroSucesso";
	}

}
