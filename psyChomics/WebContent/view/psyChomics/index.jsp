<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="pt-br">
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
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<style>
body {
	background-color: #EEE9E9;
	background-image: url();
}

/* 
       Remover a margem padrão da barra de navegação - bordas inferior e arredondadas */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
}

/* 
        Adiciona uma cor de fundo cinza e algum preenchimento ao rodapé */
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


	<br>
	<br>
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicadores -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
			</ol>

			<!-- Quebra para Slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img src="view/psyChomics/imagens/bg.jpg" alt="Image" width="525" height="525">
					<div class="carousel-caption">
						<div>	
							<h3>
								Os melhores mangás
								<!-- aqui entra um codigo PHP-->
							</h3>
						</div>

					</div>
				</div>

				<div class="item">
					<img src="view/psyChomics/imagens/bg.jpg" width="525" height="525">
					<div class="carousel-caption">

						<div>
							<h3>Uma grande coleção de Quadrinhos</h3>
						</div>

					</div>
				</div>
			</div>

			<!-- Controles esquerdo e direito -->
			<a class="left carousel-control" href="#myCarousel" role="button"
				data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel" role="button"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>

		<hr>

		<!-- Title -->
		<div class="row">
			<div class="col-lg-12">
				<h3 style="text-align: center; color: black;">Novos Produtos</h3>
			</div>
		</div>
		<!-- /.row -->
		<jsp:useBean id="dao" class="br.com.ifpe.psyChomics.model.ProdutoDao" />

		<!-- Page Features -->
		<div class="row text-center">

			<c:forEach var="produto" items="${listaProdutoIndex}">
				<div class="col-md-3 col-sm-6 hero-feature">
					<div class="thumbnail">
						<img src="view/psyChomics/img/" width="150" height="150"${produto.imagem}>
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
				<p style="text-align: center; color: black;">Copyright &copy; BY
					William Roberto</p>
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
