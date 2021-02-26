<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="com.codeblog.entities.User"%>
<%@ page import="com.codeblog.entities.Message"%>
<%@ page import="com.codeblog.helpers.ConnectionProvider"%>
<%@ page import="com.codeblog.entities.Category"%>
<%@ page import="com.codeblog.daos.PostDao"%>
<%@ page errorPage="error.jsp"%>
<%@ include file="admin-navbar.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/custom-style.css">
<title>Profile</title>
</head>
<body>

	
	<main>
		<div class="container">
			<div class="row mt-4">
				<div class="col-md-4">
					<div class="list-group">
						<a href="#" onClick="getAllPosts(0, this)" class="c-link list-group-item list-group-item-action active">
							All Posts </a>
						<%
						for (Category c : list) {
						%>
						<a href="#" onClick="getAllPosts(<%= c.getId() %>, this)" class="c-link list-group-item list-group-item-action"><%=c.getName()%></a>
						<%
						}
						%>
					</div>
				</div>
				<div class="col-md-8">
					<div class="container text-center" id="loader">
						<i class="fa fa-refresh fa-4x fa-spin"></i>
						<h3 class="mt-2">Loading...</h3>
					</div>
					<div class="container-fluid" id="post-container"></div>
				</div>
			</div>
		</div>
	</main>

	

	<script src="js/jquery.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="js/custom-script.js"></script>
	<script>
		$(document).ready(function() {
			let allPostRef = $(".c-link")[0];
			getAllPosts(0, allPostRef);
									
				});
		
		function getAllPosts(catId, temp){
			$("#post-container").hide();
			$("#loader").show();
			$(".c-link").removeClass("active");
			$.ajax({
				url : "load_posts.jsp",
				data : {catId : catId},
				success : function(data, textStatus, jqXHR){
					$("#loader").hide();
					$("#post-container").show();
					$(temp).addClass("active");
					$("#post-container").html(data);
				}
			});
		}
		
	</script>
</body>
</html>