<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<nav id="divMenu" class="navbar navbar-inverse">
	<div class="container-fluid">
		
	    <div>
			<ul class="nav navbar-nav">
			
				<li><a href="listarProdutoIndex">Home</a></li>
				
				<li><a>|</a></li>

				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Estoque <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="listarProduto">Produtos</a></li>
						<li><a href="listarCategoriaProduto">Categoria de Produtos</a></li>
						<li><a href="listarGeneroProduto">Genero de Produtos</a></li>
						<li><a href="listarTipoProduto">Tipo de Produtos</a></li>
					</ul>
				</li>

				<li><a>|</a></li>
				
				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Administração <span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="listarUsuario">Usuários</a></li>
					<li><a href="listarFaleConosco">FaleConosco</a></li>
					<li><a href="listarUsuario">Pedido dos Usuários</a></li>
					<li><a href="listarUsuario">Comentarios dos Produtos</a></li>
				</ul>
				</li>
				
				<li><a>|</a></li>
				
				<li><a href="exibirCarrinho">Carrinho</a></li>
				
				<li><a>|</a></li>
				
				<li><a href="logout">Sair</a></li>
				
			</ul>
		</div>
	</div>	
</nav>