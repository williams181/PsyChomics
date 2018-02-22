<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script>

function BlockKeybord()
{
    if(window.event) // IE
    {
        if((event.keyCode < 48) || (event.keyCode > 57))
        {
            event.returnValue = false;
        }
    }
    else if(e.which) // Netscape/Firefox/Opera
    {
        if((event.which < 48) || (event.which > 57))
        {
            event.returnValue = false;
        }
    }


}

function troca(str,strsai,strentra)
{
    while(str.indexOf(strsai)>-1)
    {
        str = str.replace(strsai,strentra);
    }
    return str;
}

function FormataMoeda(campo,tammax,teclapres,caracter)
{
    if(teclapres == null || teclapres == "undefined")
    {
        var tecla = -1;
    }
    else
    {
        var tecla = teclapres.keyCode;
    }

    if(caracter == null || caracter == "undefined")
    {
        caracter = ".";
    }

    vr = campo.value;
    if(caracter != "")
    {
        vr = troca(vr,caracter,"");
    }
    vr = troca(vr,"/","");
    vr = troca(vr,",","");
    vr = troca(vr,".","");

    tam = vr.length;
    if(tecla > 0)
    {
        if(tam < tammax && tecla != 8)
        {
            tam = vr.length + 1;
        }

        if(tecla == 8)
        {
            tam = tam - 1;
        }
    }
    if(tecla == -1 || tecla == 8 || tecla >= 48 && tecla <= 57 || tecla >= 96 && tecla <= 105)
    {
        if(tam <= 2)
        {
            campo.value = vr;
        }
        if((tam > 2) && (tam <= 5))
        {
            campo.value = vr.substr(0, tam - 2) + ',' + vr.substr(tam - 2, tam);
        }
        if((tam >= 6) && (tam <= 8))
        {
            campo.value = vr.substr(0, tam - 5) + caracter + vr.substr(tam - 5, 3) + ',' + vr.substr(tam - 2, tam);
        }
        if((tam >= 9) && (tam <= 11))
        {
            campo.value = vr.substr(0, tam - 8) + caracter + vr.substr(tam - 8, 3) + caracter + vr.substr(tam - 5, 3) + ',' + vr.substr(tam - 2, tam);
        }
        if((tam >= 12) && (tam <= 14))
        {
            campo.value = vr.substr(0, tam - 11) + caracter + vr.substr(tam - 11, 3) + caracter + vr.substr(tam - 8, 3) + caracter + vr.substr(tam - 5, 3) + ',' + vr.substr(tam - 2, tam);
        }
        if((tam >= 15) && (tam <= 17))
        {
            campo.value = vr.substr(0, tam - 14) + caracter + vr.substr(tam - 14, 3) + caracter + vr.substr(tam - 11, 3) + caracter + vr.substr(tam - 8, 3) + caracter + vr.substr(tam - 5, 3) + ',' + vr.substr(tam - 2, tam);
        }
    }
}

function maskKeyPress(objEvent)
{
    var iKeyCode;

    if(window.event) // IE
    {
        iKeyCode = objEvent.keyCode;
        if(iKeyCode>=48 && iKeyCode<=57) return true;
        return false;
    }
    else if(e.which) // Netscape/Firefox/Opera
    {
        iKeyCode = objEvent.which;
        if(iKeyCode>=48 && iKeyCode<=57) return true;
        return false;
    }


}
</script>
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
			<a class="navbar-brand" href="listarProdutoIndex">PsyChomics</a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="exibirLoginUsuario">Login de Usuário</a></li>
				<li><a href="exibirCadastroUsuario">Cadastro de Usuário</a></li>
				<li><a href="listarUsuario">Listagem de Usuário</a></li>
				<li><a href="exibirCadastroProduto">Cadastro de Produto</a></li>
				<li><a href="listarProduto">Listagem de Produto</a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container --> </nav>

	<br>
	<br>
	<div class="container" align="center">
		<hr>
		<h3>Cadastro de Produto</h3>
		<hr>
	</div>

	<c:import url="/view/comum/menu.jsp" />

	<div style="text-align: center; color: green;">${mensagem}</div>

	<div class="container" align="center">
		<form action="cadastroProduto" method="post"
			enctype="multipart/form-data">
			<div class="form-group">
				<label for="inputNome">Nome</label> <input type="text"
					id="inputNome" class="form-control" name="nome"
					style="width: 500px;" placeholder="Nome" minlength="3" maxlength="60"
					required="required" />
			</div>
			<div class="form-group">
				<label for="inputPreco">Preço</label>
					<input type="Text"id="inputPreco" class="form-control" name="preco"
					style="width: 500px;" placeholder="Preco" size="10"
					 maxlength="10" onkeydown="FormataMoeda(this,10,event)" onkeypress="return maskKeyPress(event)" />
					
			</div>
			<div class="form-group">
				<label for="inputGenero">Gênero</label> 
				<input type="text" id="inputGenero" class="form-control" name="genero"
					style="width: 500px;" placeholder="Genero" minlength="3" maxlength="60"
					required="required"/>
			</div>
			<div class="form-group">
				<label for="inputImagem">Imagem</label> <input type="file"
					id="inputImagem" class="form-control" name="file"
					style="width: 500px;"  maxlength="100"/>
			</div>
			<p>
				<a href="exibirIndex" class="btn btn-danger" role="button">Cancelar</a>
				&nbsp;
				<button type="reset" class="btn btn-default">&nbsp; Limpar
					&nbsp;</button>
				&nbsp;
				<button type="submit" value="cadastar" class="btn btn-primary">&nbsp;
					Cadastrar &nbsp;</button>
			</p>
		</form>
	</div>
</body>
</html>