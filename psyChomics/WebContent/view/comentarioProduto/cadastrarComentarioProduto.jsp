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
<title>Cadastro de Comentarios</title>
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-light bg-light"> <a
		class="navbar-brand" href="listarProdutoIndex"><img
		src="view/imagens/nav.png" width="50%"></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link"
				href="listarProdutoIndex">Início<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="exibirQuemSomos">Quem
					somos</a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false">Cadastrar</a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="exibirCadastrarProduto">Produtos</a>
					<a class="dropdown-item" href="exibirCadastrarUsuario">Usuários</a>
					<a class="dropdown-item" href="exibirIncluirCategoriaProduto">Categoria</a>
					<a class="dropdown-item" href="exibirIncluirGeneroProduto">Gênero</a>
					<a class="dropdown-item" href="exibirIncluirTipoProduto">Tipo</a>
				</div></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false">Listar</a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="listarUsuario">Usuários</a> <a
						class="dropdown-item" href="listarProduto">Produtos</a> <a
						class="dropdown-item" href="listarCategoriaProduto">Categoria</a>
					<a class="dropdown-item" href="listarGeneroProduto">Gênero</a> <a
						class="dropdown-item" href="listarTipoProduto">Tipo</a>
				</div></li>
			<li class="nav-item"><a class="nav-link"
				href="exibirPerfilUsuario">Perfil</a></li>
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
				type="submit">Buscar</button>
		</form>
	</div>
	</nav>

	<input type="hidden" name="id" value="${produto.id}" />

	<center>
		<div class="alert alert-dark" role="alert">
			<h4 class="text-uppercase">Comentarios dos Produtos</h4>
		</div>
	</center>

	<br>

	<div class="container">
		<form action="cadastrarComentarioProduto" method="post"
			enctype="multipart/form-data">
			<div class="form-group shadow-textarea">
				<label for="inputComentario">New Comentario</label>
				<textarea type="text" id="inputComentario" class="form-control"
					name="comentario" placeholder="comentario" maxlength="600" rows="4"
					required="required" class="form-control z-depth-1"></textarea>
			</div>
			<input type="hidden" name="produto.id" value="${produto.id}" />
			<button type="submit" class="btn btn-primary" value="cadastrar">Cadastrar
				Comentário</button>
		</form>
	</div>

	<br>

	<div class="container">
		<div class="row">
			<div class="col-sm-6">
				<c:forEach var="cp" items="${listarComentarioProduto}">
					<div class="list-group">
						<p class="list-group-item list-group-item-action">${cp.usuario.nomeUsuario}</p>
						<p class="list-group-item list-group-item-action">${cp.comentario}</p>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>

	<br>
	<div class="card">
		<div class="card-header">Olá</div>
		<div class="card-body">
			<h5 class="card-title">Saiba mais sobre nós!</h5>
			<p class="card-text">Visite nossas redes sociais</p>
			<a href="#" class="btn btn-primary">Abrir</a>
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