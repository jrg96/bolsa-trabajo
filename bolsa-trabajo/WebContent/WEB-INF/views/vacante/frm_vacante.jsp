<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!-- Tags para la libreria JSTL -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- Tag para la libreria de spring y el uso de URL relativa -->
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<spring:url value="/resources" var="urlPublic" />
<spring:url value="/" var="urlRoot" />

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="favicon.ico">

    <title>EmpleosApp | Creación de Ofertas de Trabajo</title>
    <!-- Bootstrap core CSS -->
    <link href="${urlPublic}/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="${urlPublic}/bootstrap/css/jumbotron.css" rel="stylesheet">
    <link href="${urlPublic}/bootstrap/css/sticky-footer-navbar.css" rel="stylesheet">
    <link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" >
  </head>

  <body>

    <jsp:include page="../include/header.jsp"></jsp:include>

    <main role="main">     
      <hr>
      <div class="container"> 
      	<!-- INICIO DESPLIEGUE DE ERRORES BINDING -->
	      <spring:hasBindErrors name="vacante">
	          <div class="alert alert-danger" role="alert">
	      	      Por favor corrija los siguientes errores:
	      	      <ul>
	      	      	  <c:forEach var="error" items="${errors.allErrors}">
	      	      	      <li><spring:message message="${error}" /></li>
	      	      	  </c:forEach>
	      	      </ul>
	      	  </div>
	      </spring:hasBindErrors>
	      <!-- FIN DESPLIEGUE DE ERRORES BINDING -->

        <div class="card">
          <h4 class="card-header"><strong>Datos de la oferta de trabajo</strong></h4>              
          <div class="card-body">
            <form:form modelAttribute="vacante" action="${urlRoot}vacantes/save" method="POST" enctype="multipart/form-data">              
              <div class="row">
                <div class="col-md-3"> 
                  <div class="form-group">
                    <label for="nombre">Nombre</label>
                    <form:input type="text" path="nombre" id="nombre" class="form-control" placeholder="Titulo de la oferta de trabajo" required="required" />
                  </div>
                </div>
                <div class="col-md-9"> 
                  <div class="form-group">
                    <label for="descripcion">Descripción</label>
                    <form:input type="text" path="descripcion" id="descripcion" class="form-control" placeholder="Breve descripcion de la oferta de trabajo" required="required" />
                  </div> 
                </div>    
              </div>    
              <div class="row">
                <div class="col-md-3"> 
                  <div class="form-group">
                    <label for="categoria">Categoría</label>
                    <form:select path="categoria.id" id="categoria" class="form-control" items="${lista_categorias}" itemLabel="nombre" itemValue="id" />
                  </div>
                </div>

                <div class="col-md-3"> 
                  <div class="form-group">
                    <label for="estatus">Estatus</label>
                    <form:select path="estatus" id="estatus" class="form-control" items="${lista_estados}" />
                  </div>
                </div>
                <div class="col-md-3"> 
                  <div class="form-group">
                    <label for="fecha">Fecha de Publicación</label>
                    <form:input type="text" path="fecha" id="fecha" class="form-control" placeholder="Fecha de publicacion" required="required" />
                  </div>  
                </div>
                <div class="col-md-3"> 
                  <div class="form-check">
                    <label class="form-check-label" for="destacado0"></label><br>
                    <form:radiobutton path="destacado" id="destacado" class="form-check-input" value="1" checked="checked" />
                    <label class="form-check-label" for="destacado1">Destacado</label>
                  </div>
                  <div class="form-check">
                    <form:radiobutton path="destacado" id="destacado" class="form-check-input" value="0" />
                    <label class="form-check-label" for="destacado2">No Destacado</label>
                  </div>
                </div>
              </div>    
              <div class="row">
                <div class="col-md-3"> 
                  <div class="form-group">
                    <label for="salario">Salario Ofrecido (Aprox)</label>
                    <form:input path="salario" id="salario" type="text" class="form-control" placeholder="Salario aproximado." required="required" />
                  </div>
                </div>
                <div class="col-md-3"> 
                  <div class="form-group">
                    <label for="archivoImagen">Imagen</label>
                    <input type="file" class="form-control-file" name="archivoImagen" id="archivoImagen">
                  </div>
                </div>
              </div> 
              <hr>
              <div class="row">
                <div class="col-md-9"> 
                  <div class="form-group">
                    <label for="detalles"><strong>Detalles</strong></label>          
                    <form:textarea path="detalles" id="detalles" class="form-control" rows="7"></form:textarea>
                  </div> 
                </div> 
                <div class="col-md-3">
                  <label for="imagen">Imagen/Logo</label>
                  <img class="rounded mx-auto d-block" src="${urlPublic}/images/construccion-logo.png" alt="Generic placeholder image" width="200" height="200">            
                </div>
              </div> 
              <button type="submit" class="btn btn-primary">Guardar</button>  
            </form:form>
          </div>
        </div>
      </div> <!-- /container -->

    </main>

    <jsp:include page="../include/footer.jsp"></jsp:include>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> 
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="${urlPublic}/bootstrap/js/bootstrap.min.js"></script>    
    <script src="${urlPublic}/tinymce/tinymce.min.js"></script>
    <script>
      
      $(function () {
          $("#fecha").datepicker({dateFormat: 'dd-mm-yy'});
        }
      );
      
      /*
      tinymce.init({
          selector: '#detalles',
          plugins: "textcolor, table lists code",
          toolbar: " undo redo | bold italic | alignleft aligncenter alignright alignjustify \n\
                    | bullist numlist outdent indent | forecolor backcolor table code"
      });
      
      */
      
    </script>
  </body>
</html>