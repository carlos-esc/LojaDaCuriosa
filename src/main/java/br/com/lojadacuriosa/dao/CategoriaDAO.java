package br.com.lojadacuriosa.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.lojadacuriosa.model.Categoria;

@Repository
public class CategoriaDAO {
	
	@Autowired
	private SessionFactory sessionfactory;
	
	public void setSesionFactory(SessionFactory sf) {
		this.sessionfactory = sf;
	}
	
	public List<Categoria> getTodasCategorias() {
		Session session = this.sessionfactory.getCurrentSession();
		List<Categoria> categoriaLista = session.createQuery("from Categoria").list();
		return categoriaLista;
	}
	
	public Categoria getCategoria(int id) {
		Session session = this.sessionfactory.getCurrentSession();
		Categoria categoria = (Categoria) session.get(Categoria.class, new Integer(id));
		return categoria;
	}
	
	public Categoria addCategoria(Categoria categoria) {
		Session session = this.sessionfactory.getCurrentSession();
		session.persist(categoria);
		return categoria;
	}
	
	public void updateCategoria(Categoria categoria) {
		Session session = this.sessionfactory.getCurrentSession();
		session.update(categoria);
	}
	
	public void deleteCategoria(int id) {
		Session session = this.sessionfactory.getCurrentSession();
		Categoria categoria = (Categoria) session.load(Categoria.class, new Integer(id));
		if (categoria != null) {
			session.delete(categoria);
		}
	}
}