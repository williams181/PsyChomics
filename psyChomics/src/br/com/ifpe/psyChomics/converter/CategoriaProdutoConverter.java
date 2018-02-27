package br.com.ifpe.psyChomics.converter;

import org.springframework.core.convert.converter.Converter;

import br.com.ifpe.psyChomics.dao.CategoriaProdutoDao;
import br.com.ifpe.psyChomics.model.CategoriaProduto;


public class CategoriaProdutoConverter implements Converter<String, CategoriaProduto> {

    public CategoriaProduto convert(String id) {

	if (id != null && !id.equals("")) {
	    CategoriaProdutoDao dao = new CategoriaProdutoDao();
	    CategoriaProduto categoriaProduto = dao.buscarPorId(Integer.valueOf(id));
	    return categoriaProduto;
	} else {
	    return null;
	}

    }
}