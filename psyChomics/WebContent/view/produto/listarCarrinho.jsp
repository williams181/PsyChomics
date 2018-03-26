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
			<h4 class="text-uppercase">Carrrinho de Compras</h4>
		</div>
	</center>

	<br>

	<center>
		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col">Produto</th>
					<th scope="col">Preço</th>
					<th scope="col">Quantidade</th>
					<th scope="col">Valor total</th>
				</tr>
			</thead>
			<c:forEach items="${listaCarrinho}" var="item">
				<tbody>
					<tr>
						<th scope="row">${item.produto.nome}</th>
						<td>${item.produto.preco}</td>
						<td>${item.quantidade}</td>
						<td>${item.produto.preco * item.quantidade}</td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
	</center>

	<br>

	<center>
		<div class="form-check form-check-inline">
			<input class="form-check-input" type="radio"
				name="inlineRadioOptions" id="inlineRadio1" value="option1">
			<label class="form-check-label" for="inlineRadio1"><img
				src="view/imagens/p.png"></label>
		</div>
		<div class="form-check form-check-inline">
			<input class="form-check-input" type="radio"
				name="inlineRadioOptions" id="inlineRadio2" value="option2">
			<label class="form-check-label" for="inlineRadio2"><img
				src="view/imagens/v.png"></label>
		</div>
		<div class="form-check form-check-inline">
			<input class="form-check-input" type="radio"
				name="inlineRadioOptions" id="inlineRadio1" value="option1">
			<label class="form-check-label" for="inlineRadio1"><img
				src="view/imagens/m.png"></label>
		</div>
		<div class="form-check form-check-inline">
			<input class="form-check-input" type="radio"
				name="inlineRadioOptions" id="inlineRadio2" value="option2">
			<label class="form-check-label" for="inlineRadio2"><img
				src="view/imagens/b.png"></label>
		</div>
	</center>

	<br>

	<a href="concluirVenda" class="btn btn-info" role="button">CONCLUIR
		COMPRA</a> &nbsp;

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