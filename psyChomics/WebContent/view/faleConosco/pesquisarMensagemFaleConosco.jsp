<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Lista de mensagem (faleConosco)</title>

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
					<td style="float: left; font-size: 24px;">Listagem de <strong>Mensagem</strong>
					</td>
					<td style="float: right;"><a href="exibirFaleConosco"
						class="btn btn-primary" role="button">Novo</a></td>
				</tr>
			</table>
			</p>

			<hr />

			<table class="table table-striped table-bordered">
				<thead>
					<tr>
						<th style="width: 20%; vertical-align: middle;">Email</th>
						<th style="width: 20%; vertical-align: middle;">Nome do
							Usuário</th>
						<th style="width: 20%; vertical-align: middle;">Mensagem</th>
						<th style="width: 20%; vertical-align: middle;">Ações</th>
					</tr>
				</thead>
				<c:forEach items="${listarFaleConosco}" var="f">
					<tr>
						<td style="vertical-align: middle;">${f.email}</td>
						<td style="vertical-align: middle;">${f.nomeUsuario}</td>
						<td style="vertical-align: middle;">${f.mensagem}</td>
						<td style="vertical-align: middle;"><a
							href="removerMensagemFaleConosco?id=${f.id}"
							class="btn btn-danger" role="button">Remover</a> <a
							href="exibirAlterarMensagemFaleConosco?id=${f.id}"
							class="btn btn-danger" role="button">Alterar</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>

	</div>

	<br />

	<hr class="linhaSeparador">

</body>
</html>
