package entitytest;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.empresa.app.model.Categoria;
import com.empresa.app.repository.CategoriaRepository;

public class CategoriaTest 
{

	public static void main(String[] args) 
	{
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("root-context.xml");
		CategoriaRepository categoriaRepository = context.getBean("categoriaRepository", CategoriaRepository.class);
		
		// Probando insertar categoria
		System.out.println("Probando insertar categoria");
		
		Categoria categoria = new Categoria();
		categoria.setNombre("Categoria 1");
		categoria.setDescripcion("Descripcion categoria 1");
		
		categoriaRepository.save(categoria);
		
		System.out.println(categoria);
		System.out.println("Terminada prueba insertar categoria");
		
		// Probando modificar categoria
		System.out.println();
		System.out.println("Probando modificar categoria");
		
		categoria.setDescripcion("Descripcion modificada");
		
		categoriaRepository.save(categoria);
		
		System.out.println(categoria);
		System.out.println("Terminada prueba modificar categoria");
		
		// Probando seleccionar categoria
		System.out.println();
		System.out.println("Probando seleccionar categoria");
		
		categoria = categoriaRepository.findById(categoria.getId()).get();
		
		System.out.println(categoria);
		System.out.println("Terminada prueba seleccionar categoria");
		
		// Probando eliminar categoria
		System.out.println();
		System.out.println("Probando eliminar categoria");
		
		categoriaRepository.deleteById(categoria.getId());
		
		System.out.println(categoria);
		System.out.println("Terminada prueba eliminar categoria");
	}

}
