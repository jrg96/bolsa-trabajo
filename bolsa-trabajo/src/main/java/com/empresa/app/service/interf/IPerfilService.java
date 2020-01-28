package com.empresa.app.service.interf;

import com.empresa.app.model.Perfil;

public interface IPerfilService 
{
	public void guardar(Perfil perfil);
	public Perfil buscarPorNombre(String nombre);
}
