<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>add a book</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container mt-5">
   		<div class="d-flex">
			<div class="flex-grow-1">
		   		<h1>Add a Book to Your Shelf!</h1>			
			</div>
			<div class="d-flex  justify-content-end">
		   		<a href="/dashboard" class="btn btn-secondary me-3">Back to the shelves</a>
			</div>   		
   		</div>
   		<div>	   		
   			<form:form class="form-control" action="/book/new" method="post" modelAttribute="newBook">       	  		
		
		  		<form:input type="hidden" value="${user_id}" path="user"/>		  		
		
		  		<form:label path="title" class="form-label">Title:</form:label>
		  		<form:errors path="title" class="text-danger"/>
		    	<form:input path="title" class="form-control"/>	    
		  		
		  		<form:label path="author" class="form-label">Author:</form:label>
		  		<form:errors path="author" class="text-danger"/>
		    	<form:input path="author" class="form-control"/>	   
		
				<form:label path="thoughts" class="form-label">My Thoughts:</form:label>
				<form:errors path="thoughts" class="text-danger"/>					
		    	<form:textarea path="thoughts" class="form-control"/>	    
		    	   	
		  		<button type="submit" class="btn btn-primary mt-2">Submit</button>
			  
        	</form:form>	   			   		
   		</div>   		   		
	</div>
</body>
</html>