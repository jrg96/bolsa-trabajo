package entitytest;

import java.util.Date;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.empresa.app.model.Categoria;
import com.empresa.app.model.Vacante;
import com.empresa.app.repository.CategoriaRepository;
import com.empresa.app.repository.VacanteRepository;

public class VacanteTest {

	public static void main(String[] args) 
	{
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("root-context.xml");
		CategoriaRepository categoriaRepository = context.getBean("categoriaRepository", CategoriaRepository.class);
		VacanteRepository vacanteRepository = context.getBean("vacanteRepository", VacanteRepository.class);
		
		
		// Agregando data de prueba
		Categoria categoria = new Categoria();
		categoria.setNombre("Categoria 1");
		categoria.setDescripcion("Descripcion categoria 1");
		
		categoriaRepository.save(categoria);
		
		// Probando insertar vacante
		System.out.println();
		System.out.println("Probando insertar Vacante");
		
		Vacante vacante = new Vacante();
		vacante.setNombre("Programador Analista PL SQL");
		vacante.setDescripcion("Se necesita un desarrollador PL SQL con experiencia 3 años");
		vacante.setFecha(new Date());
		vacante.setSalario(500.00);
		vacante.setEstatus("Creada");
		vacante.setDestacado(0);
		vacante.setImagen("archivo");
		vacante.setDetalles("Detalle de vacante");
		vacante.setCategoria(categoria);
		
		vacanteRepository.save(vacante);
		
		System.out.println(vacante);
		System.out.println("Terminada prueba insertar Vacante");
		
		// Prueba modificar vacante
		System.out.println();
		System.out.println("Probando modificar Vacante");
		
		vacante.setNombre("Vacante MODIFICADA");
		
		vacanteRepository.save(vacante);
		
		System.out.println(vacante);
		System.out.println("Terminada prueba de modificar Vacante");
		
		
		// Prueba seleccionar vacante
		System.out.println();
		System.out.println("Probando seleccionar Vacante");
		
		vacante = vacanteRepository.findById(vacante.getId()).get();
		
		System.out.println(vacante);
		System.out.println("Terminada prueba de seleccionar Vacante");
		
		// Prueba eliminar vacante
		System.out.println();
		System.out.println("Probando eliminar Vacante");
		
		vacanteRepository.deleteById(vacante.getId());
		
		System.out.println(vacante);
		System.out.println("Terminada prueba de eliminar Vacante");
		
		// Eliminando residuos
		categoriaRepository.deleteById(categoria.getId());
	}

}
