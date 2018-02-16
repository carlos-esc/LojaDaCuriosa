package br.com.lojadacuriosa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import br.com.lojadacuriosa.model.FaleConosco;
import br.com.lojadacuriosa.model.Produto;
import br.com.lojadacuriosa.service.ProdutoService;

@Controller
public class ViewController {
	
	@Autowired
	private ProdutoService produtoService; 
	
	@GetMapping(value = "/bemVindo")
	public String bemVindo(Model model) {
		List<Produto> produtos = produtoService.getTodosProdutos();
		model.addAttribute("produtos", produtos);
		return "bemVindo";
	}
	
	@GetMapping(value = "/parceiros")
	public String parceiros() {
		return "parceiros";
	}
	
	@GetMapping(value = "/produtos")
	public String produtos() {
		return "produtos";
	}
	
	@GetMapping(value = "/getFaleConosco")
	public String faleConosco(Model model) {
		model.addAttribute("faleConosco", new FaleConosco());
		return "faleConosco";
	}
	
	@GetMapping(value = "/getFaleConoscoSucesso")
	public String faleConoscoSucesso(FaleConosco faleConosco) {
		if(faleConosco.getId() == 0) {
			return "redirect:getFaleConosco";
		}
		return "faleConosco";
	}
	
	@GetMapping(value = "/sobreNos")
	public String sobreNos() {
		return "sobreNos";
	}
}
