<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="com.codeblog.helpers.ConnectionProvider"%>
<%@ page import="com.codeblog.daos.PostDao"%>
<%@ page import="com.codeblog.entities.Post"%>
<%@ page errorPage="error.jsp"%>

<div class="row">
	<%

Connection con = ConnectionProvider.getConnection();
PostDao postDao = new PostDao(con);
ArrayList<Post> list = new ArrayList<>();
int catId = Integer.parseInt(request.getParameter("catId"));
System.out.println(catId);
if(catId <= 0){
	list= postDao.getAllPosts();
} else {
	list = postDao.getPostsByCatId(catId);
}
if(list.size() == 0){
	out.println("<h3 class='display-3 text-center'>Sorry ! No any Post in this Category</h3>");
	return;
}
for (Post post : list) {
%>
	<div class="col-md-6 mt-4">
		<div class="card" style="width: 18rem;">
			<img class="card-img-top" src="img/posts/<%= post.getPicture() %>"
				alt="<%= post.getPicture() %>">
			<div class="card-body">
				<h5 class="card-title"><%= post.getTitle() %></h5>
				<p class="card-text"><%= post.getContent() %></p>
			</div>
			<div class="card-footer primary-background text-center">
			<a href="post.jsp?id=<%=post.getId() %>" class="btn btn-sm btn-outline-light mx-2">Read More</a>
			</div>
		</div>
	</div>


	<% } %>
</div>