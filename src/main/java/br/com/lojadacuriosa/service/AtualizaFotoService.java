package br.com.lojadacuriosa.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import br.com.lojadacuriosa.model.Foto;
import br.com.lojadacuriosa.model.Produto;

public class AtualizaFotoService {
	
	ProdutoService produtoService;
	
	private String diretorioDestino = "/home/eduardo/eclipse-workspace/lojadacuriosa/src/main/webapp/resources/fotos/";
	
	public Produto atualiza(Produto produtoX, String listaFoto, MultipartFile[] listaUpload) throws IOException {
		
		Produto produto = produtoX;
		
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

				// If it is a directory, make sure it is empty
				if (f.isDirectory()) {
					String[] files = f.list();
					if (files.length > 0) throw new IllegalArgumentException("Delete: directory not empty:" + fileName);
				}

				// Attempt to delete it
				boolean success = f.delete();
				if (!success) {
					throw new IllegalArgumentException("Delete: deletion failed");
				} else {
					produto.getFotos().remove(produto.getFotos().get(i));
				}
			}	
		}
		
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
		return produto;
	}
}
