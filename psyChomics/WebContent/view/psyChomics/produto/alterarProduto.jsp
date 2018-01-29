<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

<title>Alterar</title>

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
				<a class="navbar-brand" href="exibirIndex">PsyChomics</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="exibirLoginUsuario">Login Usuario</a></li>
					<li><a href="exibirCadastroUsuario">Cadastro Usuario</a></li>
					<li><a href="exibirlistarUsuario">Listagem Usuario</a></li>
					<li><a href="exibirCadastroProduto">Cadastro Produto</a></li>
					<li><a href="exibirlistarProduto">Listagem Produto</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>

	<br>
	<br>
	<div class="container" align="center">
		<hr>
		<h3>aletar Produto</h3>
		<hr>
	</div>

	<div style="text-align: center; color: green;">${msg}</div>
	<br>

	<div class="container" align="center">
		<jsp:useBean id="dao" class="br.com.ifpe.psyChomics.model.ProdutoDao" />
		<form action="alterarProduto" method="post" enctype="multipart/form-data">

			<div class="form-group">
				<label for="inputNome">Nome</label> <input type="text"
					id="inputNome" class="form-control" name="Nome"
					value="${produto.nome}" style="width: 500px;" maxlength="50"
					required="required" /> 
				<input type="hidden" name="id" value="${produto.id}"/>
			</div>

			<div class="form-group">
				<label for="inputPreco">Preço</label> <input type="text"
					id="inputPreco" class="form-control" name="preco"
					value="${produto.preco}" style="width: 500px;" maxlength="100"
					required="required" />
			</div>

			<div class="form-group">
				<label for="inputGenero">Genero</label> <input type="text"
					id="inputGenero" class="form-control" name="genero"
					value="${produto.genero}" style="width: 500px;" maxlength="30"
					required="required" />
			</div>
			<p>
				<input type="submit" class="btn btn-primary" value="alterar">
			</p>
		</form>


	</div>

</body>
</html>