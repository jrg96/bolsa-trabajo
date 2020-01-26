package entitytest;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.empresa.app.model.Perfil;
import com.empresa.app.repository.PerfilRepository;


public class PerfilTest 
{

	public static void main(String[] args) 
	{
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("root-context.xml");
		PerfilRepository perfilRepository = context.getBean("perfilRepository", PerfilRepository.class);
		
		// Probando insert
		System.out.println("Probando insertar perfil");
		
		Perfil perfil = new Perfil();
		perfil.setPerfil("ADMINISTRADOR");
		perfilRepository.save(perfil);
		
		System.out.println(perfil);
		System.out.println("Terminada prueba de insertar perfil");
		
		// Probando Update
		System.out.println();
		System.out.println("Probando modificar perfil");
		
		perfil.setPerfil("ADMINISTRADOR_MOD");
		perfilRepository.save(perfil);
		
		System.out.println(perfil);
		System.out.println("Terminada prueba de modificar perfil");
		
		// Probando Select perfil
		System.out.println();
		System.out.println("Probando seleccionar perfil");
		
		perfil = perfilRepository.findById(perfil.getId()).get();
		
		System.out.println(perfil);
		System.out.println("Terminada prueba de seleccionar perfil");
		
		// Probando Delete perfil
		System.out.println();
		System.out.println("Probando eliminar perfil");
		
		perfilRepository.delete(perfil);
		
		System.out.println(perfil);
		System.out.println("Terminada prueba de eliminar perfil");
	}
}
