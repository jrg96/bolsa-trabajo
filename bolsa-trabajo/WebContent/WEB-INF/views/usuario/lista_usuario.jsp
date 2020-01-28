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

    <title>EmpleosApp | Listado de Usuarios</title>
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
          <h4 class="card-header"><strong>Listado de Usuarios</strong></h4>              
          <div class="card-body">            
            <hr>
            <table class="table table-hover">
              <thead class="thead-light">
                <tr>
                  <th scope="col">Nombre</th>
                  <th scope="col">Username</th>                  
                  <th scope="col">Email</th>
                  <th scope="col">Estatus</th>
                  <th scope="col">Operaciones</th>
                </tr>
              </thead>
              <tbody>
              	<c:forEach var="usuario" items="${lista_usuarios}">
	                <tr>
	                  <td>${usuario.nombre}</td>
	                  <td>${usuario.username}</td>                  
	                  <td>${usuario.email}</td>
	                  <td>
	                  	<c:choose>
	                  		<c:when test="${usuario.estatus eq 1}">
	                  			Activo
	                  		</c:when>
	                  		<c:otherwise>
	                  			Inactivo
	                  		</c:otherwise>
	                  	</c:choose>
	                  </td>
	                  <td>
	                    <a href="${urlRoot}users/delete/${usuario.id}" onclick="return confirm('¿Estas seguro?')" class="btn btn-success btn-sm" role="button" title="Eliminar el registro."><i class="fas fa-trash" aria-hidden="true"></i></a>
	                    <a href="${urlRoot}users/state/${usuario.id}/0" onclick="return confirm('¿Quiere bloquear el acceso al usuario?')" class="btn btn-success btn-sm" role="button" title="Bloquear el acceso al sistema para este usuario."><i class="fas fa-lock" aria-hidden="true"></i></a>	
	                    <a href="${urlRoot}users/state/${usuario.id}/1" onclick="return confirm('¿Desea desbloquear el usuario?')" class="btn btn-success btn-sm" role="button" title="Permitir el acceso al sistema a este usuario."><i class="fas fa-unlock" aria-hidden="true"></i></a>
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
