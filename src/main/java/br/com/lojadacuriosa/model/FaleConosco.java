package br.com.lojadacuriosa.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="faleConosco")
public class FaleConosco {
	
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int id;
	
	@Column(name="nome")
	String nome;
	
	@Column(name="email")
	String email;
	
	@Column(name="mensagem")
	String mensagem;
	
	/*
	public FaleConosco() {
		super();
	}
	public FaleConosco(int i, String nome,String email,String mensagem) {
		super();
		this.id = i;
		this.nome = nome;
		this.email=email;
		this.mensagem=mensagem;
	}
	*/
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMensagem() {
		return mensagem;
	}

	public void setMensagem(String mensagem) {
		this.mensagem = mensagem;
	}
}
