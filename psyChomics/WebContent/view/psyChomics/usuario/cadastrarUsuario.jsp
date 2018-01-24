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
			<a class="navbar-brand" href="exibirIndex">PsyChomics</a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="exibirLogin">Login</a></li>
				<li><a href="exibirCadastro">Cadastro</a></li>
				<li><a href="exibirlistarUsuario">Listagem</a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container --> </nav> 
	 
	 <br><br>
	 
	<hr>
	<h3>Cadastro de Usuario</h3>
	<hr>
	
	 <c:import url="/view/comum/menu.jsp" />
	<div style="text-align: center; color: red;">${mensagem}</div>
	
	<form action="cadastroUsuario" method="post" enctype="multipart/form-data">
		<div class="form-group">
			<label for="inputEmail">E-mail:</label> <input type="text"
				id="inputEmail" class="form-control" name="email"
				style="width: 500px;" maxlength="60" required="required" />
		</div>
		<div class="form-group">
			<label for="inputSenha">Senha:</label> <input type="password"
				id="inputSenha" class="form-control" name="senha"
				style="width: 500px;" maxlength="16" required="required" />
		</div>
		<div class="form-group">
			<label for="inputNick">Nick:</label> <input type="text"
				id="inputNick" class="form-control" name="nick"
				style="width: 500px;" maxlength="60" required="required" />
		</div>
		<div class="form-group">
			<label for="inputNomeUsuario">Nome do Usuario:</label> <input
				type="text" id="inputNomeUsuario" class="form-control"
				name="NomeUsuario" style="width: 500px;" maxlength="60"
				required="required" />
		</div>
		<div class="form-group">
			<label for="inputCpf">CPF:</label> <input type="text" id="inputCpf"
				class="form-control" required="required" name="cpf"
				style="width: 500px;" maxlength="11" required="required" />
		</div>
		<p>
			<a href="index.jsp" class="btn btn-danger" role="button">Cancelar</a>
			&nbsp;
			<button type="reset" class="btn btn-default">&nbsp; Limpar
				&nbsp;</button>
			&nbsp;
			<button type="submit" value="cadastar" class="btn btn-primary">&nbsp;
				Cadastrar &nbsp;</button>
		</p>
	</form>

</body>
</html>