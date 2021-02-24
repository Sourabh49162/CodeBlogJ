package com.codeblog.servlets;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.codeblog.daos.UserDao;
import com.codeblog.entities.Message;
import com.codeblog.entities.User;
import com.codeblog.helpers.ConnectionProvider;
import com.codeblog.helpers.ProfileManage;

/**
 * Servlet implementation class Update
 */
@WebServlet("/Update")
@MultipartConfig
public class Update extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Update() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@SuppressWarnings("deprecation")
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		String userName = request.getParameter("user_name");
		String userEmail = request.getParameter("user_email");
		Part part = request.getPart("user_profile");
		String profileName = part.getSubmittedFileName();

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("currentUser");
		user.setName(userName);
		user.setEmail(userEmail);
		String oldFileName = user.getProfileImg();
		user.setProfileImg(profileName);
		Connection con = ConnectionProvider.getConnection();
		UserDao userDao = new UserDao(con);
		if (userDao.updateUser(user)) {
			
			String path = request.getRealPath("/") + "img" + File.separator + "profiles" + File.separator + oldFileName;
			if (!oldFileName.equals("default.png")) {
				ProfileManage.deleteProfile(path);
			}
			path = request.getRealPath("/") + "img" + File.separator + "profiles" + File.separator
					+ user.getProfileImg();
			ProfileManage.saveProfile(part.getInputStream(), path);
			Message msg = new Message("Updated Successfully", "success", "alert-success");
			session.setAttribute("msg", msg);
		} else {
			Message msg = new Message("Sorry ! Something Went Wrong...", "error", "alert-danger");
			session.setAttribute("msg", msg);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
