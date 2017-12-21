<%@ page import="java.util.List" %>
<%@ page import="br.com.ifpe.psyChomics.model.Usuario" %>
<%@ page import="br.com.ifpe.psyChomics.model.UsuarioDao" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="view/bootstrap/css/bootstrap.min.css" />
<script type="text/javascript" src="view/bootstrap/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>

	<hr>
	<h3>Listar Usuario</h3>
	<hr>

	<table class="table">
		<tr>
			<td scope="col">E-mail</td>
			<td scope="col">Senha</td>
			<td scope="col">Nick</td>
			<td scope="col">Nome do Usuario</td>
			<td scope="col">CPF</td>
		</tr>
		<%
			UsuarioDao dao = new UsuarioDao();
			List<Usuario> listaUsuario = dao.listar();
			for (Usuario usuario : listaUsuario) {
		%>
		<tr>
			<th scope="row"><%=usuario.getEmail()%></th>
			<th><%=usuario.getSenha()%></th>
			<th><%=usuario.getNick()%></th>
			<th><%=usuario.getNomeUsuario()%></th>
			<th><%=usuario.getCpf()%></th>

		</tr>
		<%
			}
		%>

	</table>

</body>
</html>