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
    <title>Success!</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container mt-5">
   		<div class="d-flex">
			<div class="flex-grow-1">
		   		<h1>Welcome, ${userName}</h1>
		   		<h5>Books from everyones shelves...</h5>
			
			</div>
			<div class="d-flex  justify-content-end">
		   		<a href="/logout" class="btn btn-secondary me-3">Logout</a>
		   		<a href="/book/new" class="btn btn-primary ">Add to my Shelf</a>				
			</div>   		
   		</div>
   		<div>
	   		<table class="table table-primary table-striped mt-5">
				<thead>
				    <tr>				      
				      <th class="col-1">ID</th>
				      <th class="col-4">Title</th>
				      <th class="col-3">Author Name</th>   
				      <th class="col-2">Posted By</th>   
					</tr>
				</thead>
				<tbody>
				  	<c:forEach var="book" items="${books}">			<!-- LOOP -->
					<tr>
	   					<td><c:out value="${book.id}"/></td>
	   					<td><a href="/show/${book.id}"><c:out value="${book.title}"/></a></td>
	   					<td><c:out value="${book.author}"/></td>			    					  					
	   					<td><c:out value="${book.user.userName}"/></td>			    					  					
				  	</tr>
					</c:forEach>								<!-- END LOOP -->
				</tbody>
			</table> 
   		</div>
   		
   		
	</div>
</body>
