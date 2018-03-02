<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="pt-br">
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Index</title>
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
					Usuário <i class="fa fa-caret-down"></i>
				</button>
				<ul class="dropdown-content">
					<li><a href="exibirLoginUsuario">Login Usuário</a></li>
					<li><a href="exibirCadastroUsuario">Cadastro Usuário</a></li>
					<li><a href="listarUsuario">Listagem Usuário</a></li>
				</ul>
			</div>
			<div class="dropdown">
				<button class="dropbtn">
					Produto <i class="fa fa-caret-down"></i>
				</button>
				<ul class="dropdown-content">
					<li><a href="exibirCadastroProduto">Cadastro Produto</a></li>
					<li><a href="listarProduto">Listagem Produto</a></li>
				</ul>
			</div>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="exibirLoginUsuario">Login de Usuário</a></li>
				<li><a href="exibirCadastroUsuario">Cadastro Usuário</a></li>
				<li><a href="listarUsuario">Listagem Usuário</a></li>
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

</div>


	</nav>
	<div id="carouselExampleIndicators" class="carousel slide"
		data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="d-block w-100" src="view/imagens/bg2.png"
					alt="First slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="view/imagens/bg3.png"
					alt="Second slide">
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>

	<div class="card">
		<div class="card-body">This is some text within a card body.</div>
	</div>

	<div class="card">
		<div class="card-body">${msg}</div>
	</div>

	<form action="cadastrarUsuario" method="post"
		enctype="multipart/form-data">
		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="inputEmail">Email</label> <input type="text"
					class="form-control" id="inputEmail" minlength="13"
					placeholder="E-mail" maxlength="50" required="required">
			</div>
			<div class="form-group col-md-6">
				<label for="inputSenha">Senha</label> <input type="password"
					class="form-control" id="inputSenha" name="senha"F
					placeholder="Senha" maxlength="16" minlength="8"
					required="required">
			</div>
			<div class="form-group col-md-6">
				<label>Confirmar Senha</label> <input type="password"
					placeholder="Confirme Senha" id="confirm_password"
					class="form-control" maxlength="16" minlength="8"
					required="required">
			</div>
		</div>
		<div class="form-group">
			<label for="inputNick">Nick</label> <input type="text" id="inputNick"
				class="form-control" name="Nick" placeholder="Nick do Usuário"
				maxlength="30" minlength="5" required="required">
		</div>
		<div class="form-group">
			<label for="inputNomeUsuario">Nome do Usuário</label> <input
				type="text" id="inputNomeUsuario" class="form-control"
				name="NomeUsuario" placeholder="Nome do Usuário" maxlength="50"
				minlength="10" required="required">
		</div>
		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="inputCpf">Cpf</label> <input type="text" id="inputCpf"
					class="form-control cpf-mask" required="required" name="cpf"
					style="width: 500px;" minlength="9"
					placeholder="CPF:EX.: 000.000.000-00" maxlength="11"
					required="required">
			</div>
		</div>
		<button type="submit" class="btn btn-primary" value="cadastrar">Cadastrar</button>
	</form>

	<div class="card">
		<div class="card-header">Featured</div>
		<div class="card-body">
			<h5 class="card-title">Special title treatment</h5>
			<p class="card-text">With supporting text below as a natural
				lead-in to additional content.</p>
			<a href="#" class="btn btn-primary">Go somewhere</a>
		</div>
	</div>

	<script>
		var password = document.getElementById("password"), confirm_password = document
				.getElementById("confirm_password");
		function validatePassword() {
			if (password.value != confirm_password.value) {
				confirm_password.setCustomValidity("Senhas diferentes!");
			} else {
				confirm_password.setCustomValidity('');
			}
		}
		password.onchange = validatePassword;
		confirm_password.onkeyup = validatePassword;
	</script>

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
</body>

</html>