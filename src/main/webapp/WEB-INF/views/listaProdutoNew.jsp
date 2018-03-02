 
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
			var arrayFoto = [];
			var novoId = 0;
  			var cont = 0;
  			var produtoId = 0;
  			
  			
  			function gravarProduto2(){
  				
  				$( "#formCadastro" ).submit(function( event ) {
	  				event.preventDefault();
					var formData = new FormData(this);
					
					if (document.getElementById("preco").value != "") { 
	  					document.getElementById("preco").value = document.getElementById("preco").value.replace(/\./g, '').replace(/,/g, '.');
					} else {
						document.getElementById("preco").value = "0";
					}					
						
						
						$.ajax({
	  				    	url: "/lojadacuriosa/produto",
	  				    	data: formData,
	  				    	type: 'POST',
	  				        enctype: "multipart/form-data",
	  				        contentType: false,
	  				        processData: false,
	  				        cache: false,
	  				        timeout: 600000,
	  				        success: function (response) {
	  				        	alert("Inclusão");
	  				        	$(window.document.location).attr("href","/lojadacuriosa/produtoNew");
	  				        },
	  				        error: function (exr, sender) {
	  				        	alert("Erro ao carregar pagina NovoProduto");
	  				        }
	  				    });
				});
  			}
  			
  			function gravarProduto(){
  				if (document.getElementById("preco").value != "") { 
  					document.getElementById("preco").value = document.getElementById("preco").value.replace(/\./g, '').replace(/,/g, '.');
				} else {
					document.getElementById("preco").value = "0";
				}
  				
  				if (produtoId==0){	
  					$( "#formCadastro" ).submit(function( event ) {
  	  					event.preventDefault();
  						var formData = new FormData(this);
  			  			
  						
  						
  						
  						
  						$.ajax({
  	  				    	url: "/lojadacuriosa/produto",
  	  				    	data: formData,
  	  				    	type: 'POST',
  	  				        enctype: "multipart/form-data",
  	  				        contentType: false,
  	  				        processData: false,
  	  				        cache: false,
  	  				        timeout: 600000,
  	  				        success: function (response) {
  	  				        	alert("Inclusão");
  	  				        	$(window.document.location).attr("href","/lojadacuriosa/produtoNew");
  	  				        },
  	  				        error: function (exr, sender) {
  	  				        	alert("Erro ao carregar pagina NovoProduto");
  	  				        }
  	  				    });
  					});
  					   
  				} else {
  					$( "#formCadastro" ).submit(function( event ) {
  	  					event.preventDefault();
  	  					var formData = new FormData(this);
  	  					
	  	  				formData.append("arrayFoto", JSON.stringify(arrayFoto));

  	  				    $.ajax({
  	  				    	url: "/lojadacuriosa/produto/" + produtoId,
  	  				    	data: formData,
  	  				    	method: 'POST',
  	  				    	enctype: "multipart/form-data",
  	  				        contentType: false,
  	  				        processData: false,
  	  				        cache: false,
  	  				        timeout: 600000,
  	  				        success: function (response) {
  	  				        	$("#nomeId_" + response["id"]).html(response["nome"]);
  	  				        	$("#precoId_" + response["id"]).html(formataPreco(response["preco"]));
  	  				        	$("#categoriaPrincipalId_" + response["id"]).html(response["categoriaPrincipal"]["nome"]);
  	  				        	$("#categoriaSecundariaId_" + response["id"]).html(response["categoriaSecundaria"]["nome"]);
  	  				        	$("#descricaoId_" + response["id"]).html(response["descricao"]);
  	  				        	var option = "";
  	  				        	$.each(response["fotos"], function (i, obj){
  					       			option += "(" + obj.nome + ")";
  					       		})  
  					       		$("#fotosId_" + response["id"]).html(option);
  	  				        	cancelar();
  	  				        	
  	  				        },		
  	  				        error: function (exr, sender) {
  	  				        	alert("Erro ao carregar pagina AtualizaProduto");
  	  				        }
  	  				    });
  	  		  		});
  				}
  				alert("Fim do IF ELSE - produtoId: " + produtoId);
  			}
  			
  			function novoProduto(){
  				$.ajax({
				    url: "/lojadacuriosa/categoria",
				    method: 'GET',
				    success: function (response01, response02, response03) {		    	
				    	produtoId = 0;
				    	var option = "<option  value=\"0\">Todas</option>";
				       	$.each(response01, function (i, obj){
				       		option += "<option value='"+obj.id+"'>"+obj.nome+"</option>";
				       	})
				       	$("#categoriaPrincipal").html(option);
				       	$("#categoriaSecundaria").html(option);
				    },
				        error: function (erroResponse01, erroResponse02, erroResponse03) {
				        	alert("Erro ao carregar categorias...")
				    }
				});
  				
  				produtoId = 0;
  				formularioProduto();
  				$("#botaoAdicionarAtualizar").val("Adicionar Produto");
  				arrayFotoResetar();
  			}
  			
  			function editarProduto(id){
  				$.ajax({
				    url: "/lojadacuriosa/produtoNew/" + id,
				    method: 'GET',
				    success: function (response01, response02, response03) {		    	
				    	produtoId = response01[1]["id"];
				    	formularioProduto();
				       	arrayFotoResetar();
				       	$("#botaoAdicionarAtualizar").val("Atualizar produto");
				       	$("#nome").val(response01[1]["nome"]);
				       	$("#preco").val(formataPreco(response01[1]["preco"]));
				       	$("#descricao").val(response01[1]["descricao"]);
				       	var option = "<option  value=\"0\">Todas</option>";
				       	$.each(response01[0], function (i, obj){
				       		option += "<option value='"+obj.id+"'>"+obj.nome+"</option>";
				       	})
				       	$("#categoriaPrincipal").html(response01[1]["categoriaPrincipal"] != null ? "<option value='"+response01[1]["categoriaPrincipal"]["id"]+"'>"+response01[1]["categoriaPrincipal"]["nome"]+" (ATUAL)"+"</option>" + option : option);
				       	$("#categoriaSecundaria").html(response01[1]["categoriaSecundaria"] != null ? "<option value='"+response01[1]["categoriaSecundaria"]["id"]+"'>"+response01[1]["categoriaSecundaria"]["nome"]+" (ATUAL)"+"</option>" + option : option);
				       	$.each(response01[1]["fotos"], function (i, obj){
				       		incluirFoto(obj.nome);
				       	})
				    },
				        error: function (erroResponse01, erroResponse02, erroResponse03) {
				        	alert("erro");
				    }
				});
  			}
  			
  			function deletarProduto(id){
  				$.ajax({
  			        url: "/lojadacuriosa/produto/" + id,
  			        method: 'DELETE',
  			        success: function (data01, data02, data03) {                       
  			        	$("#produtoId_" + id).remove();
  			        	alert("Deletado com sucesso: Id(" + id + ")");
  			        },
  			        error: function (xhr, status, error) {
  			        	alert("erro 1:" + xhr + ", 2:" + status + ", 3:" + error );
  			        }
  			    });	
  			}
  			
  			function mostraFoto(idFile){  				
  				var id = idFile.id.split("_")[1];
  				arrayFoto[id] = idFile.files[0].name;
  				document.getElementById("imgId_" + id).src = window.URL.createObjectURL(idFile.files[0]);
  				alert("Id: " + id + "\nNome: " + arrayFoto[id]);
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
  	  				
	    			arrayFoto[novoId] = nome;
	
	    			return novoId++;
  				}
  			}
  			
  			function excluirFoto(thisButton){
  				cont--;
  				var id = thisButton.id.split("_")[1];
  				alert(id);
  				$("#divId_" + id).remove();
  				arrayFoto[id] = null;
  			}
  			
  			function arrayFotoResetar(){
  				$.each( arrayFoto, function( key, value ) {
  					$("#divId_" + key).remove();
  				});
  				cont = 0;
  				novoId= 0;
  				while(arrayFoto.length > 0){
  					arrayFoto.pop();
  				}
  			}
  			
  			function formularioProduto(){
  				$("#fieldSetFormCadastro").prop("disabled", false);
  				$("#fieldSetFormCadastro").css("display", "");
  				
  				$("#fieldSetInclusaoPesquisa").prop("disabled", true);
  				$("#fieldSetInclusaoPesquisa").css("display", "none");
  				
  				$("#fieldSetListaProduto").prop("disabled", true);
  				
  				$("#formCadastro")[0].reset();
  			}
  			
  			function cancelar(){
  				$("#fieldSetFormCadastro").prop("disabled", true);
  				$("#fieldSetFormCadastro").css("display", "none");
  				
  				$("#fieldSetInclusaoPesquisa").prop("disabled", false);
  				$("#fieldSetInclusaoPesquisa").css("display", "");
  				
  				$("#fieldSetListaProduto").prop("disabled", false);
  				
  				$("#formCadastro")[0].reset();
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
  			    	return "0";
  			    } else {
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
						<input type="button" class="botao" value="Novo Produto" Onclick="novoProduto();" id="novoProduto" />
					</div>
				</fieldset>
				
				<fieldset id="fieldSetFormCadastro" style="display:none;" disabled>
				<form id="formCadastro" modelAttribute="produto" enctype="multipart/form-data">
          			<div class="tabela">
						<table>
							<tr>
								<td colspan="2">Informe os dados do produto</td>
							</tr>
							<tr>
								<td class="atributo">Nome</td>
								<td class="input"><input id="nome" name="nome" type="text"></input></td>
							</tr>
							<tr>
								<td class="atributo">Preço R$</td>
								<td class="input">
									<input id="preco" name="preco" onKeyUp="mascaraMoeda(this)" type="text"></input>
								</td>
							</tr>	
						  	
							<tr>
								<td class="atributo">Categoria principal</td>
								<td>					
	               					<select id="categoriaPrincipal" name="categoriaPrincipal.id">       
    	                    			
            	        			</select>
            	        		</td>
							</tr>
				 	
							<tr>
								<td class="atributo">Categoria secundaria</td>
								<td>					
	               					<select id="categoriaSecundaria" name="categoriaSecundaria.id">
    	                    			
            	        			</select>
            	        		</td>
							</tr>
				
							<tr>
								<td colspan="2">
									Descrição (Máximo 200 letras)
									<br />
									<textarea id="descricao" name="descricao" class="input" maxlength="200" ></textarea>
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
									<input type="submit" class="botao" value="" Onclick="gravarProduto();" id="botaoAdicionarAtualizar" />
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
				</form>
				</fieldset>		
			</section>
			
<!-- ----------------------------------------------------------------- -->

		<section id="listaProdutos">
		
			<fieldset id="fieldSetListaProduto">
				<table id="tabelaLista">
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
    	        			<td id="nomeId_${produto.id}">${produto.nome}</td>
    	        			
    	        			<td id="precoId_${produto.id}">
    	        				<script>
    	        	  				$("#precoId_" + ${produto.id}).text(formataPreco(${produto.preco}));
    	        				</script>
    	        			</td>
							
    	        			<td id="categoriaPrincipalId_${produto.id}">
    	        				<c:if test="${produto.categoriaPrincipal.nome == null}">
										Todas
								</c:if>
									
								<c:if test="${produto.categoriaPrincipal.nome != null}">
									${produto.categoriaPrincipal.nome}
								</c:if>
    	        				
    	        			</td>
    	        			
    	        			<td id="categoriaSecundariaId_${produto.id}">
    	        				<c:if test="${produto.categoriaSecundaria.nome == null}">
									Todas
								</c:if>
									
								<c:if test="${produto.categoriaSecundaria.nome != null}">
									${produto.categoriaSecundaria.nome}
								</c:if>
    	        			</td>
    	        			
    	        			<td id="descricaoId_${produto.id}">${produto.descricao}</td>
    	        			
    	        			<td id="fotosId_${produto.id}">
    	        				<c:forEach items="${produto.fotos}" var="fotos">
	    	        				(${fotos.nome}) 
    	        				</c:forEach>
	    	        		</td>    	        	
	    	        		
	    	        		<td>
	    	        			<input type="button" value="Editar" class="botao" onClick="editarProduto(${produto.id});" />
	    	        			<input type="button" value="Deletar" class="botao" onClick="deletarProduto(${produto.id});" />
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
	</body>
</html>