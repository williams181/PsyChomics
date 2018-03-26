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
			<h4 class="text-uppercase">Fale Conosco</h4>
		</div>
	</center>
	
	<c:if test="${msg ne null}">
		<center>
			<div class="alert alert-light" role="alert">${msg}</div>
		</center>
	</c:if>

	<br>

	<center>
		<form action="cadastrarMensagemFaleConosco" method="post"
			enctype="multipart/form-data">
			<div class="form-group col-md-6">
				<label for="inputEmail">&nbsp; Email</label> <input type="email"
					class="form-control" id="exampleInputEmail1" name="email"
					aria-describedby="emailHelp" maxlength="50" placeholder="Email">
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
					style="width: 500px;" maxlength="600"  rows="5" required="required"></textarea>
			</div>
			<button type="submit" class="btn btn-primary" value="cadastrar">CADASTRAR</button>
		</form>
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