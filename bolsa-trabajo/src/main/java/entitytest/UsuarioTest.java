package entitytest;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.empresa.app.model.Perfil;
import com.empresa.app.model.Usuario;
import com.empresa.app.repository.PerfilRepository;
import com.empresa.app.repository.UsuarioRepository;

public class UsuarioTest 
{
	public static void main(String[] args) 
	{
		// Creando registro a ocupar para Perfil
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("root-context.xml");
		PerfilRepository perfilRepository = context.getBean("perfilRepository", PerfilRepository.class);
		UsuarioRepository usuarioRepository = context.getBean("usuarioRepository", UsuarioRepository.class);
		
		Perfil perfil = new Perfil();
		perfil.setPerfil("ADMINISTRADOR");
		perfilRepository.save(perfil);
		
		Perfil perfil2 = new Perfil();
		perfil2.setPerfil("USUARIO");
		perfilRepository.save(perfil2);
		
		Set<Perfil> perfilSet = new HashSet<Perfil>();
		perfilSet.add(perfil);
		
		
		// Probando insertar
		System.out.println("Probando insertar Usuario");
		
		Usuario usuario = new Usuario();
		usuario.setNombre("Jorge Gomez");
		usuario.setEmail("gomez@gmail.com");
		usuario.setUsername("jrg96");
		usuario.setPassword("password");
		usuario.setEstatus(1);
		usuario.setFechaRegistro(new Date());
		usuario.setPerfiles(perfilSet);
		
		usuarioRepository.save(usuario);
		
		System.out.println(usuario);
		System.out.println("Terminada prueba insertar Usuario");
		
		// Probando modificar
		System.out.println();
		System.out.println("Probando modificar Usuario");
		
		perfilSet.add(perfil2);
		usuario.setPerfiles(perfilSet);
		usuario.setNombre("Jorge Modificado");
		
		usuarioRepository.save(usuario);
		
		System.out.println(usuario);
		System.out.println("Terminada prueba modificar Usuario");
		
		// Probando seleccionar
		System.out.println();
		System.out.println("Probando seleccionar Usuario");
		
		usuario = usuarioRepository.findById(usuario.getId()).get();
		
		System.out.println(usuario);
		System.out.println("Terminada prueba seleccionar Usuario");
		
		// Probando eliminar
		System.out.println();
		System.out.println("Probando eliminar Usuario");
		
		usuarioRepository.deleteById(usuario.getId());
		
		System.out.println(usuario);
		System.out.println("Terminada prueba eliminar Usuario");
		
		
		// Eliminando residuos de Perfil creado
		System.out.println();
		System.out.println("Eliminando residuos");
		
		perfilRepository.deleteById(perfil.getId());
		perfilRepository.deleteById(perfil2.getId());
		
		System.out.println("Residuos eliminados");
		
	}
}
