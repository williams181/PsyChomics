package br.com.ifpe.psyChomics.controller;

import org.springframework.core.convert.converter.Converter;

import br.com.ifpe.psyChomics.model.ComentarioProduto;
import br.com.ifpe.psyChomics.model.ComentarioProdutoDao;

public class ComentarioProdutoConverter implements Converter<String, ComentarioProduto> {

	public ComentarioProduto convert(String id) {
		ComentarioProdutoDao dao2 = new ComentarioProdutoDao();
		return dao2.buscarPorId(Integer.valueOf(id));
	}
}