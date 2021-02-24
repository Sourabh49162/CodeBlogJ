<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/custom-style.css">
<title>Sorry ! Something Went Wrong</title>
</head>
<body>

	<%@ include file = "navbar.jsp" %>
	<div class="container text-center">
	<img src="img/error.png" class="img-fluid" >
	<h1 class="display-3 mb-3">Sorry ! Something Went Wrong</h1>
	<%= exception %>
	<br />
	<a href="index.jsp" class="btn my-3 primary-background text-white btn-lg">Home</a>
	</div>
</body>
</html>