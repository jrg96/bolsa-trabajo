package com.empresa.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.empresa.app.model.Categoria;
import com.empresa.app.service.interf.ICategoriaService;

@Controller
@RequestMapping(value = "/categorias")
public class CategoriaController 
{
	@Autowired
	private ICategoriaService categoriaService;
	
	
	
	
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String crearCategoria(@ModelAttribute Categoria categoria)
	{
		return "categoria/frm_categoria";
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String guardarCategoria(@ModelAttribute Categoria categoria, BindingResult result, RedirectAttributes attributes)
	{
		/*
		 * --------------- ZONA VERIFICACION DE ERRORES BINDING ---------------------
		 */
		System.out.println(categoria.toString());
		
		if (result.hasErrors())
		{
			System.out.println("Hubieron errores en el binding de usuario (insertar)");
			
			for (ObjectError error : result.getAllErrors()) 
			{
				System.out.println(error.getDefaultMessage());
			}
			
			return "categoria/frm_categoria";
		}
		
		/*
		 * --------------- ZONA DE PROCESAMIENTO DE DATOS -------------------------
		 */
		this.categoriaService.guardarCategoria(categoria);
		attributes.addFlashAttribute("mensaje", "Categoria agregada con exito");
		
		return "redirect:/categorias/create";
	}
}