<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<link rel="stylesheet" href="<c:url value="/recursos/stylesheets/foundation.min.css"/>" />
	<link rel="stylesheet" href="<c:url value="/recursos/stylesheets/estilo.css"/>" />
	<title><tiles:getAsString name="titulo" /></title>
</head>
<body>

	<!-- Header and Nav -->

	<div class="row">
		<div class="three columns">
			<h1>
				<a href="<c:url value="/"/>"><img src="<c:url value="/recursos/images/logotipo.png"/>" /></a>
			</h1>
		</div>
		<div class="five columns right">
			<c:if test="${sessionScope.usuario == null}">
			<form style="margin-top: 1.0em;" action="<c:url value="/login"/>" method="post">
				<div class="row">
					<input type="text" name="login" placeholder="Usu&aacute;rio" class="three columns right"/>
					<input type="password" name="senha" placeholder="Senha" class="three columns right"/>
					<input type="submit" value="Entrar" class="tiny button success" class="three columns right"/>&nbsp;
					<a href="<c:url value='/signup'/>" class="tiny button success">Registre-se</a>
				</div>
				
			</form>
			</c:if>
			<c:if test="${sessionScope.usuario != null}">
				<br/>
				Bem vindo(a) ${sessionScope.usuario.nome} - <a href="<c:url value="/logout"/>">Sair</a>
			</c:if>
			
		</div>

	</div>

	<tiles:insertAttribute name="conteudo"/>



</body>
</html>