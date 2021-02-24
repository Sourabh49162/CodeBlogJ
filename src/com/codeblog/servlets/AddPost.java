package com.codeblog.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.codeblog.daos.PostDao;
import com.codeblog.entities.Post;
import com.codeblog.entities.User;
import com.codeblog.helpers.ConnectionProvider;
import com.codeblog.helpers.ProfileManage;

/**
 * Servlet implementation class AddPost
 */
@WebServlet("/AddPost")
@MultipartConfig
public class AddPost extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPost() {
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
		int catId = Integer.parseInt(request.getParameter("cat_id"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String code = request.getParameter("code");
		Part part = request.getPart("image");
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("currentUser");
		Post post = new Post(title, content, code, part.getSubmittedFileName(), catId, user.getId(), null, null, 1);
		Connection con = ConnectionProvider.getConnection();
		PostDao postDao = new PostDao(con);
		if(postDao.savePost(post)) {
			@SuppressWarnings("deprecation")
			String path = request.getRealPath("/") + "img" + File.separator + "posts" + File.separator
					+ part.getSubmittedFileName();
			ProfileManage.saveProfile(part.getInputStream(), path);
			out.println("done");
		} else {
			out.println("error");
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
