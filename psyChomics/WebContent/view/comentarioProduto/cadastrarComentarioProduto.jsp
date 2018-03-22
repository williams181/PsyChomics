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

	<c:import url="/view/comum/menuUsuario.jsp" />

	<br>

	<input type="hidden" name="id" value="${produto.id}" />

	<div class="alert alert-dark" role="alert">
		<h4 class="text-uppercase">Comentarios dos produtos</h4>
	</div>

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
						<p class="list-group-item list-group-item-action" href="removerComentarioProduto?id=${cp.id}">Remover</p>
						<p class="list-group-item list-group-item-action" href="exibirAlterarComentarioProduto?id=${cp.id}">Remover</p>
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