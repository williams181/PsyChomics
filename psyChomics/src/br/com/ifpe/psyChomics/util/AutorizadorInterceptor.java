package br.com.ifpe.psyChomics.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AutorizadorInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object controller)
			throws Exception {

		String uri = request.getRequestURI();
		if (uri.contains("bootstrap") || uri.contains("css") || uri.contains("imagens") || uri.contains("img")
				|| uri.contains("fonts") || uri.contains("js") || uri.endsWith("psyChomics/")
				|| uri.endsWith("exibirFaleConosco") || uri.endsWith("cadastrarMensagemFaleConosco")
				|| uri.endsWith("buscarProduto") || uri.endsWith("listarProdutoIndex")
				|| uri.endsWith("exibirDescricaoProduto") || uri.endsWith("exibirLoginUsuario")
				|| uri.endsWith("efetuarLogin") || uri.endsWith("logout") || uri.endsWith("exibirCadastrarUsuario")
				|| uri.endsWith("cadastrarUsuario") || uri.endsWith("exibirAlterarUsuario")
				|| uri.endsWith("alterarUsuario") || uri.endsWith("exibirQuemSomos") || uri.endsWith("exibirFaq")
				|| uri.endsWith("listarProdutoUsuario")) {

			return true;
		}

		if (request.getSession().getAttribute("usuarioLogado") != null) {

			return true;
		}

		response.sendRedirect("/psyChomics");
		return false;
	}
}