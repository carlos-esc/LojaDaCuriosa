package br.com.lojadacuriosa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.lojadacuriosa.dao.FotoDAO;
import br.com.lojadacuriosa.model.Foto;

@Service("fotoService")
public class FotoService {
	
	@Autowired
	FotoDAO fotoDAO;
	
	@Transactional
	public List<Foto> getTodasFotos(){
		return fotoDAO.getTodasFotos();
	}
	
	@Transactional
	public Foto getFoto(int id) {
		return fotoDAO.getFoto(id);
	}
	
	@Transactional
	public void addFoto (Foto foto) {
		fotoDAO.addFoto(foto);
	}
	
	@Transactional
	public void updateFoto(Foto foto) {
		fotoDAO.updateFoto(foto);
	}
	
	@Transactional
	public void deleteFoto(int id) {
		fotoDAO.deleteFoto(id);
	}
}
