<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<a class="navbar-brand" href="listarProdutoIndex"><img
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
			<c:if test="${usuarioLogado.tipoUsuario != 'administrador'}">
				<li class="nav-item"><a class="nav-link" href="exibirQuemSomos">Quem
						somos</a></li>
			</c:if>
			<c:choose>
				<c:when test="${usuarioLogado.tipoUsuario == 'administrador'}">
					<li class="nav-item"><a class="nav-link"
						href="exibirControleEstoque">administrador</a></li>
					<li class="nav-item"><a class="nav-link" href="logout">Logout</a></li>
					<li class="nav-item"><a data-toggle="tooltip"
						data-placement="right" title="Carrinho de Compras"
						href="exibirCarrinho"><img src="view/imagens/carrinho.png"
							alt="carrinho" class="rounded-circle"></a></li>
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${usuarioLogado.tipoUsuario == 'usuario'}">
					<li class="nav-item"><a class="nav-link"
						href="listarProdutoUsuario">Principais Produtos</a></li>
					<li class="nav-item"><a class="nav-link" href="logout">Logout</a></li>
					<li class="nav-item"><a data-toggle="tooltip"
						data-placement="right" title="Carrinho de Compras"
						href="exibirCarrinho"><img src="view/imagens/carrinho.png"
							alt="carrinho" class="rounded-circle"></a></li>
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>
			<c:if test="${usuarioLogado.tipoUsuario eq null}">
				<li class="nav-item"><a class="nav-link"
					href="listarProdutoUsuario">Principais Produtos</a></li>
				<li class="nav-item"><a class="nav-link"
					href="exibirCadastrarUsuario">Cadastre-se</a></li>
				<li class="nav-item"><a class="nav-link"
					href="exibirLoginUsuario">Login</a></li>
			</c:if>


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