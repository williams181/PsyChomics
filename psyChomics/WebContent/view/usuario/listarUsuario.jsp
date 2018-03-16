<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Sistema de Controle de Usuário</title>

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
					<td style="float: left; font-size: 24px;">Lista de <strong>
							de Usuário</strong>
					</td>
					<td style="float: right;"><a href="exibirCadastrarUsuario"
						class="btn btn-primary" role="button">Inclusão de Usuário</a></td>
				</tr>
			</table>
			</p>

			<hr />

			<table class="table table-striped table-bordered">
				<thead>
					<tr>
						<th style="width: 20%; vertical-align: middle;">Email</th>
						<th style="width: 20%; vertical-align: middle;">Nick</th>
						<th style="width: 20%; vertical-align: middle;">Nome do
							Usuário</th>
						<th style="width: 20%; vertical-align: middle;">CPF</th>
						<th style="width: 20%; vertical-align: middle;">Ações</th>
					</tr>
				</thead>
				<c:forEach items="${listarUsuario}" var="c">
					<tr>
						<td style="vertical-align: middle;">${c.email}</td>
						<td style="vertical-align: middle;">${c.nick}</td>
						<td style="vertical-align: middle;">${c.nomeUsuario}</td>
						<td style="vertical-align: middle;">${c.cpf}</td>
						<td style="vertical-align: middle;"><a
							href="removerUsuario?id=${c.id}" class="btn btn-danger"
							role="button">Remover</a> <a
							href="exibirAlterarUsuario?id=${c.id}">Alterar</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>

	</div>

	<br />

	<hr class="linhaSeparador">

</body>
</html>
