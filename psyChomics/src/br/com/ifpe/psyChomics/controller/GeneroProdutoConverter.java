package br.com.ifpe.psyChomics.controller;

import org.springframework.core.convert.converter.Converter;

import br.com.ifpe.psyChomics.model.GeneroProduto;
import br.com.ifpe.psyChomics.model.GeneroProdutoDao;

public class GeneroProdutoConverter implements Converter<String, GeneroProduto> {

    public GeneroProduto convert(String id) {

	if (id != null && !id.equals("")) {
		GeneroProdutoDao dao = new GeneroProdutoDao();
		GeneroProduto generoProduto = dao.buscarPorId(Integer.valueOf(id));
	    return generoProduto;
	} else {
	    return null;
	}

    }
}