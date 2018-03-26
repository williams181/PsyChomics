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
			<h4 class="text-uppercase">Pedido de Produto</h4>
		</div>
	</center>
	
	<c:if test="${msg ne null}">
		<center>
			<div class="alert alert-light" role="alert">${msg}</div>
		</center>
	</c:if>

	<br>

	<center>
		<form action="cadastrarPedido" method="post"
			enctype="multipart/form-data">
			<div class="form-group col-md-6">
				<label for="inputMensagem"><h4>Produto Desejado</h4></label>
				<textarea type="text" id="inputMensagem" class="form-control"
					name="mensagem" placeholder="mensagem" maxlength="600"
					required="required" rows="5" style="width: 600px;"></textarea>
			</div>
			<input type="hidden" name="usuario.id" value="${usuarioLogado.id}" />
			<button type="submit" class="btn btn-primary" value="cadastrar">Cadastrar</button>
		</form>
		<br>
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