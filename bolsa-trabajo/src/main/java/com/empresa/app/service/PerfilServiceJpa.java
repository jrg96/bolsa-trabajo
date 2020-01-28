package com.empresa.app.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.empresa.app.model.Perfil;
import com.empresa.app.repository.PerfilRepository;
import com.empresa.app.service.interf.IPerfilService;

@Service(value = "perfilServiceJpa")
public class PerfilServiceJpa implements IPerfilService
{
	@Autowired
	private PerfilRepository perfilRepository;

	@Override
	public void guardar(Perfil perfil) 
	{
		this.perfilRepository.save(perfil);
	}

	@Override
	public Perfil buscarPorNombre(String nombre) 
	{
		Perfil perfil = this.perfilRepository.findByPerfil(nombre);
		return perfil;
	}
	
}
