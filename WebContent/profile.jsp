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
<%
User user = (User) session.getAttribute("currentUser");
if (user == null) {
	response.sendRedirect("login.jsp");
}
%>

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

	<nav class="navbar navbar-expand-lg navbar-dark primary-background">
		<a class="navbar-brand" href="index.jsp"><span class="fa fa-spin"><b>C</b></span>ode<span
			class="fa fa-spin"><b>B</b></span>log</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#"><span
						class="fa fa-home"></span>Home <span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Categories </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Java Programming</a> <a
							class="dropdown-item" href="#">Python Programming</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Data Structure</a>
					</div></li>
				<li class="nav-item"><a class="nav-link" href="#"><span
						class="fa fa-phone"></span>Contact</a></li>
				<li class="nav-item"><a class="nav-link" href="#"
					data-toggle="modal" data-target="#add-post"><span
						class="fa fa-phone"></span>Add Post</a></li>
			</ul>
			<ul class="navbar-nav mr-right">
				<li class="nav-item"><a class="nav-link" href="#"
					data-toggle="modal" data-target="#profile_modal"><span
						class="fa fa-user-circle"></span><%=user.getName()%></a></li>
				<li class="nav-item"><a class="nav-link" href="Logout"><span
						class="fa fa-user-plus"></span>Logout</a></li>
			</ul>
		</div>
	</nav>


	<div class="modal fade" id="add-post" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header primary-background text-white">
					<h5 class="modal-title" id="exampleModalLabel">Post Details</h5>
					<button type="button" id="close-modal" class="close"
						data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="add-post-form">
						<div class="form-group">
							<select class="form-control" name="cat_id">
								<option selected disabled>---Select Category---</option>
								<%
								Connection con = ConnectionProvider.getConnection();
								PostDao postDao = new PostDao(con);
								ArrayList<Category> list = postDao.getAllCategories();
								for (Category c : list) {
								%>
								<option value="<%=c.getId()%>"><%=c.getName()%></option>
								<%
								}
								%>
							</select>
						</div>
						<div class="form-group">
							<input type="text" name="title" class="form-control"
								placeholder="Enter Post title" />
						</div>
						<div class="form-group">
							<textarea name="content" rows="5" class="form-control"
								placeholder="Enter Post Content"></textarea>
						</div>
						<div class="form-group">
							<textarea name="code" rows="5" class="form-control"
								placeholder="Enter Post Code"></textarea>
						</div>
						<div class="form-group">
							<label for="image">Select category image</label> <input
								type="file" name="image" id="image" class="form-control" />
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" id="add-post-btn" class="btn btn-primary">Add
						Post</button>
				</div>
			</div>
		</div>
	</div>


	<%
	Message msg = (Message) session.getAttribute("msg");
	if (msg != null) {
	%>
	<div
		class="alert <%=msg.getMessageClass()%> alert-dismissible fade show"
		role="alert">
		<strong><%=msg.getMessage()%></strong>
		<button type="button" class="close" data-dismiss="alert"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>
	<%
	session.removeAttribute("msg");
	}
	%>
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

	<!-- Modal -->
	<div class="modal fade" id="profile_modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header primary-background text-white">
					<h5 class="modal-title" id="exampleModalLabel">CodeBlog</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container text-center mb-3">
						<img alt="Profile Picture"
							src="img/profiles/<%=user.getProfileImg()%>" class="img-fluid"
							style="border-radius: 50%; max-width: 150px;">
					</div>
					<div class="container" id="profile_details">
						<table class="table">
							<tbody>
								<tr>
									<th scope="row">Name :</th>
									<td><%=user.getName()%></td>
								</tr>
								<tr>
									<th scope="row">Email :</th>
									<td><%=user.getEmail()%></td>
								</tr>
								<tr>
									<th scope="row">Gender :</th>
									<td><%=user.getGender().toUpperCase()%></td>
								</tr>
								<tr>
									<th scope="row">Registration Date :</th>
									<td><%=user.getCreated_date().toString()%></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="container" id="profile_edit" style="display: none;">
						<form id="update_form">
							<table class="table">
								<tbody>
									<tr>
										<th scope="row">Name :</th>
										<td><input type="text" name="user_name"
											class="form-control" value="<%=user.getName()%>" /></td>
									</tr>
									<tr>
										<th scope="row">Email :</th>
										<td><input type="email" name="user_email"
											class="form-control" value="<%=user.getEmail()%>" /></td>
									</tr>
									<tr>
										<th scope="row">Gender :</th>
										<td><%=user.getGender().toUpperCase()%></td>
									</tr>
									<tr>
										<th scope="row">Registration Date :</th>
										<td><%=user.getCreated_date().toString()%></td>
									</tr>
									<tr>
										<th scope="row">New Profile :</th>
										<td><input type="file" name="user_profile"
											class="form-control" value="<%=user.getProfileImg()%>" /></td>
									</tr>
								</tbody>
							</table>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<button type="button" id="editBtn" class="btn btn-primary">Edit</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="js/jquery.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="js/custom-script.js"></script>
	<script>
		$(document).ready(
				function() {
					let flag = false;
					$("#editBtn").click(function() {
						if (flag === false) {
							$("#profile_details").hide();
							$("#profile_edit").show();
							$(this).text("Update");
							$(this).removeClass("btn-primary");
							$(this).addClass("btn-warning");
							flag = true;
						} else {
							$("#profile_details").show();
							$("#profile_edit").hide();
							update();
							$(this).text("Edit");
							$(this).removeClass("btn-warning");
							$(this).addClass("btn-primary");
							flag = false;
						}
					});

					function update() {
						let form = new FormData(document
								.getElementById("update_form"));
						$.ajax({
							url : "Update",
							type : "POST",
							data : form,
							success : function(data, textStatus, jqXHR) {
								console.log("SUCCESS")
								/* $("#reg_form").show();
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
								} */
								window.location = "profile.jsp";
							},
							error : function(jqXHR, textStatus, errorThrown) {
								console.log("ERROR");
								/* $("#reg_form").show();
								$("#loader").hide();
								swal("Sorry!", "Something Went Wrong! Please try Again...", "error")
								 */
							},
							processData : false,
							contentType : false
						});
					}
					
					$("#add-post-btn").click(function(){
						addPost();
					});
					
					function addPost(){
						let form = new FormData(document.getElementById("add-post-form"));
						console.log(form.get("title"))
						$.ajax({
							url : "AddPost",
							type : "POST",
							data : form,
							success : function(data, textStatus, jqXHR){
								if(data.trim() === "done"){
									swal("Good Job!", "Post Saved Successfully", "success").then((value) => {
										  $("#close-modal").click();
										  $("#add-post-form").trigger("reset");
									});
								} else {
									swal("Sorry!", "Something Went Wrong", "error");
								}
							}, error : function(jqXHR, textStatus, errorThrown){
								swal("Sorry!", "Something Went Wrong", "error");
							},
							processData : false,
							contentType : false
						});
					}
					
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