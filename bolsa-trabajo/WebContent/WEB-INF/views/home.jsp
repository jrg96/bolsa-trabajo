<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!-- Tags para la libreria JSTL -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- Tag para la libreria de spring y el uso de URL relativa -->
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
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

    <title>EmpleosApp | Aplicaci�n para publicar Ofertas de Trabajo.</title>
    <!-- Bootstrap core CSS -->
    <link href="${urlPublic}/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="${urlPublic}/bootstrap/css/jumbotron.css" rel="stylesheet">
    <link href="${urlPublic}/bootstrap/css/sticky-footer-navbar.css" rel="stylesheet">
  </head>

  <body>

    <jsp:include page="include/header.jsp"></jsp:include>

    <main role="main">

      <!-- Main jumbotron for a primary marketing message or call to action -->
      <div class="jumbotron">
        <div class="container">
        	<!-- INICIO DESPLIEGUE MENSAJES -->
	    	<c:if test="${mensaje != null}">
	    		<div class="alert alert-success" role="alert">
	  				${mensaje}
	  			</div>
	    	</c:if>
	    	<!-- FIN DESPLIEGUE MENSAJES -->
        
          <h3>Encuentra el trabajo que andas buscando.</h3>
          Puedes buscar por descripci�n y categor�a.
          <form class="form-inline">
            <input type="text" class="form-control mb-3" id="exampleFormControlInput1" placeholder="Escriba una b�squeda">&nbsp;
            <select class="custom-select custom-select mb-3">
              <option selected>Seleccione una categor�a</option>
              <option value="1">Ventas</option>
              <option value="2">Contabilidad</option>
              <option value="3">Transporte</option>
              <option value="4">Inform�tica</option>
              <option value="5">Construcci�n</option>
            </select>&nbsp;
            <button type="submit" class="btn btn-primary mb-3">Buscar</button>
          </form>
        </div>
      </div>
      <hr>

      <div class="container"> 
        <h2 class="font-weight-bold text-center text-capitalize">DESTACADOS</h2>
        <hr>
        <div class="row">
          <div class="col-md-3">            
            <img class="rounded mx-auto d-block" src="${urlPublic}/images/logo1.png" alt="Generic placeholder image" width="220" height="220">            
          </div>
          <div class="col-md-9">
            <h2>Arquitecto</h2>
            <h6 class="card-title"><strong>Categor�a: </strong> <span>Arquitectura</span></h6>
            <h6 class="card-title"><strong>Publicado: </strong> <span>2019-01-01 </span></h6>                
            <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
            <p><a class="btn btn-secondary" href="#" role="button">View details &raquo;</a></p>            
          </div>
        </div>  
        <div class="row">
          <div class="col-md-3">            
            <img class="rounded mx-auto d-block" src="${urlPublic}/images/logo2.png" alt="Generic placeholder image" width="220" height="220">            
          </div>
          <div class="col-md-9">
            <h2>Ingeniero Agr�nomo</h2>
            <h6 class="card-title"><strong>Categor�a: </strong> <span>Agronom�a/Agr�cultura</span></h6>
            <h6 class="card-title"><strong>Publicado: </strong> <span>2019-01-05 </span></h6>
            <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
            <p><a class="btn btn-secondary" href="#" role="button">View details &raquo;</a></p>
          </div>
        </div>  
        <div class="row">
          <div class="col-md-3">            
            <img class="rounded mx-auto d-block" src="${urlPublic}/images/logo3.png" alt="Generic placeholder image" width="220" height="220">            
          </div>
          <div class="col-md-9">
            <h2>Ejecutivo de Ventas</h2>
            <h6 class="card-title"><strong>Categor�a: </strong> <span>Ventas</span></h6>
            <h6 class="card-title"><strong>Publicado: </strong> <span>2019-02-07 </span></h6>
            <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
            <p><a class="btn btn-secondary" href="#" role="button">View details &raquo;</a></p>
          </div>
        </div>          
		  <hr>	
      </div> <!-- /container -->

    </main>

    <jsp:include page="include/footer.jsp"></jsp:include>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="${urlPublic}/bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>
