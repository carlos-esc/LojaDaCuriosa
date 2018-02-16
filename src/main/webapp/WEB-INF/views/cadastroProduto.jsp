 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Cadastro produto</title>
		<script type="text/javascript" src="resources/js/jquery-3.2.1.js"></script>
		<script type="text/javascript" src="resources/js/cadastroProduto.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/css/estilo-cadastroProduto.css"/>
		
		<script type="text/javascript">
			function validarFormulario() {
				if (/\S+/.test(document.formularioFaleConosco.nome.value) == false) alert ("Por favor, digite um nome.");
				else if (/^\S+@[a-z0-9_.-]+\.[a-z]{2,6}$/i.test(document.formularioFaleConosco.email.value) == false) alert ("Um endereço de e-mail válido é requerido.");
				else if (/\S+/.test(document.formularioFaleConosco.mensagem.value) == false) alert ("É necessário um conteúdo para mensagem.");
				else { 
				document.formularioFaleConosco.submit();
				alert ("Obrigado!\nSua mensagem foi recebida com sucesso.");
				}
			}
		</script>
		
	</head>
	<body>
		<div id="interface">
			<header id="cabecalho">	
				<nav id="cabecalho-menu">
					<ul>
						<p>Curiosa</p>
						<a href="/lojadacuriosa"><li>home</li></a>
						<a href="produtos"><li>produtos</li></a>
						<a href="parceiros"><li>parceiros</li></a>
						<a href="faleConosco"><li>fale conosco</li></a>
						<a href="sobreNos"><li>sobre nós</li></a>
					</ul>
				</nav>
			</header>
			
			<section id="apresentacao">
				<table id="apresentacao-tabela">
					<tr>
						<td class="esquerdo">
							<p class="p01">Olá! Você está na loja da curiosa...</p>
							<p class="p02">Está parte da loja é de uso exclusivo dos Administradores.</p>
						</td> 
						<td class="centro">
							<img src="resources/imagens/curiosa.png"/>
						</td>
						<td class="direito">
							<p class="p01"> 
								Se você não é um administrador da loja e não faz ideia de como chegou aqui, entre em contato...
							</p>
						</td>
					</tr>
				</table>
			</section>
			
			<section id="formularioCadastroProduto">
				<form:form method="post" modelAttribute="produto" action="addProduto" enctype="multipart/form-data" name="formularioFaleConosco" >
					<form:hidden path="id" />
          			<div class="tabela">
						<table>
							<tr>
								<th colspan="2">Informe os dados do produto</th>
							</tr>
							<tr>
								<td class="atributo">Nome</td>
								<td class="input"><form:input path="nome" type="text" name="nome"></form:input></td>
							</tr>
							<tr>
								<td class="atributo">Preço R$</td>
								<td class="input"><form:input path="preco" type="text" name="preco"></form:input></td>
							</tr>	
						  	
							<tr>
								<td class="atributo">Categoria principal</td>
								<td>					
	               					<form:select path="categoriaPrincipal.id" name="categoriaPrincipal.id">       
	                        			<c:forEach items="${categorias}" var="categoria">
    	                    				<form:option  class="input" value="${categoria.id}">${categoria.nome}</form:option>
        	                			</c:forEach>
            	        			</form:select>
            	        		</td>
							</tr>
				 	
							<tr>
								<td class="atributo">Categoria secundaria</td>
								<td>					
	               					<form:select path="categoriaSecundaria.id" name="categoriaSecundaria.id">       
	                        			<c:forEach items="${categorias}" var="categoria">
    	                    				<form:option class="input" value="${categoria.id}">${categoria.nome}</form:option>
        	                			</c:forEach>
            	        			</form:select>
            	        		</td>
							</tr>
				
							<tr>
								<td colspan="2">
									Descrição (Máximo 200 letras)
									<br />
									<form:textarea path="descricao" class="input" name="descricao" maxlength="200" ></form:textarea>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<input type="submit" value="Adicionar" />	
								</td>
							</tr>
						</table>
					</div>
					 
					<div class="imagem">
    					<label for="entradaImagem01">Clique aqui - Imagem 01</label>
						<img id="saidaImagem01">
						<p>Nome da imagem</p>
						<input type="text" name="imagemNovoNome" />
						<input type="file" name="imagemUpload" id="entradaImagem01" 
								onchange="document.getElementById('saidaImagem01').src 
								= window.URL.createObjectURL(this.files[0])">
					</div>
					 
					<div class="imagem">
    					<label for="entradaImagem02">Clique aqui - Imagem 02</label>
						<img id="saidaImagem02">
						<p>Nome da imagem</p>
						<input type="text" name="imagemNovoNome" />
						<input type="file" name="imagemUpload" id="entradaImagem02" 
								onchange="document.getElementById('saidaImagem02').src 
								= window.URL.createObjectURL(this.files[0])">
					</div>
			
					<div class="imagem">
    					<label for="entradaImagem03">Clique aqui - Imagem 03</label>
						<img id="saidaImagem03">
						<p>Nome da imagem</p>
						<input type="text" name="imagemNovoNome" />
						<input type="file" name="imagemUpload" id="entradaImagem03" 
								onchange="document.getElementById('saidaImagem03').src 
								= window.URL.createObjectURL(this.files[0])">
					</div>
			
					<div class="imagem">
    					<label for="entradaImagem04">Clique aqui - Imagem 04</label>
						<img id="saidaImagem04">
						<p>Nome da imagem</p>
						<input type="text" name="imagemNovoNome" />
						<input type="file" name="imagemUpload" id="entradaImagem04" 
								onchange="document.getElementById('saidaImagem04').src 
								= window.URL.createObjectURL(this.files[0])">
					</div>
					 					
				</form:form>
			</section>
				
			<footer id="rodape">
			<p>Copyright &copy; 2017 - by Carlos Santana<br/>
			<a href="mailto:carlos.esc@live.com">carlos.esc@live.com</a></p>
			</footer>
		</div>
	</body>
</html>