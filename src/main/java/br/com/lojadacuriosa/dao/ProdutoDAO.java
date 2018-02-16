package br.com.lojadacuriosa.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.lojadacuriosa.model.Produto;

@Repository
public class ProdutoDAO {
	
	@Autowired
	private SessionFactory sessionfactory;
	
	public void setSesionFactory(SessionFactory sf) {
		this.sessionfactory = sf;
	}
	
	public List<Produto> getTodosProdutos() {
		Session session = this.sessionfactory.getCurrentSession();
		return session.createQuery("from Produto").list();
	}
	
	public Produto getProduto(int id) {
		Session session = this.sessionfactory.getCurrentSession();
		return (Produto) session.get(Produto.class, new Integer(id));
	}
	
	public Produto addProduto(Produto produto) {
		Session session = this.sessionfactory.getCurrentSession();
		session.persist(produto);
		return produto;
	}
	
	public void updateProduto(Produto produto) {
		Session session = this.sessionfactory.getCurrentSession();
		session.update(produto);
	}
	
	public void deleteProduto(int id) {
		Session session = this.sessionfactory.getCurrentSession();
		Produto produto = (Produto) session.load(Produto.class, new Integer(id));
		if (produto != null) {
			session.delete(produto);
		}
	}
}
