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
					<td style="float: left; font-size: 24px;">Alteração de <strong>de
							Produto</strong>
					</td>
					<td style="float: right;"><a href="listarProduto"
						class="btn btn-primary" role="button">lista de Produto</a></td>
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
					<textarea class="form-control">
					${produto.descricao} 
					</textarea>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="nacionalidade"
						id="inputNacionalidade" value="nacional"
						value="${produto.nacionalidade}" checked> <label
						class="form-check-label" value="nacional" for="inputNacionalidade">
						Nacional</label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="nacionalidade"
						id="inputNacionalidade" value="importado"
						value="${produto.nacionalidade}"> <label
						class="form-check-label" value="importado"
						for="inputNacionalidade"> Importado</label>
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
<div class="textoRodape">
		<p><c:import url="/view/comum/textoRodape.jsp" /></p>
	</div>


</body>
</html>
