package com.empresa.app.service.interf;

import com.empresa.app.model.Usuario;

public interface IUsuarioService 
{
	public void guardarUsuario(Usuario usuario);
	public Usuario obtenerUsuario(int id);
}
