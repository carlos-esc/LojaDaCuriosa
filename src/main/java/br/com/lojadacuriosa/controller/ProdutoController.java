package br.com.lojadacuriosa.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import br.com.lojadacuriosa.model.Categoria;
import br.com.lojadacuriosa.model.Foto;
import br.com.lojadacuriosa.model.Produto;
import br.com.lojadacuriosa.service.CategoriaService;
import br.com.lojadacuriosa.service.ProdutoService;

@Controller
public class ProdutoController {
	
	@Autowired
	private ProdutoService produtoService;
	
	@Autowired
	private CategoriaService categoriaService;
	
	@GetMapping(value = "/produtoNew")
	public String getProdutosNew(Model model) {
		List<Categoria> categorias = categoriaService.getTodasCategorias();
		List<Produto> produtos = produtoService.getTodosProdutos();
		model.addAttribute("produto", new Produto());
		model.addAttribute("categorias", categorias);
		model.addAttribute("produtos", produtos);
		return "listaProdutoNew";
	}
	
	@GetMapping(value = "/produtoNew/{id}")
	public @ResponseBody List<Object> updateProdutoNew(@PathVariable int id) throws JsonProcessingException {
		List<Object> resultado = new ArrayList<>();
		resultado.add(this.categoriaService.getTodasCategorias());
		resultado.add(this.produtoService.getProduto(id));
		resultado.add(this.produtoService.getTodosProdutos());
		ObjectMapper mapper = new ObjectMapper();
		System.out.println(mapper.writeValueAsString(resultado));
	    return resultado;
	}
	
	@PostMapping(value = "/produto")
	public @ResponseBody Produto addProduto(@ModelAttribute("produto") Produto produto,
							@RequestParam("imagemUpload") MultipartFile[] listaUpload) throws Exception {
		
		if(produto.getCategoriaPrincipal().getId() == 0) produto.setCategoriaPrincipal(null);
		if(produto.getCategoriaSecundaria().getId() == 0) produto.setCategoriaSecundaria(null);
		produto.setFotos(new ArrayList<Foto>());
		ObjectMapper mapper = new ObjectMapper();
		System.out.println("Produto :" + mapper.writeValueAsString(produto));
		//produtoService.addProduto(atualiza(produto, null, listaUpload));
		return produtoService.addProduto(atualiza(produto, null, listaUpload));
	}
	
	@PostMapping(value = "/produto/{id}")
	public @ResponseBody Produto putProduto(@ModelAttribute("produto") Produto produto,
							@RequestParam("imagemUpload") MultipartFile[] listaUpload,
							@RequestParam("arrayFoto") String arrayFoto) throws Exception {
		
		if(produto.getCategoriaPrincipal().getId() == 0) produto.setCategoriaPrincipal(null);
		if(produto.getCategoriaSecundaria().getId() == 0) produto.setCategoriaSecundaria(null);
		produtoService.updateProduto(atualiza(produto, arrayFoto, listaUpload));
		return produtoService.getProduto(produto.getId());
	}
	
	@DeleteMapping(value = "/produto/{id}")
	public @ResponseBody void deleteProduto(@PathVariable int id) throws IOException {
		Produto produto = new Produto();
		produto.setId(id);
		atualiza(produto, "[\"DeletarTodos\"]", null);
		produtoService.deleteProduto(id);
		return;
	}
	
	Produto atualiza(Produto produto, String listaFoto, MultipartFile[] listaUpload) throws IOException {		
		
		String diretorioDestino = System.getProperty("user.home") + "/eclipse-workspace/lojadacuriosa/src/main/webapp/resources/fotos/";
		File dir = new File(diretorioDestino);  
		if (dir.mkdir()) {
			System.out.println("Criado--->");
		} else {
			System.out.println("Não foi criado<---");
		}
		
		if (produto.getId() != 0) {
			
			ObjectMapper mapper = new ObjectMapper();
			JsonNode listaFotoJson = mapper.readTree(listaFoto);	
			
			produto.setFotos(produtoService.getProduto(produto.getId()).getFotos());
			for (int i = produto.getFotos().size() - 1 ; i >= 0  ; i--){
				boolean existe = false;
				for(int j = 0 ; j < listaFotoJson.size() ; j++) {
					if (produto.getFotos().get(i).getNome().equals(listaFotoJson.get(j).asText())) {
						existe = true;
						System.out.println(existe + " <- Foto: " + produto.getFotos().get(i).getNome());
					}
				}
			
				if (!existe) {
					String fileName = (diretorioDestino + produto.getFotos().get(i).getNome());

					// A File object to represent the filename
					File f = new File(fileName);
					
					// Make sure the file or directory exists
					if (!f.exists()) throw new IllegalArgumentException("Delete: no such file or directory:" + fileName);

					// Make sure the file or directory isn't write protected
					if (!f.canWrite()) throw new IllegalArgumentException("Delete: write protected:"+ fileName);

					// 	If it is a directory, make sure it is empty
					if (f.isDirectory()) {
						String[] files = f.list();
						if (files.length > 0) throw new IllegalArgumentException("Delete: directory not empty:" + fileName);
					}
				
					// 	Attempt to delete it
					boolean success = f.delete();
					if (!success) {
						throw new IllegalArgumentException("Delete: deletion failed");
					} else {
						produto.getFotos().remove(produto.getFotos().get(i));
					}
				}	
			}
		}
		
		if(listaUpload != null) {
			if (listaUpload.length != 0) {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
				int controle = 1;
					for (MultipartFile aFile : listaUpload){               
						if (!aFile.isEmpty()) {
							Foto foto = new Foto();
							foto.setNome(sdf.format(new Date()) + "_" + controle++ + "-" + aFile.getOriginalFilename());
							foto.setCaminho("resources/fotos/");
							foto.setProduto(produto);
							produto.getFotos().add(foto);
							aFile.transferTo(new File(diretorioDestino + foto.getNome()));
						}
					}
			}
		}
		return produto;
	}
}