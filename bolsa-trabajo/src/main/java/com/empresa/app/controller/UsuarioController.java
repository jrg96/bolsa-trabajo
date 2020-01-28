package com.empresa.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.empresa.app.model.Usuario;
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
	
	@RequestMapping(value = "/delete/{id}")
	public String eliminarUsuario(@PathVariable("id") int id, RedirectAttributes attributes)
	{
		this.usuarioService.eliminarUsuario(id);
		attributes.addFlashAttribute("mensaje", "Usuario eliminado con exito");
		return "redirect:/users/index";
	}
	
	@RequestMapping(value = "/state/{id}/{state}", method = RequestMethod.GET)
	public String cambiarEstado(@PathVariable("id") int id, @PathVariable("state") int state, RedirectAttributes attributes)
	{
		Usuario usuario = this.usuarioService.obtenerUsuario(id);
		usuario.setEstatus(state);
		this.usuarioService.guardarUsuario(usuario);
		
		String mensaje = "Usuario ha sido dado de baja del sistema con exito";
		if (state == 1)
		{
			mensaje = "Usuario ha sido dado de alta del sistema con exito";
		}
		attributes.addFlashAttribute("mensaje", mensaje);
		
		return "redirect:/users/index";
	}
	
}
