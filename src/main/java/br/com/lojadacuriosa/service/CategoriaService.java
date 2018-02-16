package br.com.lojadacuriosa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.lojadacuriosa.dao.CategoriaDAO;
import br.com.lojadacuriosa.model.Categoria;

@Service("categoriaService")
public class CategoriaService {
	
	@Autowired
	CategoriaDAO categoriaDAO;
	
	@Transactional
	public List<Categoria> getTodasCategorias(){
		return categoriaDAO.getTodasCategorias();
	}
	
	@Transactional
	public Categoria getCategoria(int id) {
		return categoriaDAO.getCategoria(id);
	}
	
	@Transactional
	public void addCategoria (Categoria categoria) {
		categoriaDAO.addCategoria(categoria);
	}
	
	@Transactional
	public void updateCategoria(Categoria categoria) {
		categoriaDAO.updateCategoria(categoria);
	}
	
	@Transactional
	public void deleteCategoria(int id) {
		categoriaDAO.deleteCategoria(id);
	}
}