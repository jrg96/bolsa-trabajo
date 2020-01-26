package com.empresa.app.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.empresa.app.model.Perfil;

@Repository(value = "perfilRepository")
public interface PerfilRepository extends JpaRepository<Perfil, Integer> 
{
	
}
