package br.com.ifpe.psyChomics.model;


public class Produto {
	
	private int id;
	private CategoriaProduto categoriaProduto;
	private GeneroProduto generoProduto;
	private String nome;
	private double preco;
	private String imagem;
	private String descricao;
	private String nacionalidade;
	
	public String getNacionalidade() {
		return nacionalidade;
	}
	public void setNacionalidade(String nacionalidade) {
		this.nacionalidade = nacionalidade;
	}
	public GeneroProduto getGeneroProduto() {
		return generoProduto;
	}
	public void setGeneroProduto(GeneroProduto generoProduto) {
		this.generoProduto = generoProduto;
	}
	public CategoriaProduto getCategoriaProduto() {
		return categoriaProduto;
	}
	public void setCategoriaProduto(CategoriaProduto categoriaProduto) {
		this.categoriaProduto = categoriaProduto;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
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
