
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Produtos</title>
		<link rel="stylesheet" type="text/css" href="resources/css/estilo-produtos.css"/>
	</head>

	<script language="javascript" src="resources/js/funcoes.js"></script>

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
							<p class="p02">Nesta página você consegue encontrar todos os nossos produtos...</p>
							<p class="p02">Eles estão organizados por categoria, fazendo com que a sua procura seja mais fácil.</p>
						</td> 
						<td class="centro">
							<img src="resources/imagens/curiosa.png"/>
						</td>
						<td class="direito">
							<p class="p01">
								Esperamos que gostem dos nossos produtos...
							</p>
							<p class="p02"> 
								Adorariamos receber um sugestão para criação dos nossos produtos!!!
							</p>
							<p class="p02"> 
								Obrigado por nos visitar!!! =)
							</p>
						</td>
					</tr>
				</table>
			</section>
			
			<nav class="nav-menu-categoria">
				<ul class="principal">
					<li onclick="exibirCategoriaSecundaria('todos-produtos')"><a id="link-todos-produtos" href="todos-os-produtos.html" target="iframe">todos os produtos</a>
					</li>
					<li>|</li>
					<li onclick="exibirCategoriaSecundaria('mdf','30px')"><a id="link-mdf" href="mdf-todos.html" target="iframe">mdf</a></li>
					<li>|</li>
					<li onclick="exibirCategoriaSecundaria('bordados','110px')"><a id="link-bordados" href="bordado-todos.html" target="iframe">bordados</a></li>
					<li>|</li>
					<li onclick="exibirCategoriaSecundaria('semijoias','220px')"><a id="link-semijoias" href="semijoia-todos.html" target="iframe">semijóias</a></li>
				</ul>
				
				<ul id="todos-produtos" class="secundaria">
				
				</ul>
				
				<ul id="mdf" class="secundaria">
					<li><a href="mdf-todos.html" target="iframe">todos</a></li>
					<li>|</li>
					<li><a href="mdf-casamento.html" target="iframe">casamento</a></li>
					<li>|</li>
					<li><a href="mdf-infantil.html" target="iframe">infantil</a></li>
					<li>|</li>
					<li><a href="mdf-decoracao.html" target="iframe">decoração</a></li>
				</ul>
				<ul id="bordados" class="secundaria">
					<li><a href="bordado-todos.html" target="iframe">todos</a></li>
					<li>|</li>
					<li><a href="bordado-casamento.html" target="iframe">casamento</a></li>
					<li>|</li>
					<li><a href="bordado-infantil.html" target="iframe">infantil</a></li>
					<li>|</li>
					<li><a href="bordado-decoracao.html" target="iframe">decoração</a></li>
				</ul>
				<ul id="semijoias" class="secundaria">
					<li><a href="semijoia-todos.html" target="iframe">todos</a></li>
					<li>|</li>
					<li><a href="semijoia-casamento.html" target="iframe">casamento</a></li>
					<li>|</li>
					<li><a href="semijoia-infantil.html" target="iframe">infantil</a></li>
					<li>|</li>
					<li><a href="semijoia-decoracao.html" target="iframe">decoração</a></li>
				</ul>
			</nav>
			
			<section id="paginas">
				<iframe id="iframe" name="iframe" src=""></iframe>
			</section>
			
			<footer id="rodape">
				<p>Copyright &copy; 2017 - by Carlos Santana<br/>
				<a href="mailto:carlos.esc@live.com">carlos.esc@live.com</a></p>
			</footer>	
			
		</div>
	</body>
</html>