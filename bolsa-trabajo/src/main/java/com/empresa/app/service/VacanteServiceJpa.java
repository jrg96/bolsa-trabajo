package com.empresa.app.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.empresa.app.model.Vacante;
import com.empresa.app.repository.VacanteRepository;
import com.empresa.app.service.interf.IVacanteService;

@Service(value = "vacanteServiceJpa")
public class VacanteServiceJpa implements IVacanteService
{
	@Autowired
	private VacanteRepository vacanteRepository;
	
	private ArrayList<String> estados;
	
	public VacanteServiceJpa() 
	{
		this.estados = new ArrayList<>();
		estados.add("Creada");
		estados.add("Aprobada");
		estados.add("Eliminada");
	}

	
	@Override
	public void guardarVacante(Vacante vacante) 
	{
		this.vacanteRepository.save(vacante);
	}

	@Override
	public void eliminarVacante(int id) 
	{
		if (this.vacanteRepository.existsById(id))
		{
			this.vacanteRepository.deleteById(id);
		}
	}

	@Override
	public Vacante obtenerVacante(int id) 
	{
		Optional<Vacante> vacante = this.vacanteRepository.findById(id);
		
		if (vacante.isPresent())
		{
			return vacante.get();
		}
		
		return null;
	}

	@Override
	public List<Vacante> obtenerTodas() 
	{
		return this.vacanteRepository.findAll();
	}

	@Override
	public List<String> obtenerEstados() 
	{
		return this.estados;
	}

}
