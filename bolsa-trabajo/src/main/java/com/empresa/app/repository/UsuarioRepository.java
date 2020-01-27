package com.empresa.app.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.empresa.app.model.Usuario;

@Repository(value = "usuarioRepository")
public interface UsuarioRepository extends JpaRepository<Usuario, Integer> 
{
	Usuario findByUsername(String username);
}
