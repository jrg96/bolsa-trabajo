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

    <title>EmpleosApp | Creación de Categorías</title>
    <!-- Bootstrap core CSS -->
    <link href="${urlPublic}/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="${urlPublic}/bootstrap/css/jumbotron.css" rel="stylesheet">
    <link href="${urlPublic}/bootstrap/css/sticky-footer-navbar.css" rel="stylesheet">
  </head>

  <body>

    <jsp:include page="../include/header.jsp"></jsp:include>

    <main role="main">     
      <hr>
      <div class="container"> 
      	  <!-- INICIO DESPLIEGUE DE ERRORES BINDING -->
	      <spring:hasBindErrors name="categoria">
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
          <h4 class="card-header"><strong>Datos de la categoría</strong></h4>              
          <div class="card-body">
            <form:form modelAttribute="categoria" action="${urlRoot}categorias/save" method="POST">              
              <form:hidden path="id" />
              
              <div class="row">
                <div class="col-md-6"> 
                  <div class="form-group">
                    <label for="nombre">Nombre</label>
                    <form:input type="text" path="nombre" id="nombre" class="form-control" placeholder="Escriba el nombre de la categoria" required="required" />
                  </div>
                </div>                
              </div> 
              <div class="row">
                <div class="col-md-6"> 
                  <div class="form-group">
                    <label for="descripcion">Descripción</label>
                    <form:textarea path="descripcion" id="descripcion" class="form-control" rows="2"></form:textarea>
                  </div> 
                </div>                
              </div> 
              <hr>
              <button type="submit" title="Guardar el registro." class="btn btn-primary">Guardar</button>  
            </form:form>
          </div>
        </div>
      </div> <!-- /container -->

    </main>

    <jsp:include page="../include/footer.jsp"></jsp:include>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="${urlPublic}/bootstrap/js/bootstrap.min.js"></script>     
  </body>
</html>
