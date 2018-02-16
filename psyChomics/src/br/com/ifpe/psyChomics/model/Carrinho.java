package br.com.ifpe.psyChomics.model;

import java.util.ArrayList;
import java.util.List;

public class Carrinho {
	
	private int id;
	private List<Item> itens = new ArrayList<Item>();
	private double total;
	
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
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	
	

}
