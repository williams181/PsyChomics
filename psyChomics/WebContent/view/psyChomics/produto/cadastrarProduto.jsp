<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<link rel="stylesheet" type="text/css"
	href="view/psyChomics/bootstrap/css/bootstrap.min.css" />
<script type="text/javascript" src="view/bootstrap/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Cadastro</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/heroic-features.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="listarProdutoIndex">PsyChomics</a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="exibirLoginUsuario">Login de Usuário</a></li>
				<li><a href="exibirCadastroUsuario">Cadastro de Usuário</a></li>
				<li><a href="listarUsuario">Listagem de Usuário</a></li>
				<li><a href="exibirCadastroProduto">Cadastro de Produto</a></li>
				<li><a href="listarProduto">Listagem de Produto</a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container --> </nav>

	<br>
	<br>
	<div class="container" align="center">
		<hr>
		<h3>Cadastro de Produto</h3>
		<hr>
	</div>

	<c:import url="/view/comum/menu.jsp" />

	<div style="text-align: center; color: green;">${mensagem}</div>

	<div class="container" align="center">
		<form action="cadastroProduto" method="post"
			enctype="multipart/form-data">
			<div class="form-group">
				<label for="inputNome">Nome</label> <input type="text"
					id="inputNome" class="form-control" name="nome"
					style="width: 500px;" placeholder="Nome" minlength="3" maxlength="60"
					required="required" />
			</div>
			<div class="form-group">
				<label for="inputPreco">Preço</label> <input type="text"
					id="inputPreco" class="form-control" name="preco"
					style="width: 500px;" placeholder="Preco" minlength=1" maxlength="16"
					required="required" />
			</div>
			<div class="form-group">
				<label for="inputGenero">Gênero</label> <input type="text"
					id="inputGenero" class="form-control" name="genero"
					style="width: 500px;" placeholder="Genero" minlength="3" maxlength="60"
					required="required" />
			</div>
			<div class="form-group">
				<label for="inputImagem">Imagem</label> <input type="file"
					id="inputImagem" class="form-control" name="file"
					style="width: 500px;"  maxlength="100"/>
			</div>
			<p>
				<a href="exibirIndex" class="btn btn-danger" role="button">Cancelar</a>
				&nbsp;
				<button type="reset" class="btn btn-default">&nbsp; Limpar
					&nbsp;</button>
				&nbsp;
				<button type="submit" value="cadastar" class="btn btn-primary">&nbsp;
					Cadastrar &nbsp;</button>
			</p>
		</form>
	</div>
</body>
</html>