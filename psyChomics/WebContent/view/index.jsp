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

	<div class="alert alert-success" role="alert">
		<h4 class="alert-heading">Bem vindo!</h4>
		<p>Este é o PsyChomics! A Sua loja de Quadrinhos!</p>
		<hr>
		<p class="mb-0"><i>"Vida longa e próspera."</i></p>
	</div>

	<br>

	<center>
		<div class="alert alert-dark" role="alert">
			<h4 class="text-uppercase">Produtos Nacionais</h4>
		</div>
	</center>

	<br>
	
		<c:import url="/view/comum/utilitario.jsp" />

	<center>
		<div class="row">
			<c:forEach var="p" items="${listaProdutoIndex}">
				<div class="col">
					<div class="card" style="width: 18rem;">
						<img class="card-img-top" src="view/img/${p.imagem}"
							alt="Card image cap">
						<div class="card-body">
							<h5 class="card-title">${p.nome}</h5>
							<h6 class="card-title">${p.preco}</h6>
							<p class="card-text">${p.nacionalidade}</p>
							<a href="exibirDescricaoProduto?id=${p.id}"
								class="btn btn-primary">Descrição</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</center>

	<br>

	<center>
		<div class="alert alert-dark" role="alert">
			<h4 class="text-uppercase">Produtos Importados</h4>
		</div>
	</center>

	<br>

	<center>
		<div class="row">
			<c:forEach var="p" items="${listaProdutoIndex2}">
				<div class="col">
					<div class="card" style="width: 18rem;">
						<img class="card-img-top" src="view/img/${p.imagem}"
							alt="Card image cap">
						<div class="card-body">
							<h5 class="card-title">
								<strong>${p.nome}</strong>
							</h5>
							<h6 class="card-title">${p.preco}</h6>
							<p class="card-text">${p.nacionalidade}</p>
							<a href="exibirDescricaoProduto?id=${p.id}"
								class="btn btn-primary">Descrição</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</center>

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