package br.com.ifpe.psyChomics.converter;

import org.springframework.core.convert.converter.Converter;

import br.com.ifpe.psyChomics.dao.UsuarioDao;
import br.com.ifpe.psyChomics.model.Usuario;

public class UsuarioConverter implements Converter<String, Usuario> {

    public Usuario convert(String id) {

	if (id != null && !id.equals("")) {
		UsuarioDao dao = new UsuarioDao();
		Usuario usuario = dao.buscarPorId(Integer.valueOf(id));
	    return usuario;
	} else {
	    return null;
	}

    }
}