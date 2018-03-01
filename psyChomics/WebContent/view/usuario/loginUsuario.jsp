
				<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Sistema de login do usuário</title>

<link rel="stylesheet" type="text/css" href="view/css/estilo.css" />
<link rel="stylesheet" type="text/css" href="view/bootstrap/css/bootstrap.min.css" />
  
<script type="text/javascript" src="view/js/jquery-2.1.4.js"></script>
<script type="text/javascript" src="view/bootstrap/js/bootstrap.min.js"></script>

</head>

<body id="corpoPadrao">

	<div align="center" style="color: #6E6E6E;">
	
		<table style="width: 70%;">
			<tr>
				<td style="text-align: left; width: 70%; vertical-align: bottom;">
					Bem vindo ao <strong>PsyChomics</strong>, informe seu Email e senha para acessar o sistema.
				</td>
				<td style="text-align: right; width: 30%; vertical-align: bottom;">
					<img src="view/img/LoginRed.jpg" style="width: 25%;">
				</td>
			</tr>
		</table>
		
		<hr class="linhaSeparador" />
		
		<c:if test="${msg ne null}">
			<div class="alert alert-error" style="width: 70%;">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				${msg}
			</div>
		</c:if>

		<div style="width: 20%; font-size: 20px;">

			<form action="efetuarLogin" method="post">

				<br/>

				<div class="form-group" style="text-align: left;">
    				<label for="inputEmail">email</label>
    				<input type="text" class="form-control" id="inputEmail" name="email" value="${usuario.email}" maxlength="50" required="required" tabindex="1">
  				</div>
  				
  				<div class="form-group" style="text-align: left;">
    				<label for="inputSenha">Senha</label>
    				<input type="password" class="form-control" id="inputSenha" name="senha" value="${usuario.senha}" maxlength="20" required="required" tabindex="2">
  				</div>
  				
  				<br/>
  				
  				<button type="submit" class="btn btn-primary" tabindex="3" style="width: 100%; height: 50px;"> &nbsp; ENTRAR &nbsp; </button>
			</form>
		</div>
	</div>
	
	<p style="margin-top: 5%;">
	
	<hr class="linhaSeparador">
	
</body>
</html>


