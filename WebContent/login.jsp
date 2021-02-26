<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.codeblog.entities.Message"%>
<%@ page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/custom-style.css">
<title>Login</title>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<%
	if(user1 != null){
		response.sendRedirect("profile.jsp");
	}
	%>

	<main
		class="d-flex align-items-center primary-background banner-background"
		style="height: 70vh">
		<div class="container">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card">
						<div class="card-header primary-background text-white text-center">
							<span class="fa fa-user-circle fa-3x"></span> <br />
							<p>Login here</p>
						</div>
						<%
						Message msg = (Message) session.getAttribute("msg");
						if (msg != null) {
						%>
						<div class="alert <%= msg.getMessageClass() %> alert-dismissible fade show"
							role="alert">
							<strong><%= msg.getMessage() %></strong> 
							<button type="button" class="close" data-dismiss="alert"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<%
						session.removeAttribute("msg");
						}
						%>
						<div class="card-body">
							<form action="Login" method="post">
								<div class="form-group">
									<label for="email">Email address</label> <input type="email"
										class="form-control" id="email" name="email"
										aria-describedby="emailHelp" placeholder="Enter email">
									<small id="emailHelp" class="form-text text-muted">We'll
										never share your email with anyone else.</small>
								</div>
								<div class="form-group">
									<label for="password">Password</label> <input type="password"
										class="form-control" id="password" name="password"
										placeholder="Password">
								</div>
								<!-- <div class="form-check">
									<input type="checkbox" class="form-check-input"
										id="exampleCheck1"> <label class="form-check-label"
										for="exampleCheck1">Remember me</label>
								</div> -->
								<br />
								<button type="submit" class="btn btn-primary">Submit</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>

	<script src="js/jquery.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/custom-script.js"></script>
</body>
</html>