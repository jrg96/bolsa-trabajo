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

    <title>EmpleosApp | Ingresar al Sistema</title>
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
      	<c:if test="${param.error!= null}">
			<img src="${urlPublic}/images/error.png" width="48" height="48" class="center">
			<h4 class="form-signin-heading" style="color:red">Acceso denegado</h4>
		</c:if>

        <div class="card">
          <div class="card-body">
            <form class="form-signin" action="${urlRoot}login" method="post">
              <div class="row">
                <div class="col-md-4"> 
                </div>  
                <div class="col-md-4"> 
                  <img class="mb-4 rounded mx-auto d-block" src="${urlPublic}/images/lock.png" alt="" width="128" height="128">
                  <h4 class="h3 mb-3 font-weight-normal">Ingresar</h4>
                  <label for="username" class="sr-only">Username</label>
                  <input type="text" name="username" id="username" class="form-control" placeholder="Username" required autofocus><br>
                  <label for="password" class="sr-only">Password</label>
                  <input type="password" name="password" id="password" class="form-control" placeholder="Password" required><br>
                  
                  <input type="hidden"name="${_csrf.parameterName}" value="${_csrf.token}"/>
                  
                  <button class="btn btn-lg btn-primary btn-block" type="submit">Entrar</button>
                  <p class="text-primary" style="font-size: small">¿Todavía no estas registrado? <a>Regístrate</a></p>
                </div>
                <div class="col-md-4"> 
                </div>
              </div>   
            </form>
          </div>
        </div>
      </div> <!-- /container -->

    </main>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="${urlPublic}/bootstrap/js/bootstrap.min.js"></script>     
  </body>
</html>
