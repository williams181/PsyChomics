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
<title>Cadastro de Usuário</title>
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
		<h4 class="text-uppercase">Cadastrar mensagem</h4>
	</div>

	<br>

	<div class="container">
		<form action="cadastrarMensagemFaleConosco" method="post"
			enctype="multipart/form-data">
			<div class="form-group col-md-6">
				<label for="inputEmail">&nbsp; Email</label> <input type="email"
					class="form-control" id="exampleInputEmail1" name="email"
					aria-describedby="emailHelp" maxlength="50" placeholder="email">
				<small id="emailHelp" class="form-text text-muted">bem vindo</small>
			</div>
			<div class="form-group col-md-6">
				<label for="inputNomeUsuario">Nome do Usuário</label> <input
					type="text" id="inputNomeUsuario" class="form-control"
					name="NomeUsuario" placeholder="Nome do Usuário" maxlength="50"
					minlength="10" required="required">
			</div>
			<div class="form-group col-md-6">
				<label for="inputMensagem">Mensagem</label>
				<textarea for="inputMensagem" id="inputMensagem"
					class="form-control" placeholder="Mensagem" name="mensagem"
					style="width: 500px;" maxlength="600" required="required"></textarea>
			</div>
			<button type="submit" class="btn btn-primary" value="cadastrar">Cadastrar</button>
		</form>
	</div>

	<br>

	<div class="card">
		<div class="card-header">olá</div>
		<div class="card-body">
			<h5 class="card-title">saiba mais sobre nós</h5>
			<p class="card-text">visite nossas redes sociais</p>
			<a href="#" class="btn btn-primary">abrir</a>
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