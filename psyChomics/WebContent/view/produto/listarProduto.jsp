
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Listar Produto</title>

<link rel="stylesheet" type="text/css" href="view/css/estilo.css" />
<link rel="stylesheet" type="text/css"
	href="view/bootstrap/css/bootstrap.min.css" />

<script type="text/javascript" src="view/js/jquery-2.1.4.js"></script>
<script type="text/javascript" src="view/bootstrap/js/bootstrap.min.js"></script>

</head>

<body id="corpoPadrao">

	<nav id="divMenu" class="navbar navbar-inverse">
		<div class="container-fluid">

			<div>
				<ul class="nav navbar-nav">

					<li><a href="listarProdutoIndex">Home</a></li>

					<li><a>|</a></li>

					<li><a href="listarProduto">Produto</a></li>

					<li><a>|</a></li>

					<li><a href="listarCategoriaProduto">Categoria</a></li>

					<li><a>|</a></li>

					<li><a href="listarGeneroProduto">Genero</a></li>

					<li><a>|</a></li>

					<li><a href="listarTipoProduto">Tipo</a></li>

					<li><a>|</a></li>

					<li><a href="logout">Sair</a></li>

				</ul>
			</div>
		</div>
	</nav>

	<form class="form-group" action="buscarProduto" method="post">
		<input class="form-control mr-sm-2" type="text"
			pplaceholder="Procurar.." id="inputNome" name="nome" for="inputNome"
			aria-label="Search">
		<div class="form-group">
			<label for="generoProduto">Genero:</label> <br /> <select
				id="generoProduto" name="generoProduto"
				style="width: 200px; height: 30px; border: 1px solid #BDC7D8; color: #000000; border-top-left-radius: 5px; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px;">
				<option value="">Selecione</option>
				<c:forEach items="${listarGeneroProduto}" var="obj">
					<option value="${obj.id}"
						<c:if test="${obj.id eq produto.generoProduto.id}">selected="selected"</c:if>>
						${obj.descricao}</option>
				</c:forEach>
			</select>
		</div>
		<button type="reset" class="btn btn-default">&nbsp; Limpar
			&nbsp;</button>
		&nbsp;
		<button type="submit" class="btn btn-primary">&nbsp; Filtrar
			&nbsp;</button>
	</form>



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
					<td style="float: left; font-size: 24px;">Lista de <strong>de
							Produto</strong>
					</td>
					<td style="float: right;"><a href="exibirCadastrarProduto"
						class="btn btn-primary" role="button">Inclusão de Produto</a></td>
				</tr>
			</table>
			</p>

			<hr />

			<table class="table table-striped table-bordered">
				<thead>
					<tr>
						<th style="width: 20%; vertical-align: middle;">Categoria</th>
						<th style="width: 20%; vertical-align: middle;">Genero</th>
						<th style="width: 20%; vertical-align: middle;">Tipo</th>
						<th style="width: 20%; vertical-align: middle;">Nome</th>
						<th style="width: 20%; vertical-align: middle;">Preço</th>
						<th style="width: 20%; vertical-align: middle;">Ações</th>
					</tr>
				</thead>
				<c:forEach items="${listarProduto}" var="c">
					<tr>
						<td style="vertical-align: middle;">${c.categoriaProduto.descricao}</td>
						<td style="vertical-align: middle;">${c.generoProduto.descricao}</td>
						<td style="vertical-align: middle;">${c.tipoProduto.descricao}</td>
						<td style="vertical-align: middle;">${c.nome}</td>
						<td style="vertical-align: middle;">${c.preco}</td>
						<td style="vertical-align: middle;"><a
							href="exibirAlterarProduto?id=${c.id}" class="btn btn-warning"
							role="button">A</a><a href="removerProduto?id=${c.id}"
							class="btn btn-danger" role="button">R</a><a
							href="exibirDescricaoProduto?id=${c.id}" class="btn btn-warning"
							role="button">M</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>

	</div>

	<br />

	<hr class="linhaSeparador">
</body>
</html>
