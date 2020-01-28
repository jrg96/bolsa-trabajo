package com.empresa.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.empresa.app.service.interf.IUsuarioService;

@Controller
@RequestMapping(value = "/users")
public class UsuarioController 
{
	@Autowired
	private IUsuarioService usuarioService;
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String listaUsuario(Model model)
	{
		model.addAttribute("lista_usuarios", this.usuarioService.obtenerTodos());
		return "usuario/lista_usuario";
	}
}
