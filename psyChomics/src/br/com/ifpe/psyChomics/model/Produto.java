package br.com.ifpe.psyChomics.model;


public class Produto {
	
	private int id;
	private String codigo;
	private String nome;
	private GeneroProduto generoProduto;
	private double preco;
	private String imagem;
	private String descricao;
	
	
	public String getCodigo() {
		return codigo;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public GeneroProduto getGeneroProduto() {
		return generoProduto;
	}
	public void setGeneroProduto(GeneroProduto generoProduto) {
		this.generoProduto = generoProduto;
	}
	public String getImagem() {
		return imagem;
	}
	public void setImagem(String imagem) {
		this.imagem = imagem;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public double getPreco() {
		return preco;
	}
	public void setPreco(double preco) {
		this.preco = preco;
	}


}
