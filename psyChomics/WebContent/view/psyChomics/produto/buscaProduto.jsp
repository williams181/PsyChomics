<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="pt-br">
<head>
<link rel="stylesheet" type="text/css"
	href="view/psyChomics/bootstrap/css/bootstrap.min.css" />
<script type="text/javascript" src="view/bootstrap/js/bootstrap.min.js"></script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
body {
	background-color: #EEE9E9;
	background-image: url();
}

/* 
       Remover a margem padrÃ£o da barra de navegaÃ§Ã£o - bordas inferior e arredondadas */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
}

/* 
        Adiciona uma cor de fundo cinza e algum preenchimento ao rodapÃ© */
footer {
	background-color: #f2f2f2;
	padding: 25px;
}

.carousel-inner img {
	width: 100%; /*
                      Defina largura para 100% */
	margin: auto;
	min-height: 200px;
}

/* 
      Oculta o texto do carrossel quando a tela tiver menos de 600 pixels de largura */
@media ( max-width : 600px) {
	.carousel-caption {
		display: none;
	}
}

.dropdown {
	float: left;
	overflow: hidden;
}

.dropdown .dropbtn {
	font-size: 16px;
	border: none;
	outline: none;
	color: white;
	padding: 14px 16px;
	background-color: inherit;
	font-family: inherit;
	margin: 0;
}

.navbar a:hover, .dropdown:hover .dropbtn {
	background-color: red;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

<<<<<<< HEAD
.dropdown-content a {
	float: none;
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
	text-align: left;
}

.dropdown-content a:hover {
	background-color: #ddd;
}

.dropdown:hover .dropdown-content {
	display: block;
}

* {
	box-sizing: border-box;
}

body {
	margin: 0;
	font-family: Arial;
}
/*SEARCH*/
body {
	font-family: Arial;
}

* {
	box-sizing: border-box;
}

form.example input[type=text] {
	padding: 10px;
	font-size: 17px;
	border: 1px solid grey;
	float: left;
	width: 80%;
	background: #f1f1f1;
}

form.example button {
	float: left;
	width: 20%;
	padding: 13px;
	background: #6a6f72;
	color: white;
	font-size: 17px;
	border: 1px solid grey;
	border-left: none;
	cursor: pointer;
}

form.example button:hover {
	background: #e00000;
}

form.example::after {
	content: "";
	clear: both;
	display: table;
}
</style>

<title>Buscar Produto</title>
=======

>>>>>>> versao-1602-gabriel

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
			<div class="dropdown">
				<button class="dropbtn">
					Usuario <i class="fa fa-caret-down"></i>
				</button>
<<<<<<< HEAD

=======
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
>>>>>>> versao-1602-gabriel
				</ul>
			</div>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="exibirLoginUsuario">Login Usuario</a></li>
				<li><a href="exibirCadastroUsuario">Cadastro Usuario</a></li>
				<li><a href="listarUsuario">Listagem Usuario</a></li>
				<li><a href="exibirCadastroProduto">Cadastro Produto</a></li>
				<li><a href="listarProduto">Listagem Produto</a></li>
			</ul>
		</div>

		<form action="buscaProduto" class="example" method="post">
			<input type="text" placeholder="Procurar.." for="inputNome"
				id="inputNome" name="nome">
			<button type="submit" value="buscar">
				<i class="fa fa-search"></i>
			</button>
		</form>

		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container --> </nav>

	<br>
	<br>
	<div class="container" align="center">
		<br> <br>
		<hr>
		<h3>Produtos</h3>
		<hr>
	</div>
<<<<<<< HEAD

=======
	<div style="text-align: center; color: green;">${msg}</div>
	<br>

	<div class="container" align="center">

		<form action="buscaProduto" method="post">
			<div class="form-group">
				<label for="inputGenero">Gênero</label> <input type="text"
					id="inputGenero" class="form-control" name="genero"
					style="width: 500px;" placeholder="genero" maxlength="20" />
				<p>
					<a href="exibirIndex" class="btn btn-danger" role="button">Cancelar</a>
					&nbsp;
					<button type="reset" class="btn btn-default">&nbsp; Limpar
						&nbsp;</button>
					&nbsp;
					<button type="submit" value="busca" class="btn btn-primary">&nbsp;
						Buscar &nbsp;</button>	
				</p>
			</div>
		</form>
	</div>

	<jsp:useBean id="dao" class="br.com.ifpe.psyChomics.model.ProdutoDao" />

	<div class="container" align="center">
		<table class="table">
			<tr>
				<td scope="col">Nome</td>
				<td scope="col">Preço</td>
				<td scope="col">Gênero</td>
				<td scope="col">Imagem</td>
				<td scope="col">Opções</td>
>>>>>>> versao-1602-gabriel

		<!-- Page Features -->
		<div class="row text-center">

			<c:forEach var="produto" items="${buscarProduto}">
				<div class="col-md-3 col-sm-6 hero-feature">
					<div class="thumbnail">
						<img src="view/psyChomics/img/" width="150" height="150"
							${p.imagem}>
						<div class="caption">
							<h3>${produto.nome}</h3>
							<p>${produto.preco}</p>
							<p>
								<a href="#" class="btn btn-primary">Comprar</a> <a href="#"
									class="btn btn-default">Saiba Mais</a>
							</p>
						</div>
					</div>
				</div>
			</c:forEach>

		</div>
		<!-- /.row -->
	</div>
</body>
</html>