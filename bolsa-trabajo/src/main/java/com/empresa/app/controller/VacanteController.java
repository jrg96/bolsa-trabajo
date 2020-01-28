package com.empresa.app.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.empresa.app.util.Utileria;
import com.empresa.app.model.Vacante;
import com.empresa.app.service.interf.ICategoriaService;
import com.empresa.app.service.interf.IVacanteService;

@Controller
@RequestMapping(value = "/vacantes")
public class VacanteController 
{
	@Autowired
	private ICategoriaService categoriaService;
	
	@Autowired
	private IVacanteService vacanteService;
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String listaVacantes(Model model)
	{
		model.addAttribute("lista_vacantes", this.vacanteService.obtenerTodas());
		return "vacante/lista_vacante";
	}
	
	
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String crearVacante(@ModelAttribute Vacante vacante, Model model)
	{
		model.addAttribute("lista_categorias", this.categoriaService.obtenerTodos());
		model.addAttribute("lista_estados", this.vacanteService.obtenerEstados());
		return "vacante/frm_vacante";
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String guardarVacante(@ModelAttribute Vacante vacante, BindingResult result, RedirectAttributes attributes,
			@RequestParam("archivoImagen") MultipartFile multiPart, HttpServletRequest request, Model model)
	{
		
		/*
		 * --------------- ZONA VERIFICACION DE ERRORES BINDING ---------------------
		 */
		System.out.println(vacante.toString());
		
		if (result.hasErrors())
		{
			System.out.println("Hubieron errores en el binding de pelicula (insertar)");
			
			for (ObjectError error : result.getAllErrors()) 
			{
				System.out.println(error.getDefaultMessage());
			}
			
			model.addAttribute("lista_categorias", this.categoriaService.obtenerTodos());
			model.addAttribute("lista_estados", this.vacanteService.obtenerEstados());
			
			return "vacante/frm_vacante";
		}
		
		
		/*
		 * --------------- ZONA DE PROCESAMIENTO DE DATOS -------------------------
		 */
		
		// Verificando si el usuario subio imagen y realizar la subida
		if (!multiPart.isEmpty())
		{
			String nombreImagen = Utileria.guardarImagen(multiPart, request);
			vacante.setImagen(nombreImagen);
		}
		
		// Procedemos a realizar el guardado
		vacanteService.guardarVacante(vacante);
		
		attributes.addFlashAttribute("mensaje", "Vacante creada con exito");
		return "redirect:/vacantes/index";
	}
	
	@RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
	public String modificarVacante(@PathVariable("id") int id, Model model)
	{
		model.addAttribute("vacante", this.vacanteService.obtenerVacante(id));
		model.addAttribute("lista_categorias", this.categoriaService.obtenerTodos());
		model.addAttribute("lista_estados", this.vacanteService.obtenerEstados());
		
		return "vacante/frm_vacante";
	}
	
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public String eliminarVacante(@PathVariable("id") int id, RedirectAttributes attributes)
	{
		this.vacanteService.eliminarVacante(id);
		attributes.addFlashAttribute("mensaje", "Vacante eliminada con exito");
		
		return "redirect:/vacantes/index";
	}
	
	
	/*
	 * --------- REGLAS DE CONVERSION PARA EL CONTROLADOR ------------------------
	 */
	@InitBinder
	public void initBinder(WebDataBinder binder) 
	{
		// Definiendo el formato a ocupar para las fechas (para transoformarlas)
		SimpleDateFormat date = new SimpleDateFormat("dd-MM-yyyy");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(date, false));
	}
}
