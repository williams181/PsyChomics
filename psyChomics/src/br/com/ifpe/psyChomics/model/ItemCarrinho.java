package br.com.ifpe.psyChomics.model;

public class ItemCarrinho {

	private int id;
	private Produto produto;
	private int quantidade;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Produto getProduto() {
		return produto;
	}

	public void setProduto(Produto produto) {
		this.produto = produto;
	}

	public int getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}

	@Override
	public boolean equals(Object obj) {
		boolean retorno = false;

		if (obj instanceof ItemCarrinho) {
			if (this.id == ((ItemCarrinho) obj).getId()) {
				retorno = true;
			}
		}
		return retorno;
	}
}
