package br.com.lojadacuriosa.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="foto")
public class Foto {
	
	@Id
	@Column(name="id_foto")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int id;
	
	@Column(name="nome")
	String nome;
	
	@Column(name="caminho")
	String caminho;
	
	@ManyToOne
	@JoinColumn(name = "id_prod")
	Produto produto;

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

	public String getCaminho() {
		return caminho;
	}

	public void setCaminho(String caminho) {
		this.caminho = caminho;
	}

	public Produto getProduto() {
		return produto;
	}

	public void setProduto(Produto produto) {
		this.produto = produto;
	}
}
