<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="css/custom-style.css">
<title>Register</title>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<%
	if(user1 != null){
		response.sendRedirect("profile.jsp");
	}
	%>

	<main
		class="d-flex align-items-center primary-background banner-background" style="padding-bottom : 80px;"
		style="height: 70vh">
		<div class="container">
			<div class="row">
				<div class="col-md-6 offset-md-3">
					<div class="card">
						<div class="card-header primary-background text-white text-center">
							<span class="fa fa fa-user-plus fa-3x"></span> <br />
							<p>Sign Up</p>
						</div>
						<div class="card-body">
							<form action="Register" method="POST" id="reg_form">
								<div class="form-group">
									<label for="usernmae">Name</label> <input
										type="text" class="form-control" id="usernmae" name="username"
										aria-describedby="emailHelp" placeholder="Enter Username">
								</div>
								<div class="form-group">
									<label for="email">Email address</label> <input
										type="email" class="form-control" id="email" name="email"
										aria-describedby="emailHelp" placeholder="Enter email">
									<small id="emailHelp" class="form-text text-muted">We'll
										never share your email with anyone else.</small>
								</div>
								<div class="form-group">
									<label for="password">Password</label> <input
										type="password" class="form-control" name="password"
										id="password" placeholder="Password">
								</div>
								<div class="form-group">
									<label for="gender">Gender</label>
									<br>
									<input type="radio"
										id="male" name="gender" value="male">Male
									<input type="radio"
										id="female" name="gender" value="female">Female
								</div>
								<div class="form-check">
									<input type="checkbox" class="form-check-input" name="termsAndCond"
										id="exampleCheck1"> <label class="form-check-label"
										for="exampleCheck1">Agree Terms and Conditions</label>
								</div>
								
								<br />
								<button id="btnSubmit" type="submit" class="btn btn-primary">Submit</button>
							</form>
							<div class="container text-center" id="loader" style="display: none">
									<span class="fa fa-refresh fa-spin fa-4x">
									</span>
									<h4>Please Wait...</h4>
								</div>
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
	<script>
		$(document).ready(function(){
			$("#reg_form").on("submit", function(e){
				e.preventDefault();
				let form = new FormData(this);
				$("#reg_form").hide();
				$("#loader").show();
				$.ajax({
					url : "Register",
					type : "POST",
					data : form,
					success : function(data, textStatus, jqXHR){
						$("#reg_form").show();
						$("#loader").hide();
						if(data.trim() === "Registration Successful") {
							swal(data, " We are redirecting you to Login Page...", "success")
							.then((value) => {
								  window.location = "login.jsp";
							});
						} else if(data.trim() === "Something Went Wrong! Please try after sometime..."){
							swal("Sorry!", data, "error")
						} else {
							swal("Sorry!", data, "warning")
						} 
					}, error : function(jqXHR, textStatus, errorThrown){
						console.log("ERROR");
						$("#reg_form").show();
						$("#loader").hide();
						swal("Sorry!", "Something Went Wrong! Please try Again...", "error")
						
					}, processData : false,
						contentType : false
				});
				
			});
		});
	</script>
</body>
</html>