package br.com.lojadacuriosa.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.lojadacuriosa.model.FaleConosco;

@Repository
public class FaleConoscoDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf) {
		this.sessionFactory = sf;
	}
	
	public FaleConosco addFaleConosco(FaleConosco faleConosco) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(faleConosco);
		return faleConosco;
	}
}
