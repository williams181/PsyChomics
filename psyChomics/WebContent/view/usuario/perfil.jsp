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

	<div class="container">
		<div class="row">
			<div class="col-sm-6">
				<c:forEach var="u" items="${listarUsuario}">
					<div class="list-group">
						<p class="list-group-item list-group-item-action">${u.email}</p>
						<p class="list-group-item list-group-item-action">${u.senha}</p>
						<p class="list-group-item list-group-item-action">${u.nick}</p>
						<p class="list-group-item list-group-item-action">${u.nomeUsuario}</p>
						<p class="list-group-item list-group-item-action">${u.tipoUsuario}</p>
						<p class="list-group-item list-group-item-action">${u.notificacao}</p>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>

	<br>

	<div class="container">
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
					id="inputTipoUsuario" value="usuario"
					value="${usuario.tipoUsuario}" checked> <label
					class="form-check-label" value="usuario" for="inputTipoUsuario">
					Usuário</label>
			</div>
			<div class="form-check">
				<input class="form-check-input" type="radio" name="tipoUsuario"
					id="inputTipoUsuario" value="administrador"
					value="${usuario.tipoUsuario}"> <label
					class="form-check-label" value="administrador"
					for="inputTipoUsuario"> Administrador</label>
			</div>

			<div class="form-group col-md-6">
				<input type="checkbox" class="form-check-input" value="sim"
					name="notificacao" for="notificacao" id="notificacao"> <label
					class="form-check-label" value="sim"
					value="${usuario.notificacao} name="
					notificacao"
					for="notificacao">Deseja Receber
					notificações ?</label>
			</div>
			<p>
				<input type="submit" class="btn btn-primary" value="alterar">
				<a href="listarProdutoIndex" class="btn btn-danger" role="button">Cancelar</a>
			</p>
		</form>
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