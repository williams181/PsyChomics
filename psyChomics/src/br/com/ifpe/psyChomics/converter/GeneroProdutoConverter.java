package br.com.ifpe.psyChomics.converter;

import org.springframework.core.convert.converter.Converter;

import br.com.ifpe.psyChomics.dao.GeneroProdutoDao;
import br.com.ifpe.psyChomics.model.GeneroProduto;



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