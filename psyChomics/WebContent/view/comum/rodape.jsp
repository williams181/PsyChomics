<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="card-header">
	<div class="card-header">PsyChomics</div>
	<div class="card-body">
		<div class="d-flex flex-row">
			<div class="p-2">
				<a type="button" class="btn btn-default" href="listarProdutoIndex">Início</a>
			</div>
			<c:if test="${usuarioLogado.tipoUsuario == null}">
				<div class="p-2">
					<a type="button" class="btn btn-default"
						href="exibirCadastrarUsuario">Login</a>
				</div>
			</c:if>
			<c:if test="${usuarioLogado.tipoUsuario == null}">
				<div class="p-2">
					<a type="button" class="btn btn-default"
						href="exibirCadastrarUsuario">Cadastre-se</a>
				</div>
			</c:if>
			<div class="p-2">
				<a type="button" class="btn btn-default" href="exibirQuemSomos">Quem
					Somos</a>
			</div>
			<div class="p-2">
				<a type="button" class="btn btn-default" href="listarProdutoUsuario">Produtos</a>
			</div>
			<c:if test="${usuarioLogado.tipoUsuario != null}">
				<div class="p-2">
					<a type="button" class="btn btn-default" href="exibirPedido">Pedidos
						de Produtos</a>
				</div>
			</c:if>
			<c:if test="${usuarioLogado.tipoUsuario != null}">
				<div class="p-2">
					<a type="button" class="btn btn-default" href="exibirFaleConosco">Fale
						Conosco</a>
				</div>
			</c:if>
			<c:if test="${usuarioLogado.tipoUsuario != null}">
				<div class="p-2">
					<a type="button" class="btn btn-default" href="exibirFaq">FAQ</a>
				</div>
			</c:if>
			<div class="p-2">
				<a type="button" class="btn btn-default"
					href="https://www.facebook.com/">facebook</a>
			</div>
		</div>
	</div>
</div>