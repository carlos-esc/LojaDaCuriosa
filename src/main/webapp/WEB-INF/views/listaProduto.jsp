 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Lista produto</title>
		<script type="text/javascript" src="/lojadacuriosa/resources/js/jquery-3.2.1.js"></script>
		<script type="text/javascript" src="/lojadacuriosa/resources/js/jquery.validate.js"></script>
		<script type="text/javascript" src="/lojadacuriosa/resources/js/cadastroProduto.js"></script>
		<link rel="stylesheet" type="text/css" href="/lojadacuriosa/resources/css/estilo-listaProduto.css"/>
		
		<script type="text/javascript">
			var fotoNova = [];
			var resultadoFinal;
			var novoId = 0;
  			var cont = 0;
  			
  			function postPut(id){
  				alert(id);
  				if (document.getElementById("preco").value != "") { 
  					document.getElementById("preco").value = document.getElementById("preco").value.replace(/\./g, '').replace(/,/g, '.');
				} else {
					document.getElementById("preco").value = "0";
				}
  				
  				if (id==0){	
  					$( "#formCadastro" ).submit(function( event ) {
  	  					event.preventDefault();
  						var formData = new FormData(this);
  			  						
  						$.ajax({
  	  				    	url: "/lojadacuriosa/produto",
  	  				    	data: formData,
  	  				    	type: "POST",
  	  				        enctype: "multipart/form-data",
  	  				        contentType: false,
  	  				        processData: false,
  	  				        cache: false,
  	  				        timeout: 600000,
  	  				        success: function (response) {
  	  				        	alert("Inclusão");
  	  				        	$(window.document.location).attr("href","/lojadacuriosa/produto");
  	  				        },
  	  				        error: function (exr, sender) {
  	  				        	alert("Erro ao carregar pagina");
  	  				        }
  	  				    });
  					});
  					   
  				} else {
  					$( "#formCadastro" ).submit(function( event ) {
  	  					event.preventDefault();
  	  					var formData = new FormData(this);
  	  					
	  	  				formData.append("fotoNova", JSON.stringify(fotoNova));

  	  				    $.ajax({
  	  				    	data: formData,
  	  				        url: "/lojadacuriosa/produto/" + id,
  	  				    	method: 'POST',
  	  				        contentType: false,
  	  				        processData: false,
  	  				        cache: false,
  	  				        timeout: 600000,
  	  				        success: function (response) {
  	  				        	alert("Alteração");
  	  				        	$(window.document.location).attr("href","/lojadacuriosa/produto");
  	  				        },
  	  				        error: function (exr, sender) {
  	  				        	alert("Erro ao carregar pagina");
  	  				        }
  	  				    });
  	  		  		});
  				}
  			}
  			
  			function del(id){
  				$.ajax({
  			        url: "/lojadacuriosa/produto/" + id,
  			        method: 'DELETE',
  			        success: function (data) {                       
  			            alert("Deletado com sucesso: Id(" + id + ") -- data:" + data);
  			            $("#produtoId_" + id).remove();
  			        },
  			        error: function (xhr, status, error) {
  			        	alert("erro 1:" + xhr + ", 2:" + status + ", 3:" + error );
  			        }
  			    });	
  			}
  			
  			function add(){
  				document.getElementById("botaoAdicionarAtualizar").value = "Adicionar produto";
  			}
  			
  			function update(){
  				document.getElementById("botaoAdicionarAtualizar").value = "Atualizar produto";
  				produtoInclusaoAlteracao();
  			}
  			
  			function mostraFoto(idFile){  				
  				var id = idFile.id.split("_")[1];
  				fotoNova[id] = idFile.files[0].name;
  				document.getElementById("imgId_" + id).src = window.URL.createObjectURL(idFile.files[0]);
  				alert("Id: " + id + "\nNome: " + fotoNova[id]);
  			}
  			
  			function incluirFoto(nome){
  				if(cont < 6){
  					cont++; 
  					
  					var clone = $("#divTemplateId_").clone();
  	  				clone.attr("id", "divId_" + novoId); 
  	  				$(".imagem:last").after(clone);
  	  				clone.show();
  	  				$(".fileId:last").prop("id", "fileId_" + novoId);
  	  				$(".fileId:last").prop("name", "imagemUpload");
  	  				
  	  				$(".imgId:last").prop("id", "imgId_" + novoId);
  	  				$(".imgId:last").attr("src", "/lojadacuriosa/resources/fotos/" + nome);
  	  				
  	  				$(".labelAdd:last").prop("id", "labelAddId_" + novoId);
  	  				$(".labelAdd:last").prop("for", "fileId_" + novoId);
  	  				$(".labelAdd:last").text("Trocar");
  	  				
  	  				$(".labelDel:last").prop("id", "labelDelId_" + novoId);
  	  				$(".labelDel:last").text("Deletar");
  	  				$(".labelDel:last").prop("for", "buttonDelId_" + novoId);
  	  				
  	  				$(".buttonDel:last").prop("id", "buttonDelId_" + novoId);
  	  				
	    			fotoNova[novoId] = nome;
	
	    			return novoId++;
  				}
  			}
  			
  			function excluirFoto(thisButton){
  				cont--;
  				var id = thisButton.id.split("_")[1];
  				alert(id);
  				$("#divId_" + id).remove();
  				fotoNova[id] = null;
  			}
  		
  			$( "#formCadastro" ).submit(function( event ) {
  			  alert( "Handler for .submit() called." );
  			  event.preventDefault();
  			});
  			
  			function cancelar(){
  				var resultado = "";
				for(var i = 0; i < fotoNova.length; i++) {
					resultado += "Id: " + i + "\nNome: " + fotoNova[i] + "\n";
				}
				alert(resultado);
  				
  				$.ajax({
				   	method: 'GET',  	
				    url: "/lojadacuriosa/produto",
				    success: function (response) {
				       	$(window.document.location).attr("href","/lojadacuriosa/produto");
				    },
				    error: function (exr, sender) {
				    	alert("Erro ao carregar pagina");
				    }
				});
  			}
		
			function mascaraMoeda(input) {
      			v = input.value;
      			v = v.replace(/\D/g, ""); //permite digitar apenas números 
      			v = v.replace(/[0-9]{9}/, "inválido"); //limita máximo digitos 
      			v = v.replace(/(\d{1})(\d{8})$/, "$1.$2"); //coloca ponto antes dos últimos 8 digitos 
      			v = v.replace(/(\d{1})(\d{5})$/, "$1.$2"); //coloca ponto antes dos últimos 5 digitos 
      			v = v.replace(/(\d{1})(\d{1,2})$/, "$1,$2"); //coloca virgula antes dos últimos 2 digitos 
      			input.value = v;
  			}
  
  			function formataPreco(preco) {	
  			    if (preco <= 0){
  			    	document.getElementById("preco").value = "";
  			    } else {
  	  			  	document.getElementById("preco").value = formataPreco2(preco);	
  			    }
  			}
  			
  			function formataPreco2(preco){
  				var strPreco = preco.toString();
			    if (strPreco.indexOf(".") >= 0){
			    	if (strPreco.split(".")[1].length == 1) {
			    		strPreco += "0";
			    	}
			    } else {
			    	strPreco += "00";
			    }
			    strPreco = strPreco.replace(/\D/g,"");
			    strPreco = strPreco.replace(/(\d)(\d{8})$/,"$1.$2");
	  			strPreco = strPreco.replace(/(\d)(\d{5})$/,"$1.$2");
	  			strPreco = strPreco.replace(/(\d)(\d{2})$/,"$1,$2");
	  			return strPreco;
  			}
  			
  			function classPreco(preco){
  				$(".tdPreco:last").text(formataPreco2(preco));
  			}
  			
  			function produtoInclusaoAlteracao(){
  				$("#fieldSetFormCadastro").prop("disabled", false);
  				$("#fieldSetFormCadastro").css("display", "");
  				
  				$("#fieldSetInclusaoPesquisa").prop("disabled", true);
  				$("#fieldSetInclusaoPesquisa").css("display", "none");
  				
  				$("#fieldSetListaProduto").prop("disabled", true);
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
<!-- ----------------------------------------------------------------- -->			
			<section id="apresentacao">
				<table id="apresentacao-tabela">
					<tr>
						<td class="esquerdo">
							<p class="p01">Olá! Você está na loja da curiosa...</p>
							<p class="p02">Está parte da loja é de uso exclusivo dos Administradores.</p>
						</td> 
						<td class="centro">
							<img src="/lojadacuriosa/resources/imagens/curiosa.png"/>
						</td>
						<td class="direito">
							<p class="p01"> 
								Se você não é um administrador da loja e não faz ideia de como chegou aqui, entre em contato...
							</p>
						</td>
					</tr>
				</table>
			</section>
<!-- ----------------------------------------------------------------- -->			
			<section id="formularioCadastroProduto" >
				<fieldset id="fieldSetInclusaoPesquisa" class="fieldSetInclusaoPesquisa">
					<div class="inputText">
						<div class="campoD">
							<label class="">Id</label><br/><input type="text" name="nome" maxlength="8" size="4"/>
						</div>
						<div class="campoD">
							<label class="">Nome</label><br/><input type="text" name="nome" maxlength="20" size="20"/>
						</div>
						<div class="campoD">
							<label class="">Categoria</label><br/><input type="text" name="nome" maxlength="20" size="20"/>
						</div>
						<div class="campoD">
							<label class="">Preço</label><br/><input type="text" name="nome" maxlength="10" size="6"/>
						</div>
					</div>
					
					<div class="botaoNovoPesquisa">
						<input type="button" class="botao" value="Pesquisa Produto" Onclick="" id="pesquisaProduto" />
						<input type="button" class="botao" value="Novo Produto" Onclick="produtoInclusaoAlteracao();" id="novoProduto" />
					</div>
				</fieldset>
				
				<fieldset id="fieldSetFormCadastro"  style="display:none;" disabled>
				<form:form id="formCadastro" modelAttribute="produto" action="" enctype="multipart/form-data" name="formCadastro" >
					<form:hidden path="id" />
          			<div class="tabela">
						<table>
							<tr>
								<td colspan="2">Informe os dados do produto</td>
							</tr>
							<tr>
								<td class="atributo">Nome</td>
								<td class="input"><form:input path="nome" type="text" name="nome"></form:input></td>
							</tr>
							<tr>
								<td class="atributo">Preço R$</td>
								<td class="input">
									<form:input onKeyUp="mascaraMoeda(this)" path="preco" type="text" name="preco" id="preco" ></form:input>
								</td>
							</tr>	
						  	
							<tr>
								<td class="atributo">Categoria principal</td>
								<td>					
	               					<form:select path="categoriaPrincipal.id" name="categoriaPrincipal.id">       
	                        			<form:option value="0">Todas</form:option>
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
	                        			<form:option value="0">Todas</form:option>
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
								<td class="atributo">Incluir uma nova foto</td>
								<td>
									<input type="button" class="botao" value="Incluir foto" id="botaoIncluirFoto" Onclick="incluirFoto();"/>
								</td>
							</tr>
							
							<tr>
								<td colspan="2">
									<input type="submit" class="botao" value="pos" Onclick="postPut(${produto.id});" id="botaoAdicionarAtualizar" />
									<input type="button" class="botao" value="Cancelar" Onclick="cancelar();" id="botaoCancelar" /> 	
								</td>
							</tr>
						</table>
					</div>
					 
					<div id="divTemplateId_" class="imagem" style="display:none">
    					<label class="labelAdd"></label>
    					<label class="labelDel"></label>
    					<input type="button" class="buttonDel" onClick="excluirFoto(this);" style="display:none"/>
						<img class="imgId" />
						<input type="file" class="fileId" onChange="mostraFoto(this);"/>
					</div>		
				</form:form>
				</fieldset>		
			</section>
			
<!-- ----------------------------------------------------------------- -->

		<section id="listaProdutos">
		
			<fieldset id="fieldSetListaProduto">
				<table>
					<tr>
						<th colspan="7">Lista dos produtos cadastrados</th>
					</tr>
					<tr>
						<th>Nome</th>
						<th>Preço R$</th>
						<th>Cate. Principal</th>
						<th>Cate. Secundaria</th>
						<th>Descrição</th>
						<th>Fotos</th>
						<th>Opções</th>
					</tr>
					 
					<c:forEach items="${produtos}" var="produto">
						<tr id="produtoId_${produto.id}">
    	        			<td>${produto.nome}</td>
    	        			
    	        			<td class="tdPreco">
    	        				<script>
    	        					classPreco(${produto.preco});
    	        				</script>
    	        			</td>
							
    	        			<td>
    	        				<c:if test="${produto.categoriaPrincipal.nome == null}">
										Todas
								</c:if>
									
								<c:if test="${produto.categoriaPrincipal.nome != null}">
									${produto.categoriaPrincipal.nome}
								</c:if>
    	        				
    	        			</td>
    	        			<td>
    	        				<c:if test="${produto.categoriaSecundaria.nome == null}">
									Todas
								</c:if>
									
								<c:if test="${produto.categoriaSecundaria.nome != null}">
									${produto.categoriaSecundaria.nome}
								</c:if>
    	        			</td>
    	        			<td>${produto.descricao}</td>
    	        			<td>
    	        				<c:forEach items="${produto.fotos}" var="fotos">
	    	        				(${fotos.nome}) 
    	        				</c:forEach>
	    	        		</td>    	        	
	    	        		<td>
	    	        			<a href="p	roduto/${produto.id}"><button class="botao" >&nbsp;&nbsp;Editar&nbsp;</button></a>
	    	        			<input type="button" value="Deletar" class="botao" onClick="del(${produto.id});" />
	    	        		</td>
						</tr>
					</c:forEach>
					
				</table>
			</fieldset>
		</section>
			
<!-- ----------------------------------------------------------------- -->				
			<footer id="rodape">
			<p>Copyright &copy; 2017 - by Carlos Santana<br/>
			<a href="mailto:carlos.esc@live.com">carlos.esc@live.com</a></p>
			</footer>
		</div>
		
		<c:choose>
    		<c:when test="${produto.id == 0}">
       			<script>
					add();
				</script>	
    		</c:when>
    		<c:otherwise>
        		<script>
					update();
				</script>
				<c:forEach items="${produto.fotos}" var="foto">
	    	    	<script>
    	    			incluirFoto("${foto.nome}");
	    	    	</script>
    	        </c:forEach>
    		</c:otherwise>
		</c:choose>
		
		<script type="text/javascript" LANGUAGE="JavaScript">
			formataPreco(${produto.preco});
		</script>
	</body>
</html>