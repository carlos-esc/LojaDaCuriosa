package br.com.lojadacuriosa.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.lojadacuriosa.model.Foto;

@Repository
public class FotoDAO {
	
	@Autowired
	private SessionFactory sessionfactory;
	
	public void setSesionFactory(SessionFactory sf) {
		this.sessionfactory = sf;
	}
	
	public List<Foto> getTodasFotos() {
		Session session = this.sessionfactory.getCurrentSession();
		List<Foto> fotoLista = session.createQuery("from Foto").list();
		return fotoLista;
	}
	
	public Foto getFoto(int id) {
		Session session = this.sessionfactory.getCurrentSession();
		Foto foto = (Foto) session.get(Foto.class, new Integer(id));
		return foto;
	}
	
	public Foto addFoto(Foto foto) {
		Session session = this.sessionfactory.getCurrentSession();
		session.persist(foto);
		return foto;
	}
	
	public void updateFoto(Foto foto) {
		Session session = this.sessionfactory.getCurrentSession();
		session.update(foto);
	}
	
	public void deleteFoto(int id) {
		Session session = this.sessionfactory.getCurrentSession();
		Foto foto = (Foto) session.load(Foto.class, new Integer(id));
		if (foto != null) {
			session.delete(foto);
		}
	}
}
