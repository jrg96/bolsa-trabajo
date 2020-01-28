package com.empresa.app.util;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public class Utileria 
{
	public static String guardarImagen(MultipartFile multiPart, HttpServletRequest request)
	{
		// Paso 1: obtener el nombre original del archivo
		String nombreOriginal = multiPart.getOriginalFilename();
		nombreOriginal = Utileria.randomAlphanumeric(15) + nombreOriginal.replace(" ", "_");
		
		// Paso 2: obtener la ruta absoluta a donde guardar las imagenes
		// apache-tomcat/webapps/cartelerav1/resources/images/uploads
		String rutaFinal = request.getServletContext().getRealPath("/resources/uploadimg/");
		
		// Paso 3: intentamos mover el archivo desde la carpeta tmp a su destino final
		try 
		{
			System.out.println("Creando archivo");
			File imageFile = new File(rutaFinal + nombreOriginal);
			
			System.out.println("Empezando a transferir");
			multiPart.transferTo(imageFile);
			
			return nombreOriginal;
		}
		catch(Exception e)
		{
			System.out.println("Error al subir archivo: " + e.getMessage());
		}
		
		return null;
	}
	
	public static String randomAlphanumeric(int count)
	{
		String caracteres = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		StringBuilder builder = new StringBuilder();
		
		while (count-- != 0)
		{
			int pos = (int) (Math.random() * caracteres.length());
			builder.append(caracteres.charAt(pos));
		}
		
		return builder.toString();
	}
}
