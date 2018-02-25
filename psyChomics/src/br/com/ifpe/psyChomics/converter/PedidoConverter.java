package br.com.ifpe.psyChomics.converter;

import org.springframework.core.convert.converter.Converter;

import br.com.ifpe.psyChomics.dao.PedidoDao;
import br.com.ifpe.psyChomics.model.Pedido;


public class PedidoConverter implements Converter<String, Pedido> {

	public Pedido convert(String id) {

		if (id != null && !id.equals("")) {
			PedidoDao dao = new PedidoDao();
			Pedido pedido = dao.buscarPorId(Integer.valueOf(id));
			return pedido;
		} else {
			return null;
		}

	}
}
