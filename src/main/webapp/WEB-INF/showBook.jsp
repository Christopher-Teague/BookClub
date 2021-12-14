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
    <title> ${book.title} </title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container mt-5">
	<div class="d-flex justify-content-between">
		<h1>${book.title}</h1>
		<a href="/dashboard" class="btn btn-secondary me-3">Back to the shelves</a>
	</div>
	
		<c:choose>
			<c:when test="${book.user.id == user_id}">
				<h3 class="mt-5">You read <span style="color:RebeccaPurple">${book.title}</span> by <span style="color:green">${book.author}</span>.</h3>
				<h4 class="mt-3">Here are your thoughts:</h4>
				<div class="border-top border-bottom p-3 mt-5">
					<h5 >${book.thoughts}</h5>
				</div>
			</c:when>
			<c:otherwise>
				<h3 class="mt-5"><span style="color:red">${userName}</span> read <span style="color:RebeccaPurple">${book.title}</span> by <span style="color:green">${book.author}</span>.</h3>
				<h4 class="mt-3">Here are ${userName}'s thoughts:</h4>
				<div class="border-top border-bottom p-3 mt-5">
					<h5 >${book.thoughts}</h5>
				</div>
			</c:otherwise>
		</c:choose>
		<div class="mt-5">
		<c:choose>
			<c:when test="${book.user.id == user_id}">
				<a href="/edit/${book.id}" class="btn btn-secondary btn-sm">edit</a>
			</c:when>
		</c:choose>	
		</div>
	</div>
</body>
</html>