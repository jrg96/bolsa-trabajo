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

    <title>EmpleosApp | Listado de Categor�as</title>
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

        <div class="card">
          <h4 class="card-header"><strong>Listado de Categor�as</strong></h4>              
          <div class="card-body">
            <a class="btn btn-primary" href="${urlRoot}categorias/create" role="button"><i class="fas fa-file" aria-hidden="true"></i> Nueva</a>            
            <hr>
            <table class="table table-hover">
              <thead class="thead-light">
                <tr>
                  <th scope="col">Id</th>
                  <th scope="col">Nombre</th>
                  <th scope="col">Descripci�n</th>
                  <th scope="col">Operaciones</th>
                </tr>
              </thead>
              <tbody>
              	<c:forEach var="categoria" items="${lista_categorias}">
	              	<tr>
	                  <th scope="row">${categoria.id}</th>
	                  <td>${categoria.nombre}</td>
	                  <td>${categoria.descripcion}</td>
	                  <td>
	                    <a href="#" class="btn btn-success btn-sm" role="button" title="Editar"><i class="fas fa-pencil-alt" aria-hidden="true"></i></a>
	                    <a href="#" onclick="return confirm('�Estas seguro?')" class="btn btn-success btn-sm" role="button" title="Eliminar"><i class="fas fa-trash" aria-hidden="true"></i></a>
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