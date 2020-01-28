package com.empresa.app.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.empresa.app.model.Categoria;
import com.empresa.app.repository.CategoriaRepository;
import com.empresa.app.service.interf.ICategoriaService;

@Service(value = "categoriaServiceJpa")
public class CategoriaServiceJpa implements ICategoriaService
{
	@Autowired
	private CategoriaRepository categoriaRepository;

	@Override
	public void guardarCategoria(Categoria categoria) 
	{
		this.categoriaRepository.save(categoria);
	}

	@Override
	public Categoria obtenerCategoria(int id) 
	{
		Optional<Categoria> categoria = this.categoriaRepository.findById(id);
		
		if (categoria.isPresent())
		{
			return categoria.get();
		}
		
		return null;
	}

	@Override
	public List<Categoria> obtenerTodos() 
	{
		return this.categoriaRepository.findAll();
	}

	@Override
	public void eliminarCategoria(int id) 
	{
		if (this.categoriaRepository.existsById(id))
		{
			this.categoriaRepository.deleteById(id);
		}
	}
	
}
