package com.codeblog.daos;

import java.sql.*;

import com.codeblog.entities.User;

public class UserDao {
	private Connection con;
	
	public UserDao(Connection con) {
		this.con = con;
	}
	
	public boolean saveUser(User user) {
		boolean flag = false;
		
		try {
			String query = "insert into user(name, email, gender, profile_img, password) values(?,?,?,?,?)";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getGender());
			pstmt.setString(4, user.getProfileImg());
			pstmt.setString(5, user.getPassword());
			
			pstmt.executeUpdate();
			flag = true;	
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return flag;
		
	}
	
	
	public User getUser(String email, String password) {
		User user = null;
		
		try {
			
			String query = "select * from user where email=? and password=?";
			
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			
			ResultSet set = pstmt.executeQuery();
			
			if(set.next()) {
				int userId = set.getInt("id");
				String userName = set.getString("name");
				String userEmail = set.getString("email");
				String userGender = set.getString("gender");
				String userProfileImg = set.getString("profile_img");
				String userPassword = set.getString("password");
				Date userRegDate = set.getDate("created_at");
				
				user = new User(userName, userEmail, userGender, userProfileImg, userPassword);
				user.setId(userId);
				user.setCreated_date(userRegDate);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return user;
	}
	
	public boolean updateUser(User user) {
		boolean flag = false;
		try {
			String query = "update user set name=?, email=?, profile_img=?, updated_at=? where id=?";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getProfileImg());
			pstmt.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
			pstmt.setInt(5, user.getId());
			
			pstmt.executeUpdate();
			flag = true;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	public User getUserById(int id) {
		User user = null;
		
		try {
			
			String query = "select * from user where id=?";
			
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setInt(1, id);
			
			ResultSet set = pstmt.executeQuery();
			
			if(set.next()) {
				String userName = set.getString("name");
				String userEmail = set.getString("email");
				String userGender = set.getString("gender");
				String userProfileImg = set.getString("profile_img");
				String userPassword = set.getString("password");
				Date userRegDate = set.getDate("created_at");
				
				user = new User(userName, userEmail, userGender, userProfileImg, userPassword);
				user.setId(id);
				user.setCreated_date(userRegDate);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return user;
	}

}
