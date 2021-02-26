package com.codeblog.servlets;

import java.sql.Connection;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.codeblog.helpers.ConnectionProvider;
import com.codeblog.daos.LikeDao;

/**
 * Servlet implementation class Like
 */
@WebServlet("/Like")
@MultipartConfig
public class Like extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Like() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out = response.getWriter();
		int postId = Integer.parseInt(request.getParameter("postId"));
		int userId = Integer.parseInt(request.getParameter("userId"));
		Connection con = ConnectionProvider.getConnection();
		LikeDao likeDao = new LikeDao(con);
		if(likeDao.isLiked(postId, userId)) {
			likeDao.deleteLike(postId, userId);
			out.println("false");
		} else {
			likeDao.doLike(postId, userId);
			out.println("true");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
