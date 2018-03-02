package br.com.lojadacuriosa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.lojadacuriosa.dao.ProdutoDAO;
import br.com.lojadacuriosa.model.Produto;

@Service("produtoService")
public class ProdutoService {

	@Autowired
	ProdutoDAO produtoDAO;
	
	@Transactional
	public List<Produto> getTodosProdutos(){
		return produtoDAO.getTodosProdutos();
	}
	
	@Transactional
	public Produto getProduto(int id) {
		return produtoDAO.getProduto(id);
	}
	
	@Transactional
	public Produto addProduto (Produto produto) {
		return produtoDAO.addProduto(produto);
	}
	
	@Transactional
	public void updateProduto(Produto produto) {
		produtoDAO.updateProduto(produto);
	}
	
	@Transactional
	public void deleteProduto(int id) {
		produtoDAO.deleteProduto(id);
	}
}
