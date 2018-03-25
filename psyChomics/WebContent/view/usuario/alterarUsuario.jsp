<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>PsyChomics</title>

<link rel="stylesheet" type="text/css" href="view/css/estilo.css" />
<link rel="stylesheet" type="text/css"
	href="view/bootstrap/css/bootstrap.min.css" />

<script type="text/javascript" src="view/js/jquery-2.1.4.js"></script>
<script type="text/javascript" src="view/bootstrap/js/bootstrap.min.js"></script>

</head>

<body id="corpoPadrao">

	<c:import url="/view/comum/menu.jsp" />

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
					<td style="float: left; font-size: 24px;">Listagem de <strong>Usuário</strong>
					</td>
					<td style="float: right;"><a href="exibirCadastrarUsuario"
						class="btn btn-primary" role="button">Novo</a></td>
				</tr>
			</table>
			</p>

			<hr />


			<form action="alterarUsuario" method="post"
				enctype="multipart/form-data">

				<div class="form-group col-md-6">
					<label for="inputEmail">Email</label> <input type="text"
						id="inputEmail" class="form-control" name="email"
						value="${usuario.email}" maxlength="50" required="required" /> <input
						type="hidden" name="id" value="${usuario.id}" />
				</div>

				<div class="form-group col-md-6">
					<label for="inputSenha">Senha</label> <input type="password"
						id="inputSenha" class="form-control" name="senha"
						value="${usuario.senha}" maxlength="16" required="required" />
				</div>

				<div class="form-group col-md-6">
					<label for="inputNick">Nick</label> <input type="text"
						id="inputNick" class="form-control" name="nick"
						value="${usuario.nick}" maxlength="15" required="required" />
				</div>
				<div class="form-group col-md-6">
					<label for="inputNomeUsuario">Nome do usuário</label> <input
						type="text" id="inputNomeUsuario" class="form-control"
						name="nomeUsuario" value="${usuario.nomeUsuario}" maxlength="50"
						required="required" />
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="tipoUsuario"
						id="inputTipoUsuario" value="usuario"
						value="${usuario.tipoUsuario}" checked> <label
						class="form-check-label" value="usuario" for="inputTipoUsuario">
						Usuário</label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="tipoUsuario"
						id="inputTipoUsuario" value="administrador"
						value="${usuario.tipoUsuario}"> <label
						class="form-check-label" value="administrador"
						for="inputTipoUsuario"> Administrador</label>
				</div>

				<div class="form-group col-md-6">
					<input type="checkbox" class="form-check-input" value="sim"
						name="notificacao" for="notificacao" id="notificacao"> <label
						class="form-check-label" value="sim"
						value="${usuario.notificacao} name="
						notificacao"
					for="notificacao">Deseja Receber
						notificações ?</label>
				</div>
				<p>
					<input type="submit" class="btn btn-primary" value="alterar">
					<a href="listarProdutoIndex" class="btn btn-danger" role="button">Cancelar</a>
				</p>
			</form>
		</div>

	</div>

	<br />

	<hr class="linhaSeparador">
	<div class="textoRodape">
		<p>
			<c:import url="/view/comum/textoRodape.jsp" />
		</p>
	</div>
</body>
</html>




