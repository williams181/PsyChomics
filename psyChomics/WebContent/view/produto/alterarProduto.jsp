<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Sistema de Controle de Estoque</title>

<link rel="stylesheet" type="text/css" href="view/css/estilo.css" />
<link rel="stylesheet" type="text/css"
	href="view/bootstrap/css/bootstrap.min.css" />

<script type="text/javascript" src="view/js/jquery-2.1.4.js"></script>
<script type="text/javascript" src="view/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="view/js/maskedinput.js"></script>

</head>

<body id="corpoPadrao">

	<div align="center">

		<div align="left" style="color: #6E6E6E; width: 70%; margin-top: 4%;">

			<c:if test="${msg ne null}">
				<div class="alert alert-error" style="width: 70%;">
					<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					${msg}
				</div>
			</c:if>

			<hr />

			<p>
			<table style="width: 100%">
				<tr>
					<td style="float: left; font-size: 24px;">Alterar <strong>Produto</strong>
					</td>
					<td style="float: right; text-align: right;"><img
						src="view/img/editar.jpg" style="width: 20%;"></td>
				</tr>
			</table>
			</p>

			<hr />
			<form action="alterarProduto" method="post"
				enctype="multipart/form-data">
				<div class="form-group">
					<label for="inputNome">Nome</label> <input type="text"
						id="inputNome" class="form-control" name="nome"
						value="${produto.nome}" style="width: 500px;" maxlength="50"
						required="required" />
					<form:errors path="produto.nome" cssStyle="color:red" />
				</div>
				<div class="form-group">
					<label for="inputPreco">Preço</label> <input type="text"
						id="inputPreco" class="form-control" name="preco"
						value="${produto.preco}" style="width: 500px;" maxlength="100"
						required="required" />
					<form:errors path="produto.preco" cssStyle="color:red" />
				</div>
				<div class="form-group">
				<label for="inputDescricao">Descrição</label>
					<textarea>
					${produto.descricao}
					</textarea>
				</div>
				<p>
					<input type="hidden" name="id" value="${produto.id}" /> <input
						type="submit" class="btn btn-primary" value="alterar"> <a
						href="listarProdutoIndex" class="btn btn-danger" role="button">Cancelar</a>
				</p>
			</form>
		</div>

	</div>

	<br />

	<hr class="linhaSeparador">



</body>
</html>
