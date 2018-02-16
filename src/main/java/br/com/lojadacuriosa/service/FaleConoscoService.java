package br.com.lojadacuriosa.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.lojadacuriosa.dao.FaleConoscoDAO;
import br.com.lojadacuriosa.model.FaleConosco;

@Service("faleConoscoService")
public class FaleConoscoService {
	
	@Autowired
	FaleConoscoDAO faleConoscoDAO;
	
	@Transactional
	public FaleConosco addFaleConosco(FaleConosco faleConosco) {
		faleConoscoDAO.addFaleConosco(faleConosco);
		return faleConosco;
	}
}
