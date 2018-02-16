<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Fale Conosco</title>
		<link rel="stylesheet" type="text/css" href="resources/css/estilo-faleConosco.css"/>
		<script type="text/javascript" src="/lojadacuriosa/resources/js/jquery-3.2.1.js"></script>
		<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery.validate/1.7/jquery.validate.js"></script>
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
							<p class="p02">Aqui nós disponibilizamos nosso contato para que você possa nos dar sugestões, fazer críticas ou nos elogiar. =)</p>
						</td> 
						<td class="centro">
							<img src="resources/imagens/curiosa.png"/>
						</td>
						<td class="direito">
							<p class="p01"> 
								Obrigado por entrar em contato!!!
								
							</p>
						</td>
					</tr>
				</table>
			</section>
			
			<section id="formularioFaleConosco">				
				<div>
					<p><span id="status">Estamos aguardando sua mensagem...</span></p>
				</div>
				<form:form id="formFaleConosco" method="post" action="postFaleConosco" modelAttribute="faleConosco" name="formFaleConosco">
					<fieldset id="fieldSetForm">					
						<form:hidden path="id" />
          				<form:label path="nome">Nome:</form:label>
          				<br/>
          				<form:input id="nome" path="nome" type="text" size="30" maxlength="40" required="required"></form:input>
        				<br/>
        				<br/>
			    		<form:label path="email">Email:</form:label>
			    		<br/>
          				<form:input id="email" path="email" type="email" size="30" maxlength="40" required="required" ></form:input>
						<br/>
						<br/>
			    		<form:label path="mensagem">Mensagem:</form:label>
			    		<br/>
          				<form:textarea id="mensagem" path="mensagem" type="textarea" cols="52" rows="5" maxlength="150" required="required"></form:textarea>
          				<br/>
          				<br/>
						<input class="submit" type="submit" value="Enviar" />
					</fieldset>
				</form:form>
			</section>	
			<footer id="rodape">
			<p>Copyright &copy; 2017 - by Carlos Santana<br/>
			<a href="mailto:carlos.esc@live.com">carlos.esc@live.com</a></p>
			</footer>
		</div>
	<script>
		if(${faleConosco.id} != 0) {
			$("#fieldSetForm").prop("disabled", true);
			$("#formularioFaleConosco span").text($("#nome").val() + ", obrigado por entrar em contato! =)");
		}
	</script>
	</body>
</html>