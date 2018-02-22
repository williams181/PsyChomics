package br.com.ifpe.psyChomics.controller;

import org.springframework.core.convert.converter.Converter;

import br.com.ifpe.psyChomics.model.TipoProduto;
import br.com.ifpe.psyChomics.model.TipoProdutoDao;



public class TipoProdutoConverter implements Converter<String, TipoProduto> {

    public TipoProduto convert(String id) {

	if (id != null && !id.equals("")) {
		TipoProdutoDao dao = new TipoProdutoDao();
		TipoProduto tipoProduto = dao.buscarPorId(Integer.valueOf(id));
	    return tipoProduto;
	} else {
	    return null;
	}

    }
}
