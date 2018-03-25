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
<title>PsyChomics</title>
</head>
<body>

	<c:import url="/view/comum/menuUsuario.jsp" />

	<br>

	<c:import url="/view/comum/carousel.jsp" />

	<br>

	<center>
		<div class="alert alert-dark" role="alert">
			<h4 class="text-uppercase">Descrição do produto</h4>
		</div>
	</center>

	<br>

	<input type="hidden" name="id" value="${produto.id}" />

	<br>

	<div class="container">
		<div class="card" style="width: 18rem;">
			<img class="card-img-top" src="view/img/${produto.imagem}"
				alt="Card image cap">
			<div class="card-body">
				<h5 class="card-title">${produto.nome}</h5>
				<p class="card-text">${produto.descricao}</p>
			</div>
			<ul class="list-group list-group-flush">
				<li class="list-group-item">${produto.preco}</li>
				<li class="list-group-item">${produto.generoProduto.descricao}</li>
				<li class="list-group-item">${produto.categoriaProduto.descricao}</li>
				<li class="list-group-item">${produto.tipoProduto.descricao}</li>
			</ul>
			<div class="card-body">
				<a href="exibirAdicionarCarrinho?id=${produto.id}" class="card-link">Comprar</a>
				<a href="exibirCadastrarComentarioProduto?id=${produto.id}"
					class="card-link">Comentarios</a>
			</div>
		</div>
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