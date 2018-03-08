<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Sistema de Controle de Estoque</title>

<link rel="stylesheet" type="text/css" href="view/css/estilo.css" />
<link rel="stylesheet" type="text/css" href="view/bootstrap/css/bootstrap.min.css" />
  
<script type="text/javascript" src="view/js/jquery-2.1.4.js"></script>
<script type="text/javascript" src="view/bootstrap/js/bootstrap.min.js"></script>

</head>

<body id="corpoPadrao">

	<nav class="navbar navbar-expand-lg navbar-light bg-light"> <a
		class="navbar-brand" href="exibirlistarProdutoIndex"><img src="\imagens\nav.png" width="50%"></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link"
				href="exibirlistarProdutoIndex">Home <span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="exibirQuemSomos">Quem
					somos</a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> Cadastrar </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="exibirCadastrarProduto">Produtos</a>
					<a class="dropdown-item" href="exibirCadastrarUsuario">Usuários</a> 
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="exibirIncluirCategoriaProduto">Categorias</a> 
					<a class="dropdown-item" href="exibirIncluirGeneroProduto">Gênero</a>
						
				</div></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> Listar </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="listarGeneroProduto">Gênero</a>
					<a class="dropdown-item" href="listarProduto">Produtos</a>
					<a class="dropdown-item" href="listarUsuario">Usuários</a>
					<a class="dropdown-item" href="listarCategoriaProduto">Categorias</a>
					<div class="dropdown-divider"></div>
					
				</div></li>
			<li class="nav-item"><a class="nav-link" href="exibirLoginUsuario">Login</a>
			</li>
		</ul>
		<form class="form-inline my-2 my-lg-0" action="buscarProduto">
			<input class="form-control mr-sm-2" type="text"
				pplaceholder="Procurar.." id="inputNome" name="nome" for="inputNome"
				aria-label="Search">
			<button class="btn btn-outline-success my-2 my-sm-0" value="buscar"
				type="submit">Search</button>
				</form>
</div>
</nav>

	<div align="center">
	
		<div align="left" style="color: #6E6E6E; width: 70%; margin-top: 4%;">

			<c:if test="${msg ne null}">
				<div class="alert alert-error" style="width: 70%;">
					<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					${msg}
				</div>
			</c:if>

			<hr />
			
			<p>
				<table style="width: 100%">
					<tr>
						<td style="float: left; font-size: 24px;">Incluir <strong>Categoria de Produto</strong> </td>
						<td style="float: right; text-align: right;"> <img src="view/img/salvar.jpg" style="width: 14%;">  </td>
					</tr>
				</table>
			</p>
			
			<hr />
			
			<form action="incluirCategoriaProduto" method="post">
				
				<div class="form-group">
    				<label for="inputCodigo">Código</label>
    				<input type="text" class="form-control" id="inputCodigo" name="codigo" style="width: 110px;" maxlength="5" required="required" value="${categoriaProduto.codigo}"> &nbsp;
    				<form:errors path="categoriaProduto.codigo" cssStyle="color:red" /> <br />
  				</div>
  				
  				<div class="form-group">
					<label for="inputDescricao">Descrição</label>
					<input type="text" id="inputDescricao" class="form-control" name="descricao" style="width: 500px;" maxlength="100" required="required" value="${categoriaProduto.descricao}" /> &nbsp;
					<form:errors path="categoriaProduto.descricao" cssStyle="color:red" />
				</div>

				<br />
  				
  				<a href="listarCategoriaProduto" class="btn btn-danger" role="button">Cancelar</a> &nbsp;
  				<button type="reset" class="btn btn-default"> &nbsp; Limpar &nbsp; </button> &nbsp;
  				<button type="submit" class="btn btn-primary"> &nbsp; Inserir &nbsp; </button>
  				
			</form>
		</div>
			
	</div>
	
	<br />
	
	<hr class="linhaSeparador">
	


</body>
</html>
