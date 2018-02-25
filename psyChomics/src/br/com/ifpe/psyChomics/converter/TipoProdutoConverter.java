package br.com.ifpe.psyChomics.converter;

import org.springframework.core.convert.converter.Converter;

import br.com.ifpe.psyChomics.dao.TipoProdutoDao;
import br.com.ifpe.psyChomics.model.TipoProduto;



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
