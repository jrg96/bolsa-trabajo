package com.empresa.app.service;

import java.util.HashSet;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.empresa.app.model.Usuario;
import com.empresa.app.repository.UsuarioRepository;
import com.empresa.app.service.interf.IUsuarioService;

@Service(value = "usuarioServiceJpa")
public class UsuarioServiceJpa implements UserDetailsService, IUsuarioService
{
	@Autowired
	private UsuarioRepository usuarioRepository;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException 
	{
		Usuario usuario = usuarioRepository.findByUsername(username);
		if(usuario == null)
		{
			throw new UsernameNotFoundException("Invalid username or password.");
		}
		
		return new User(usuario.getUsername(), usuario.getPassword(), getAuthority(usuario));
	}
	
	private Set<SimpleGrantedAuthority> getAuthority(Usuario usuario) 
	{
        Set<SimpleGrantedAuthority> authorities = new HashSet<>();
        
		usuario.getPerfiles().forEach(role -> {
            authorities.add(new SimpleGrantedAuthority("ROLE_" + role.getPerfil()));
		});
		
		return authorities;
	}

	@Override
	public void guardarUsuario(Usuario usuario) 
	{
		usuarioRepository.save(usuario);
	}

	@Override
	public Usuario obtenerUsuario(int id) 
	{
		Optional<Usuario> usuario = usuarioRepository.findById(id);
		
		if (usuario.isPresent())
		{
			return usuario.get();
		}
		
		return null;
	}
	
}
