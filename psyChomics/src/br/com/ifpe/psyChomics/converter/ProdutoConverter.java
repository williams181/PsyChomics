package br.com.ifpe.psyChomics.converter;

import org.springframework.core.convert.converter.Converter;

import br.com.ifpe.psyChomics.dao.ProdutoDao;
import br.com.ifpe.psyChomics.model.Produto;

public class ProdutoConverter implements Converter<String, Produto> {

	public Produto convert(String id) {

		if (id != null && !id.equals("")) {
			ProdutoDao dao = new ProdutoDao();
			Produto produto = dao.buscarPorId(Integer.valueOf(id));
			return produto;
		} else {
			return null;
		}

	}
}
