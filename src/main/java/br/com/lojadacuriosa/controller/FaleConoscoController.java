package br.com.lojadacuriosa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.lojadacuriosa.model.FaleConosco;
import br.com.lojadacuriosa.service.FaleConoscoService;

@Controller
public class FaleConoscoController {
	
	@Autowired
	FaleConoscoService faleConoscoService;
	
	@PostMapping(value = "/postFaleConosco")
	public String addFaleConosco(@ModelAttribute("faleConosco") FaleConosco faleConosco, RedirectAttributes redirectAttributes) {	
		redirectAttributes.addFlashAttribute("faleConosco", faleConoscoService.addFaleConosco(faleConosco));
		return "redirect:getFaleConoscoSucesso";
	}
}
