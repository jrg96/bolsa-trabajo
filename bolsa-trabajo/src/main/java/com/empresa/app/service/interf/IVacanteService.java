package com.empresa.app.service.interf;

import java.util.List;

import com.empresa.app.model.Vacante;

public interface IVacanteService 
{
	public void guardarVacante(Vacante vacante);
	public void eliminarVacante(int id);
	public Vacante obtenerVacante(int id);
	public List<Vacante> obtenerTodas();
	public List<String> obtenerEstados();
}
