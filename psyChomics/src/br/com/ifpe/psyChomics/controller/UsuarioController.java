package br.com.ifpe.psyChomics.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.ifpe.psyChomics.model.Usuario;
import br.com.ifpe.psyChomics.model.UsuarioDao;

@Controller
public class UsuarioController {

	@RequestMapping("/exibirCadastro")
	public String exibirCadastrar() {
		return "cadastro/cadastrarUsuario";
	}

	@RequestMapping("cadastro")
	public String cadastrar(Usuario usuario) {
		UsuarioDao dao = new UsuarioDao();
		dao.cadastar(usuario);
		return "cadastro/sucesso";
	}

}
