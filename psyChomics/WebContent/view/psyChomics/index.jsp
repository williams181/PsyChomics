<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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

<style>
body {
	background-image: url(view/psyChomics/imagens/bg.jpg);
}
</style>


<title>Index</title>

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
				<li><a href="exibirLoginUsuario">Login Usuario</a></li>
				<li><a href="exibirCadastroUsuario">Cadastro Usuario</a></li>
				<li><a href="listarUsuario">Listagem Usuario</a></li>
				<li><a href="exibirCadastroProduto">Cadastro Produto</a></li>
				<li><a href="listarProduto">Listagem Produto</a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container --> </nav>

	<!-- Page Content -->
	<div class="container">


		<!-- Jumbotron Header -->
		<header class="jumbotron hero-spacer">
		<h1>Bem Vindo!</h1>
		<p>Identifique-se para fazer pedidos</p>
		<p>
			<a class="btn btn-primary btn-large">Entrar</a>
		</p>
		</header>

		<hr>

		<!-- Title -->
		<div class="row">
			<div class="col-lg-12">
				<h3 style="text-align: center; color: red;">Novos Produtos</h3>
			</div>
		</div>
		<!-- /.row -->
		<jsp:useBean id="dao" class="br.com.ifpe.psyChomics.model.ProdutoDao" />

		<!-- Page Features -->
		<div class="row text-center">
		
			<c:forEach var="produto" items="${listaProdutoIndex}">
				<div class="col-md-3 col-sm-6 hero-feature">
					<div class="thumbnail">
						<img src="view/psyChomics/img/" width="525" height="525"${produto.imagem}">
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

		<hr>

		<!-- Footer -->
		<footer>
		<div class="row text-center">
			<div class="col-lg-12">
				<p style="text-align: center; color: red;">Copyright &copy; BY
					WILLIAM ROBERTO</p>
			</div>
		</div>
		</footer>

	</div>
	<!-- /.container -->

	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

</body>

</html>
