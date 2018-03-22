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
<title>Index</title>
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
			<c:choose>
				<c:when test="${usuarioLogado.tipoUsuario == 'administrador'}">
					<li class="nav-item"><a class="nav-link"
						href="exibirControleEstoque">administrador</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Perfil</a></li>
					<li class="nav-item"><a class="nav-link" href="logout">Logout</a></li>
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${usuarioLogado.tipoUsuario == 'usuario'}">
					<li class="nav-item"><a class="nav-link" href="listarProduto">Produtos</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Perfil</a></li>
					<li class="nav-item"><a class="nav-link" href="logout">Logout</a></li>
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>
			<c:if test="${usuarioLogado.tipoUsuario eq null}">
				<li class="nav-item"><a class="nav-link" href="listarProduto">Produtos</a></li>
				<li class="nav-item"><a class="nav-link"
					href="exibirCadastrarUsuario">Cadastre-se</a></li>
				<li class="nav-item"><a class="nav-link"
					href="exibirLoginUsuario">Login</a></li>
			</c:if>


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



	<center>
		<form action="alterarUsuario" method="post"
			enctype="multipart/form-data">

			<div class="form-group col-md-6">
				<label for="inputEmail">Email</label> <input type="text"
					id="inputEmail" class="form-control" name="email"
					value="${usuario.email}" maxlength="50" required="required" /> <input
					type="hidden" name="id" value="${usuario.id}" />
			</div>

			<div class="form-group col-md-6">
				<label for="inputSenha">Senha</label> <input type="password"
					id="inputSenha" class="form-control" name="senha"
					value="${usuario.senha}" maxlength="16" required="required" />
			</div>

			<div class="form-group col-md-6">
				<label for="inputNick">Nick</label> <input type="text"
					id="inputNick" class="form-control" name="nick"
					value="${usuario.nick}" maxlength="15" required="required" />
			</div>
			<div class="form-group col-md-6">
				<label for="inputNomeUsuario">Nome do usuário</label> <input
					type="text" id="inputNomeUsuario" class="form-control"
					name="nomeUsuario" value="${usuario.nomeUsuario}" maxlength="50"
					required="required" />
			</div>
			<div class="form-check">
				<input class="form-check-input" type="radio" name="tipoUsuario"
					id="inputTipoUsuario" value="usuario" value="${usuario.tipoUsuario}" checked>
				<label class="form-check-label" value="usuario"
					for="inputTipoUsuario"> Usuário</label>
			</div>
			<div class="form-check">
				<input class="form-check-input" type="radio" name="tipoUsuario"
					id="inputTipoUsuario" value="administrador" value="${usuario.tipoUsuario}"> <label
					class="form-check-label" value="administrador"
					for="inputTipoUsuario"> Administrador</label>
			</div>
			
			<div class="form-group col-md-6">
				<input type="checkbox" class="form-check-input" value="sim"
					name="notificacao" for="notificacao" id="notificacao"> <label
					class="form-check-label" value="sim" value="${usuario.notificacao} name="notificacao"
					for="notificacao">Deseja Receber notificações ?</label>
			</div>
			<p>
				<input type="submit" class="btn btn-primary" value="alterar">
				<a href="listarProdutoIndex" class="btn btn-danger" role="button">Cancelar</a>
			</p>
		</form>

	</center>


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