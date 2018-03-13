<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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

</head>

<body id="corpoPadrao">



	<div align="center">

		<div align="left" style="color: #6E6E6E; width: 70%;">

			<c:if test="${msg ne null}">
				<div class="alert alert-success" style="width: 100%;">
					<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					${msg}
				</div>
			</c:if>

			<hr />

			<p>
			<table style="width: 100%">
				<tr>
					<td style="float: left; font-size: 24px;">Listagem de <strong>Tipo
							de Produto</strong>
					</td>
					<td style="float: right;"><a href="ListarProdutoIndex"
						class="btn btn-primary" role="button">Home</a></td>
					<td style="float: right;"><a href="exibirIncluirGeneroProduto"
						class="btn btn-primary" role="button">Novo Genero</a></td>
					<td style="float: right;"><a
						href="exibirIncluirCategoriaProduto" class="btn btn-primary"
						role="button">Nova Categoria</a></td>
					<td style="float: right;"><a href="exibirIncluirTipoProduto"
						class="btn btn-primary" role="button">Novo Tipo</a></td>
					<td style="float: right;"><a href="exibirCadastrarProduto"
						class="btn btn-primary" role="button">Novo Produto</a></td>
				</tr>
			</table>
			</p>
			<hr />

			<table class="table table-striped table-bordered">
				<thead>
					<tr>
						<th style="width: 70%; vertical-align: middle;">Descrição</th>
						<th
							style="width: 20%; vertical-align: middle; text-align: center;">Ações</th>
					</tr>
				</thead>
				<c:forEach items="${listarTipoProduto}" var="c">
					<tr>
						<td style="vertical-align: middle;">${c.descricao}</td>
						<td style="vertical-align: middle; text-align: center;"><a
							href="exibirAlterarTipoProduto?id=${c.id}"
							class="btn btn-warning" role="button">E</a> &nbsp; <a
							href="removerTipoProduto?id=${c.id}" class="btn btn-danger"
							role="button">R</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>

	</div>

	<br />

	<hr class="linhaSeparador">

</body>
</html>
