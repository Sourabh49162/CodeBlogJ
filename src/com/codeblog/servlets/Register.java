package com.codeblog.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.codeblog.daos.UserDao;
import com.codeblog.entities.User;
import com.codeblog.helpers.ConnectionProvider;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
@MultipartConfig
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		String termsAndCond = request.getParameter("termsAndCond");
		System.out.println(termsAndCond);
		if(termsAndCond != null) {
			String name = request.getParameter("username");
			String email = request.getParameter("email");
			String gender = request.getParameter("gender");
			String profileImg = "default.png";
			String password = request.getParameter("password");
			
			User user = new User(name, email, gender, profileImg, password);
			System.out.println(user);
			Connection con = ConnectionProvider.getConnection();
			UserDao userDao = new UserDao(con);
			if(userDao.saveUser(user)) {
				out.println("Registration Successful");
			} else {
				out.println("Something Went Wrong! Please try after sometime...");
			}
			
		} else {
			out.println("Please accept Terms and Conditions");
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
