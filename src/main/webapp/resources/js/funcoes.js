var anteriorAtivo = 'todos-produtos';
function exibirCategoriaSecundaria(categoriaS,marginLeft){
	document.getElementById("link-" + anteriorAtivo).style.backgroundColor = "AntiqueWhite";
	document.getElementById("link-" + anteriorAtivo).style.padding = "0px";
	document.getElementById(anteriorAtivo).style.display = "none";
	
	document.getElementById("link-" + categoriaS).style.backgroundColor = "PeachPuff";
	document.getElementById("link-" + categoriaS).style.padding = "0px 10px 0px 10px";
	document.getElementById(categoriaS).style.display = "flex";	
	document.getElementById(categoriaS).style.marginLeft = marginLeft;
	anteriorAtivo = categoriaS;	
}