<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="view/bootstrap/css/bootstrap.min.css" />
<script type="text/javascript" src="view/bootstrap/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<hr>
	<h3>Cadastar Usuario</h3>
	<hr>
	<form action="cadastro" method="post"
		enctype="multipart/form-data">
		<div class="form-group">
			<label for="inputEmail">E-mail:</label> <input type="text"
				id="inputEmail" class="form-control" name="email"
				style="width: 500px;" maxlength="100" required="required" />
		</div>
		<div class="form-group">
			<label for="inputSenha">Senha:</label> <input type="text"
				id="inputSenha" class="form-control" name="senha"
				style="width: 500px;" maxlength="100" required="required" />
		</div>
		<div class="form-group">
			<label for="inputNick">Nick:</label> <input type="text"
				id="inputNick" class="form-control" name="nick"
				style="width: 500px;" maxlength="100" required="required" />
		</div>
		<div class="form-group">
			<label for="inputNomeUsuario">Nome do Usuario:</label> <input
				type="text" id="inputNomeUsuario" class="form-control"
				name="NomeUsuario" style="width: 500px;" maxlength="100"
				required="required" />
		</div>
		<div class="form-group">
			<label for="inputCpf">CPF:</label> <input type="text" id="inputCpf"
				class="form-control" name="cpf" style="width: 500px;"
				maxlength="100" required="required" />
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