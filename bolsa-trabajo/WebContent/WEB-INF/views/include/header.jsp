<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<spring:url value="/" var="urlRoot" />

    <header>
      <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
        <a class="navbar-brand" href="#">EmpleosApp</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarsExampleDefault">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item">
              <a class="nav-link active" href="${urlRoot}">Inicio</a>
            </li>
            
            <sec:authorize access="hasAnyAuthority('ROLE_USUARIO')" >
	            <li class="nav-item">
	              <a class="nav-link" href="${urlRoot}user/logout">Cerrar sesión</a>
	            </li>
            </sec:authorize>          
          </ul>
          
          <sec:authorize access="isAnonymous()">  
          	<a class="btn btn-primary" href="${urlRoot}user/login">Ingresar</a>&nbsp;
          	<a class="btn btn-primary" href="${urlRoot}registro/create">Registrarse</a>
          </sec:authorize>
        </div>
      </nav>
    </header>