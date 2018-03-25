<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="pt-br">
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Descrição do Produto</title>
</head>
<body>

	<c:import url="/view/comum/menuUsuario.jsp" />

	<br>

	<c:import url="/view/comum/carousel.jsp" />

	<br>

	<center>
		<div class="alert alert-dark" role="alert">
			<h4 class="text-uppercase">Adcionar Produto ou carrinho</h4>
		</div>

	</center>

	<br>

	<input type="hidden" name="id" value="${produto.id}" />

	<br>

	<div class="container">
		<form action="adicionarAoCarrinho" method="post">
			<div class="form-group">
				<input type="hidden" name="id" value="${p.id}">
				<div class="card" style="width: 18rem;">

					<img class="card-img-top" src="view/img/${p.imagem}"
						alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">${p.nome}</h5>
					</div>
					<ul class="list-group list-group-flush">
						<li class="list-group-item">${p.preco}</li>
						<li class="list-group-item">${p.generoProduto.descricao}</li>
						<li class="list-group-item">${p.categoriaProduto.descricao}</li>
						<li class="list-group-item">${p.tipoProduto.descricao}</li>
						<li class="list-group-item"><div class="form-group col-md-6">
								<label for="inputQuantidade"><strong>Quantidade</strong></label>
								<input type="text" id="inputQuantidade" class="form-control"
									name="quantidade" style="width: 85px;" required="required" />
							</div></li>
					</ul>
					<div class="card-body">
						<button type="reset" class="btn btn-default">Limpar</button>
						<button type="submit" class="btn btn-info">Adicionar</button>
					</div>
				</div>
			</div>
		</form>
	</div>

	<br>

	<c:import url="/view/comum/rodape.jsp" />

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
</body>

</html>