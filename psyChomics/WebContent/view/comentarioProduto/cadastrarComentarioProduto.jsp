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
<title>cadastro de Comentarios</title>
</head>
<body>



	<nav class="navbar navbar-expand-lg navbar-light bg-light"> <a
		class="navbar-brand" href="#">PsyChomics</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link"
				href="listarProdutoIndex">Home <span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="exibirQuemSomos">Quem
					somos</a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> Produtos </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="listarProduto">listar de
						produtos</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">mais um link?</a>
				</div></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> Usuarios </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="listarUsuario">Lista de Usuarios</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">mais um link?</a>
				</div></li>
			<li class="nav-item"><a class="nav-link"
				href="exibirCadastrarUsuario">Cadastre-se</a></li>
			<li class="nav-item"><a class="nav-link"
				href="exibirLoginUsuario">Login</a></li>
			<li class="nav-item"><a class="nav-link" href="logout">Logout</a></li>
		</ul>
		<form class="form-inline my-2 my-lg-0" action="buscarProduto">
			<input class="form-control mr-sm-2" type="text"
				pplaceholder="Procurar.." id="inputNome" name="nome" for="inputNome"
				aria-label="Search">
			<button class="btn btn-outline-success my-2 my-sm-0" value="buscar"
				type="submit">Search</button>
		</form>
	</div>
	</nav>


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
				<img class="d-block w-100" src="view/imagens/bg3.png"
					alt="segundo slide">
			</div>

			<div class="carousel-item">
				<img class="d-block w-100" src="view/imagens/bg3.png"
					alt="terceiro slide">
			</div>

			<div class="carousel-item">
				<img class="d-block w-100" src="view/imagens/bg3.png"
					alt="quarto slide">
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Proximo</span>
		</a>
	</div>



	<div class="card">
		<div class="card-body">Cadastre seu comentario</div>
	</div>



	<div align="right" style="color: #6E6E6E; margin-right: 2%;">Bem
		vindo, ${usuarioLogado.nomeUsuario}</div>



	<div class="card">
		<div class="card-body">${msg}</div>
	</div>



	<center>
		<h3>${usuarioLogado.email}</h3>
	</center>



	<center>
		<form action="cadastrarComentarioProduto" method="post"
			enctype="multipart/form-data">
			<div class="form-group col-md-6">
				<label for="inputComentario">Comentario</label> <input type="text"
					id="inputComentario" class="form-control" name="comentario"
					placeholder="comentario" maxlength="500" required="required">
			</div>
			<div class="form-group col-md-6">
				<label for="inputData">Data</label> <input type="date"
					id="inputData" class="form-control" name="data"
					placeholder="01/01/2001" maxlength="10" required="required">
			</div>
			<input type="hidden" name="id"
				value="${comentarioProduto.produto.id}" /> <input type="hidden"
				name="id" value="${comentarioProduto.usuario.id}" />
			<button type="submit" class="btn btn-primary" value="cadastrar">Cadastrar</button>
		</form>
	</center>



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