<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Sistema de Controle de Estoque</title>

<link rel="stylesheet" type="text/css" href="view/css/estilo.css" />
<link rel="stylesheet" type="text/css" href="view/bootstrap/css/bootstrap.min.css" />
  
<script type="text/javascript" src="view/js/jquery-2.1.4.js"></script>
<script type="text/javascript" src="view/bootstrap/js/bootstrap.min.js"></script>

</head>

<body id="corpoPadrao">

<c:import url="/view/comum/menu.jsp" />

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
					<td style="float: left; font-size: 24px;">Lista de <strong>Genero
							de Produto</strong>
					</td>
					<td style="float: right;"><a href="exibirIncluirGeneroProduto"
						class="btn btn-primary" role="button">Inclusão de Genero</a></td>
				</tr>
			</table>
			</p>

			<hr />
			
			<table class="table table-striped table-bordered">
				<thead>
					<tr>
						<th style="width: 70%; vertical-align: middle;">Descrição</th>
						<th style="width: 20%; vertical-align: middle; text-align: center;">Ações</th>
					</tr>
				</thead>
				<c:forEach items="${listarGeneroProduto}" var="c">
					<tr>
						<td style="vertical-align: middle;">${c.descricao}</td>
						<td style="vertical-align: middle; text-align: center;">
							<a href="exibirAlterarGeneroProduto?id=${c.id}" class="btn btn-warning" role="button">E</a> &nbsp;
							<a href="removerGeneroProduto?id=${c.id}" class="btn btn-danger" role="button">R</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
			
	</div>
	
	<br />
	
	<hr class="linhaSeparador">
	<div class="textoRodape">
		<p><c:import url="/view/comum/textoRodape.jsp" /></p>
	</div>
	
</body>
</html>
