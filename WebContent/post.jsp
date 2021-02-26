<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="com.codeblog.helpers.ConnectionProvider"%>
<%@ page import="com.codeblog.daos.PostDao"%>
<%@ page import="com.codeblog.daos.UserDao"%>
<%@ page import="com.codeblog.entities.User"%>
<%@ page import="com.codeblog.entities.Post"%>
<%@ page import="com.codeblog.entities.Message"%>
<%@ page import="com.codeblog.entities.Category"%>
<%@ page import="com.codeblog.daos.LikeDao"%>
<%@ page errorPage="error.jsp"%>
<%@ include file="admin-navbar.jsp"%>


<%
int id = Integer.parseInt(request.getParameter("id"));
Post post = postDao.getPostById(id);
if (post == null) {
	return;
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
<title><%=post.getTitle()%></title>
</head>
<body>
	<div id="fb-root"></div>
	<script async defer crossorigin="anonymous"
		src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v10.0"
		nonce="1ZHQpGsn"></script>

	<div class="container">
		<div class="row my-4">
			<div class="col-md-8 offset-md-2">
				<div class="card">
					<div class="card-header my-3 primary-background text-white">
						<%=post.getTitle()%>
					</div>
					<img class="card-img-top img-fluid" style="max-width: 750px;"
						src="img/posts/<%=post.getPicture()%>"
						alt="<%=post.getPicture()%>">
					<div class="card-body">
						<h5 class="card-title"><%=post.getTitle()%></h5>
						<p class="card-text"><%=post.getContent()%></p>
						<pre><%=post.getCode()%></pre>
						<div class="row">
							<div class="col-md-6">
								<%
								UserDao userDao = new UserDao(con);
								%>
								<p>
									Posted By : <a href="#"><%=userDao.getUserById(post.getUserId()).getName()%></a>
								</p>
							</div>
							<div class="col-md-6">
								<p class="text-right"><%=DateFormat.getDateTimeInstance().format(post.getUpdatedDate())%></p>
							</div>
						</div>
						<div class="card-footer primary-background text-right">
							<%
							LikeDao likeDao = new LikeDao(con);
							%>
							<a href="#!"
								onClick="updateLike(<%=post.getId()%>, <%=user.getId()%>)"
								id="likes"
								class="btn btn-outline-light <%=likeDao.isLiked(post.getId(), user.getId())%>"><i
								class="fa fa-thumbs-o-up"> &nbsp; <span id="likesCount"><%=likeDao.likesCount(post.getId())%></span></i></a>
						</div>
						<div class="fb-comments"
							data-href="http://localhost:8080/CodeBlog/post.jsp?id=<%=post.getId()%>"
							data-width="" data-numposts="5"></div>
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
		function updateLike(postId, userId){
			$.ajax({
				url : "Like",
				data : {postId : postId, userId : userId},
				success : function(data, textStatus, jqXHR){
					if(data.trim() === "true"){
						$("#likes").removeClass("btn-outline-light");
						$("#likes").addClass("btn-light");
						$("#likes").addClass("true");
						let count = $("#likesCount").html();
						count++;
						$("#likesCount").html(count);
					} else if(data.trim() === "false"){
						$("#likes").removeClass("btn-light");
						$("#likes").addClass("btn-outline-light");
						$("#likes").addClass("false");
						let count = $("#likesCount").html();
						count--;
						$("#likesCount").html(count);
					} else{
						swal("Error !", "Something Went Wrong...", "error");
					}
				}, error : function(jqHXR, textStatus, errorThrown){
					swal("Error !", "Something Went Wrong...", "error");
				}
				
			});
		}
	
		$(document).ready(function(e){
			if($("#likes").prop("classList")[2] === "true"){
				$("#likes").removeClass("btn-outline-light");
				$("#likes").addClass("btn-light");
			}
		});
	</script>
</body>
</html>