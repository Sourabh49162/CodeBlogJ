package com.codeblog.daos;

import java.sql.*;

public class LikeDao {
	private Connection con;
	
	public LikeDao(Connection con) {
		this.con = con;
	}
	
	public boolean doLike(int postId, int userId) {
		boolean flag = false;
		try {
			String query = "insert into likes(post_id, user_id) values(?,?)";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setInt(1, postId);
			pstmt.setInt(2, userId);
			
			pstmt.executeUpdate();
			flag = true;
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	public int likesCount(int postId) {
		int count = 0;
		try {
			String query = "select count(*) from likes where post_id=?";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setInt(1, postId);
			
			ResultSet set = pstmt.executeQuery();
			
			if(set.next()) {
				count = set.getInt(1);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public boolean isLiked(int postId, int userId) {
		boolean flag = false;
		try {
			String query = "select * from likes where post_id=? and user_id=?";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setInt(1, postId);
			pstmt.setInt(2, userId);
			
			ResultSet set = pstmt.executeQuery();
			
			if(set.next()) {
				flag = true;
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	public boolean deleteLike(int postId, int userId) {
		boolean flag = false;
		try {
			String query = "delete from likes where post_id=? and user_id=?";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setInt(1, postId);
			pstmt.setInt(2, userId);
			
			pstmt.executeUpdate();
			flag = true;
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

}
