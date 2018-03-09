package br.com.ifpe.psyChomics.model;

import java.util.ArrayList;
import java.util.List;

public class Carrinho {
	
	private int id;
	private Usuario usuario;
	private List<Item> itens = new ArrayList<Item>();
	private Double total;

	public int getQuantidade() {
		return itens.size();
	}
	
	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public List<Item> getItens() {
		return itens;
	}

	public void setItens(List<Item> itens) {
		this.itens = itens;
	}

	public Double getTotal() {
		return total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}

}
