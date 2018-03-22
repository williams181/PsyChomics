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
<title>FAQ</title>
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-light bg-light"> <a
		class="navbar-brand" href="listarProdutoIndex"><img
		src="view/imagens/nav.png" width="50%"></a>
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
			<li class="nav-item"><a class="nav-link" href="#">FAQ</a></li>				
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false">Cadastrar</a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="exibirCadastrarProduto">Produtos</a>
					<a class="dropdown-item" href="exibirCadastrarUsuario">Usuários</a>
					<a class="dropdown-item" href="exibirIncluirCategoriaProduto">Categoria</a>
					<a class="dropdown-item" href="exibirIncluirGeneroProduto">Gênero</a>
					<a class="dropdown-item" href="exibirIncluirTipoProduto">Tipo</a>
				</div></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false">Listar</a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="listarUsuario">Usuários</a> <a
						class="dropdown-item" href="listarProduto">Produtos</a> <a
						class="dropdown-item" href="listarCategoriaProduto">Categoria</a>
					<a class="dropdown-item" href="listarGeneroProduto">Gênero</a> <a
						class="dropdown-item" href="listarTipoProduto">Tipo</a>
				</div></li>
			<li class="nav-item"><a class="nav-link"
				href="exibirPerfilUsuario">Perfil</a></li>
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



	<div id="carouselExampleIndicators" class="carousel slide"
		data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="d-block w-100" src="view/imagens/bg3.png"
					alt="primeiro slide">
			</div>

			<div class="carousel-item">
				<img class="d-block w-100" src="view/imagens/bgcw.png"
					alt="segundo slide">
			</div>

			<div class="carousel-item">
				<img class="d-block w-100" src="view/imagens/bgcw2.png"
					alt="terceiro slide">
			</div>

			<div class="carousel-item">
				<img class="d-block w-100" src="view/imagens/bgoldlogan.png"
					alt="quarto slide">
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Anterior</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Próximo</span>
		</a>
	</div>



	<center>
		<div class="card">
			<div class="card-body">
				<h3>FAQ - PERGUNTAS FREQUENTES</h4>
			</div>
		</div>
	</center>



	<hr>
	<hr>



	<center>
		<p>
			<stromg><h6>Veja abaixo se sua dúvida já não está respondida.<br>
Caso você não encontre a resposta para a sua pergunta, entre em contato através do <a href="">Fale Conosco.</a></h6></stromg>
		</p>
	</center>



<hr>
<hr>



	<center>
		<div class="card">
			<div class="card-body">
				<h4>Quais são as formas de pagamento?</h4>
			</div>
		</div>
	</center>
	<center>
		<p>
			<stromg><h6>O pagamento pode ser feito Boleto Bancário ou Cartão de Crédito (Visa, Mastercard, Diners,<br> American Express, Hipercard, Aura, entre outros) utilizando exclusivamente<br>o sistema do Pagseguro.

Para os pedidos internacionais, o pagamento pode ser feito pelo PayPal.</h6></stromg>
		</p>
	</center>

<center>
		<div class="card">
			<div class="card-body">
				<h4>É possível parcelar o pagamento?</h4>
			</div>
		</div>
	</center>
	<center>
		<p>
			<stromg><h6>O parcelamento está disponível apenas para pagamento via Cartão de Crédito.<br>É possível parcelar em 6 vezes ou mais (dependendo do cartão utilizado) com uma pequena<br>taxa de juros da administradora do cartão (1,99% a.m.)

<br>Para parcelar o pagamento, basta escolher a opção Cartão de Crédito na página da escolha da forma de pagamento..</h6></stromg>
		</p>
	</center>


<center>
		<div class="card">
			<div class="card-body">
				<h4>Após o pagamento, qual o prazo para receber meu pedido ?</h4>
			</div>
		</div>
	</center>
	<center>
		<p>
			<stromg><h6>1. Para pagamentos via Cartão de Crédito, a liberação do pedido costuma ser imediata<br>após a transação ser finalizada, mas pode levar até 2 dias, dependendo da Operadora do cartão. 
<br>2. Para pagamentos via Boleto Bancário, o prazo para confirmação é de 1 a 3 dias.<br>Após a confirmação do pagamento, o pedido é postado em até 24 horas úteis.<br>O prazo de entrega vai ser de acordo com a modalidade de envio escolhida, conforme abaixo:

<br>Encomenda PAC - Prazo de 5 até 12 dias úteis para entrega.
<br>SEDEX - Prazo de até 3 dias úteis para entrega.</h6></stromg>
		</p>
	</center>

<center>
		<div class="card">
			<div class="card-body">
				<h4>Preciso criar uma conta para realizar uma compra?</h4>
			</div>
		</div>
	</center>
	<center>
		<p>
			<stromg><h6>Sim, é necessário criar uma conta para que possa prosseguir com a compra, confirmar os dados do cliente e enviar o comprovante e dados da compra.</h6></stromg>
		</p>
	</center>






<!-- Rodapé -->
	<div class="card">
		<center>
		<div class="card-header">
		<div class="card-body">
		<img src="view/imagens/bgcw3.png" height=50% width=50%>
			</div>
			<p class="card-text"></p>
			<a href="https://www.facebook.com/" class="btn btn-primary">Visitar</a>
		</center>
		</div>
	</div>
 
 <footer>
 <div class="card-header">
 <center>
  <div class="card-header">PsyChomics</div>
  <div class="card-body">
 <a href="listarProdutoIndex">Início</a><br>
 <a	href="exibirCadastrarUsuario">Cadastre-se</a><br>
 <a href="exibirLoginUsuario">Login</a><br>
 <a href="#">FAQ</a>
 </center>					
 </div>
 </footer>




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