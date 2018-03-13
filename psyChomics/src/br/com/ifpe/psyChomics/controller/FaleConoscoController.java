package br.com.ifpe.psyChomics.controller;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.ifpe.psyChomics.dao.FaleConoscoDao;
import br.com.ifpe.psyChomics.model.FaleConosco;
@Controller
public class FaleConoscoController {
	
	@RequestMapping("/exibirFaleConosco")
	public String exibirFaleConosco() {

		return "faleConosco/cadastrarMensagemFaleConosco";
	}

	@RequestMapping("cadastrarMensagemFaleConosco")
	public String cadastrarMensagemFaleConosco(FaleConosco faleConosco, Model model) {
		faleConosco.setData(new Date());
		FaleConoscoDao dao = new FaleConoscoDao();
		dao.salvar(faleConosco);
		model.addAttribute("msg", "A mensagem foi Inserida com Sucesso !");

		return "forward:listarMensagemFaleConosco";
	}

	@RequestMapping("listarMensagemFaleConosco")
	public String listarMensagemFaleConosco(Model model) {

		FaleConoscoDao dao = new FaleConoscoDao();
		List<FaleConosco> listarFaleConosco = dao.listar();
		model.addAttribute("listarFaleConosco", listarFaleConosco);

		return "faleConosco/pesquisarMensagemFaleConosco";
	}

	@RequestMapping("removerMensagemFaleConosco")
	public String removerMensagemFaleConosco(FaleConosco faleConosco, Model model) {

		FaleConoscoDao dao = new FaleConoscoDao();
		dao.remover(faleConosco);
		model.addAttribute("msg", "A mensagem foi Removido com Sucesso !");

		return "forward:listarMensagemFaleConosco";
	}

	@RequestMapping("/exibirAlterarMensagemFaleConosco")
	public String exibirAlterarMensagemFaleConosco(FaleConosco faleConosco, Model model) {

		FaleConoscoDao dao = new FaleConoscoDao();
		FaleConosco mensagemFaleConoscoPreenchida = dao.buscarPorId(faleConosco.getId());
		model.addAttribute("faleConosco", mensagemFaleConoscoPreenchida);

		return "faleConosco/alterarMensagemFaleConosco";
	}

	@RequestMapping("alterarMensagemFaleConosco")
	public String alterarMensagemFaleConosco(FaleConosco faleConosco, Model model) {

		FaleConoscoDao dao = new FaleConoscoDao();
		dao.alterar(faleConosco);
		model.addAttribute("msg", "A mensagem no Fale Conosco Alterado com Sucesso !");

		return "forward:listarMensagemFaleConosco";
	}

}
