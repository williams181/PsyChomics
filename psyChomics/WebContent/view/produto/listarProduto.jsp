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

		<nav class="navbar navbar-expand-lg navbar-light bg-light"> <a
		class="navbar-brand" href="listarProdutoIndex"><img src="\imagens\nav.png" width="50%"></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link"
				href="listarProdutoIndex">Início<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="exibirQuemSomos">Quem
					somos</a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false">Cadastrar</a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="exibirCadastrarProduto">Produtos</a>
 					<a class="dropdown-item" href="exibirCadastrarUsuario">Usuários</a>
 					<a class="dropdown-item" href="incluirCategoriaProduto">Categoria</a>
 					<a class="dropdown-item" href="incluirGeneroProduto">Gênero</a> 
				</div></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false">Listar</a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="listarUsuario">Usuários</a>
					<a class="dropdown-item" href="listarProduto">Produtos</a>
					<a class="dropdown-item" href="listarCategoriaProduto">Categoria</a>
					<a class="dropdown-item" href="listarGeneroProduto">Gênero</a>
				</div></li>
			<li class="nav-item"><a class="nav-link"
				href="#">Perfil</a></li>	
			<li class="nav-item"><a class="nav-link"
				href="exibirCadastrarUsuario">Cadastre-se</a></li>
			<li class="nav-item"><a class="nav-link"
				href="exibirLoginUsuario">Login</a></li>
			<li class="nav-item"><a class="nav-link" href="logout">Logout</a></li>
		</ul>
		<form class="form-inline my-2 my-lg-0" action="buscarProduto">
			<input class="form-control mr-sm-2" type="text"
				pplaceholder="Procurar.." id="inputNome" name="nome" for="inputNome"
				aria-label="Search">
			<button class="btn btn-outline-success my-2 my-sm-0" value="buscar"
				type="submit">Buscar</button>
		</form>
	</div>
	</nav>

	<div align="center">

		<div align="left" style="color: #6E6E6E; width: 70%;">

			<c:if test="${msg ne null}">
				<div class="alert alert-success" style="width: 100%;">
					<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					${msg}
				</div>
			</c:if>

			<form class="form-group" action="buscarProduto" method="post">
				<input class="form-control mr-sm-2" type="text"
					pplaceholder="Procurar.." id="inputNome" name="nome"
					for="inputNome" aria-label="Search">
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
				<button type="submit" class="btn btn-primary">&nbsp;
					Filtrar &nbsp;</button>
			</form>

			<hr />

			<p>
			<table style="width: 100%">
				<tr>
					<td style="float: left; font-size: 24px;">Listagem de <strong>Produto</strong>
					</td>
					<td style="float: right;"><a href="exibirCadastrarProduto"
						class="btn btn-primary" role="button">Novo</a></td>
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
							role="button">Alterar</a> &nbsp; <a
							href="removerProduto?id=${c.id}" class="btn btn-danger"
							role="button">Remover</a> <a
							href="exibirDescricaoProduto?id=${c.id}" class="btn btn-warning"
							role="button">Mais</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>

	</div>

	<br />

	<hr class="linhaSeparador">

</body>
</html>
