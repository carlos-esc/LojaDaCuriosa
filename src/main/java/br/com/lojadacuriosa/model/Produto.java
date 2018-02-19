package br.com.lojadacuriosa.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@Table(name="produto")
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "id")
public class Produto {
	
	@Id
	@Column(name="id_prod")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int id;
	
	@Column(name="nome")
	String nome;
	
	@Column(name="descricao")
	String descricao;
	
	@Column(name="preco")
	float preco;
	
	//@Column(name="dataHora")
	//@Temporal(TemporalType.TIMESTAMP)
	//Date dataHora;
	
	@OneToOne
	Categoria categoriaPrincipal;
	
	@OneToOne//(optional=false)
	Categoria categoriaSecundaria;
	
	//@OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL, orphanRemoval = true, mappedBy = "produto")
	@OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL, orphanRemoval = true, mappedBy = "produto")
	List<Foto> fotos;

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

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public float getPreco() {
		return preco;
	}

	public void setPreco(float preco) {
		this.preco = preco;
	}

	public Categoria getCategoriaPrincipal() {
		return categoriaPrincipal;
	}

	public void setCategoriaPrincipal(Categoria categoriaPrincipal) {
		this.categoriaPrincipal = categoriaPrincipal;
	}

	public Categoria getCategoriaSecundaria() {
		return categoriaSecundaria;
	}

	public void setCategoriaSecundaria(Categoria categoriaSecundaria) {
		this.categoriaSecundaria = categoriaSecundaria;
	}

	public List<Foto> getFotos() {
		return fotos;
	}

	public void setFotos(List<Foto> fotos) {
		this.fotos = fotos;
	}
}
