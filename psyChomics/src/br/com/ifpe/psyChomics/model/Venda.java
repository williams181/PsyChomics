package br.com.ifpe.psyChomics.model;

import java.util.Date;
import java.util.List;

public class Venda {

    private int id;
    private Usuario usuario;
    private Date dataVenda;
    private double valorTotal;
    private List<ItemVenda> listaItens;

    public List<ItemVenda> getListaItens() {
	return listaItens;
    }

    public void setListaItens(List<ItemVenda> listaItens) {
	this.listaItens = listaItens;
    }

    public double getValorTotal() {
	return valorTotal;
    }

    public void setValorTotal(double valorTotal) {
	this.valorTotal = valorTotal;
    }

    public int getId() {
	return id;
    }

    public void setId(int id) {
	this.id = id;
    }

    public Usuario getUsuario() {
	return usuario;
    }

    public void setUsuario(Usuario usuario) {
	this.usuario = usuario;
    }

    public Date getDataVenda() {
	return dataVenda;
    }

    public void setDataVenda(Date dataVenda) {
	this.dataVenda = dataVenda;
    }

}
