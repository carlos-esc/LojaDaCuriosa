<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Seja Bem Vindo(a)!!!</title>
		<script type="text/javascript" src="/lojadacuriosa/resources/js/jquery-3.2.1.js"></script>
		<link rel="stylesheet" type="text/css" href="/lojadacuriosa/resources/css/estilo-bemVindo.css"/>
		
		<script type="text/javascript" LANGUAGE="JavaScript">
			var cont;
			function mouseOver(nome, id){
				document.getElementById(id).src = "resources/fotos/" + nome;
			}
		</script>
	</head>
	
	<script language="javascript" src="resources/js/funcoes.js"></script>
	
	<body>
		<div id="interface">
			<header id="cabecalho">	
				<nav id="cabecalho-menu">
					<ul>
						<p>Curiosa</p>
						<a href="bemVindo"><li>home</li></a>
						<a href="produtos"><li>produtos</li></a>
						<a href="parceiros"><li>parceiros</li></a>
						<a href="getFaleConosco"><li>fale conosco</li></a>
						<a href="sobreNos"><li>sobre nós</li></a>
					</ul>
				</nav>
			</header>
			
			<section id="apresentacao">
				<table id="apresentacao-tabela">
					<tr>
						<td class="esquerdo">
							<p class="p01">Olá! Você está na loja da curiosa...</p>
							<p class="p02">Aqui você encontra lembrancinhas e presentes do jeitinho que você quer para encantar qualquer pessoa!</p>
						</td> 
						<td class="centro">
							<img src="resources/imagens/curiosa.png"/>
						</td>
						<td class="direito">
							<img src="resources/imagens/1.jpeg"/>
							<img src="resources/imagens/3.jpeg"/>
						</td>
					</tr>
				</table>
			</section>
			
			<section id="informacao">
				<article id="esquerdo">
					<span>sempre</span>
					<span>trazendo</span>
					<span>novidades</span>
					<span>para</span>
					<span>você</span>
				</article>
				
				<article id="direito">
					<p class="titulo">Seja bem vinda(o) a loja da curiosa!</p>

					<p>Tudo é feito com muita dedicação e carinho!</p>

					<p>Temos tudo que você precisa para presentear aquela pessoinha especial!</p>

					<p>Qualquer informação que queira, é só nos procurar! =)</p>

					<p>Um abraço da,<br/> 
					curiosa e equipe!</p>
				</article>
				
			</section>
			
			<section id="infoListaProduto">
				<div>
					<h3>Abaixo vamos dar só uma palinha dos nossos produtos.</h3> 
					<p>Caso deseje ver a <a href="produtos">lista completa dos produtos, clique aqui</a> ou vá até o menu superior da página para navegar em nossas opções.</p>
				</div>
			</section>
			
			<section id="listaProduto">
				
				<c:forEach items="${produtos}" var="produto">
					<div class="produto">
						<table>
							<tr class="principalImagem">
								<td colspan="6">
									<c:if test="${produto.fotos[0] != null }">
										<img alt="" id="${produto.id}" src="${produto.fotos[0].caminho}${produto.fotos[0].nome}" />
									</c:if>
								
								</td>
							</tr>
							<tr class="miniImagem">
								<c:forEach items="${produto.fotos}" var="fotos">
	    	    					<td>
	    	    						<img onMouseOver="mouseOver('${fotos.nome}', '${produto.id}')" alt="" src="${fotos.caminho}${fotos.nome}" />
	    	    					</td>
	    	    					<!--  ${cont = 1}-->		 	 
    	        				</c:forEach>
    	        				<c:if test="${cont != 1}">
	    	    					<td><img alt="" src="" />Imagens indisponiveis</td>
    	        				</c:if>
    	        				<!--  ${cont = 0} -->
							</tr>
							<tr>
								<td class="nome" colspan="6">${produto.nome}</td>
							</tr>
							<tr>
								<td class="categoria" colspan="6">
									Categorias: 
									<c:if test="${produto.categoriaPrincipal.nome == null}">
										Todas
									</c:if>
									
									<c:if test="${produto.categoriaPrincipal.nome != null}">
										${produto.categoriaPrincipal.nome}
									</c:if>
									, 
									<c:if test="${produto.categoriaSecundaria.nome == null}">
										Todas
									</c:if>
									
									<c:if test="${produto.categoriaSecundaria.nome != null}">
										${produto.categoriaSecundaria.nome}
									</c:if>
								</td>
							</tr>
							<tr>	
								<td class="preco" colspan="6">R$ ${produto.preco}</td>
							</tr>
						</table>
					</div>
				</c:forEach>	
			</section>
			
			<footer id="rodape">
			<p>Copyright &copy; 2017 - <a href="produto">by</a> Carlos Santana<br/>
			<a href="mailto:carlos.esc@live.com">carlos.esc@live.com</a></p>
			</footer>
		</div>
	</body>
</html>