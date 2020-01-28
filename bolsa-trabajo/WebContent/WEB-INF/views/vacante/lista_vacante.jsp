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

    <title>EmpleosApp | Listado de Ofertas de Trabajo</title>
    <!-- Bootstrap core CSS -->
    <link href="${urlPublic}/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="${urlPublic}/bootstrap/css/jumbotron.css" rel="stylesheet">
    <link href="${urlPublic}/bootstrap/css/sticky-footer-navbar.css" rel="stylesheet">
    <link href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" rel="stylesheet">
  </head>

  <body>
    <jsp:include page="../include/header.jsp"></jsp:include>  

    <main role="main">     
      <hr>
      <div class="container"> 
      	<!-- INICIO DESPLIEGUE MENSAJES -->
		<c:if test="${mensaje != null}">
			<div class="alert alert-success" role="alert">
				${mensaje}
			</div>
		</c:if>
		<!-- FIN DESPLIEGUE MENSAJES -->

        <div class="card">
          <h4 class="card-header"><strong>Listado de Ofertas de Trabajo</strong></h4>              
          <div class="card-body">
            <a class="btn btn-primary" href="${urlRoot}vacantes/create" title="Crear nueva Oferta de Trabajo" role="button"><i class="fas fa-file" aria-hidden="true"></i> Nueva</a>            
            <hr>
            <table class="table table-hover">
              <thead class="thead-light">
                <tr>
                  <th scope="col">Categoría</th>
                  <th scope="col">Nombre</th>                  
                  <th scope="col">Fecha Pub.</th>
                  <th scope="col">Estatus</th>
                  <th scope="col">Destacada</th>
                  <th scope="col">Operaciones</th>
                </tr>
              </thead>
              <tbody>
              	<c:forEach var="vacante" items="${lista_vacantes}">
	                <tr>
	                  <td>${vacante.categoria.nombre}</td>
	                  <td>${vacante.nombre}</td>                  
	                  <td>
	                  	<fmt:formatDate value="${vacante.fecha}" pattern="dd-MM-YYYY"/>
	                  </td>
	                  <td>${vacante.estatus}</td>
	                  <td>
	                  	<c:choose>
	                  		<c:when test="${vacante.destacado eq 1}">
	                  			SI
	                  		</c:when>
	                  		<c:otherwise>
	                  			NO
	                  		</c:otherwise>
	                  	</c:choose>
	                  </td>
	                  <td>
	                    <a href="#" class="btn btn-success btn-sm" role="button" title="Editar el registro."><i class="fas fa-pencil-alt" aria-hidden="true"></i></a>
	                    <a href="#" onclick="return confirm('¿Estas seguro?')" class="btn btn-success btn-sm" role="button" title="Eliminar el registro."><i class="fas fa-trash" aria-hidden="true"></i></a>
	                  </td>
	                </tr>
                </c:forEach>
                               
              </tbody>
            </table>
            
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