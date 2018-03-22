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
<title>Busca de produtos</title>
</head>
<body>

	<c:import url="/view/comum/menuUsuario.jsp" />

	<br>

	<div id="carouselExampleIndicators" class="carousel slide"
		data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="d-block w-100" src="view/imagens/bg3.png"
					alt="primeiro slide">
			</div>

			<div class="carousel-item">
				<img class="d-block w-100" src="view/imagens/bgcw.png"
					alt="segundo slide">
			</div>

			<div class="carousel-item">
				<img class="d-block w-100" src="view/imagens/bgcw2.png"
					alt="terceiro slide">
			</div>

			<div class="carousel-item">
				<img class="d-block w-100" src="view/imagens/bgoldlogan.png"
					alt="quarto slide">
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Anterior</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Próximo</span>
		</a>
	</div>

	<br>

	<div class="alert alert-dark" role="alert">
		<h4 class="text-uppercase">Resultados encontrados</h4>
	</div>

	<br>

	<input type="hidden" name="id" value="${produto.id}" />

	<br>

	<div class="conteinar">
		<c:forEach var="produto" items="${buscarProduto}">
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
					<a href="exibirAdicionarCarrinho?id=${produto.id}"
						class="card-link">Comprar</a> <a
						href="exibirCadastrarComentarioProduto?id=${produto.id}"
						class="card-link">Comentarios</a>
				</div>
			</div>
		</c:forEach>
	</div>

	<br>

	<div class="card">
		<div class="card-header">Olá</div>
		<div class="card-body">
			<h5 class="card-title">Saiba mais sobre nossos produtos e sobre
				nós!</h5>
			<p class="card-text">Visite nossa page no facebook</p>
			<a href="https://www.facebook.com/" class="btn btn-primary">visitar</a>
		</div>
	</div>

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