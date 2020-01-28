package com.empresa.app.controller;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.empresa.app.model.Perfil;
import com.empresa.app.model.Usuario;
import com.empresa.app.service.interf.IPerfilService;
import com.empresa.app.service.interf.IUsuarioService;

@Controller
@RequestMapping(value = "/registro")
public class RegistroController 
{
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	@Autowired
	private IUsuarioService usuarioService;
	
	@Autowired
	private IPerfilService perfilService;
	
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String registrar(@ModelAttribute Usuario usuario)
	{
		return "registro/frm_registro";
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String guardarRegistro(@ModelAttribute Usuario usuario, BindingResult result, RedirectAttributes attributes)
	{
		/*
		 * --------------- ZONA VERIFICACION DE ERRORES BINDING ---------------------
		 */
		System.out.println(usuario.toString());
		
		if (result.hasErrors())
		{
			System.out.println("Hubieron errores en el binding de usuario (insertar)");
			
			for (ObjectError error : result.getAllErrors()) 
			{
				System.out.println(error.getDefaultMessage());
			}
			
			return "registro/frm_registro";
		}
		
		
		/*
		 * --------------- ZONA DE PROCESAMIENTO DE DATOS -------------------------
		 */
		
		// Paso 1: Guardamos la contraseña
		if (usuario.getPassword().length() != 60)
		{
			usuario.setPassword(encoder.encode(usuario.getPassword()));
		}
		
		
		// Paso 2: Todo usuario registrado por defecto sera del tipo usuario
		Perfil perfil = this.perfilService.buscarPorNombre("USUARIO");
		Set<Perfil> perfilSet = new HashSet<Perfil>();
		perfilSet.add(perfil);
		
		// Paso 3: anexamos su perfil, y guardamos
		usuario.setPerfiles(perfilSet);
		usuario.setFechaRegistro(new Date());
		this.usuarioService.guardarUsuario(usuario);
		
		return "registro/frm_registro";
	}
}
