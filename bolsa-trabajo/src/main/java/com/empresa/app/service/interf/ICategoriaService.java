package com.empresa.app.service.interf;

import java.util.List;

import com.empresa.app.model.Categoria;

public interface ICategoriaService 
{
	public void guardarCategoria(Categoria categoria);
	public Categoria obtenerCategoria(int id);
	public List<Categoria> obtenerTodos();
	public void eliminarCategoria(int id);
}
