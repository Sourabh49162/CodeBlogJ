package com.codeblog.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

import com.codeblog.entities.Category;
import com.codeblog.entities.Post;

public class PostDao {
	Connection con;
	
	public PostDao(Connection con) {
		this.con = con;
	}
	
	public ArrayList<Category> getAllCategories(){
		ArrayList<Category> list = new ArrayList<>();
		try {
			String query = "select * from categories";
			Statement stmt = this.con.createStatement();
			
			ResultSet set = stmt.executeQuery(query);
			while(set.next()) {
				int id = set.getInt("id");
				String name = set.getString("name");
				String description = set.getString("description");
				String image = set.getString("image");
				Timestamp created_at = set.getTimestamp("created_at");
				Timestamp updated_at = set.getTimestamp("updated_at");
				int status = set.getInt("status");
				Category cat = new Category(id, name, description, image, created_at, updated_at, status);
				list.add(cat);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean savePost(Post post) {
		boolean flag =  false;
		try {
			String query = "insert into posts(title, content, code, picture, cat_id, user_id) values(?,?,?,?,?,?)";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setString(1, post.getTitle());
			pstmt.setString(2, post.getContent());
			pstmt.setString(3, post.getCode());
			pstmt.setString(4, post.getPicture());
			pstmt.setInt(5, post.getCatId());
			pstmt.setInt(6, post.getUserId());
			
			pstmt.executeUpdate();
			flag = true;
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	public ArrayList<Post> getAllPosts(){
		ArrayList<Post> list = new ArrayList<>();
		try {
			String query = "select * from posts order by id desc";
			Statement stmt = this.con.createStatement();
			
			ResultSet set = stmt.executeQuery(query);
			while(set.next()) {
				int id = set.getInt("id");
				String title = set.getString("title");
				String content = set.getString("content");
				String code = set.getString("code");
				String picture = set.getString("picture");
				int catId = set.getInt("cat_id");
				int userId = set.getInt("user_id");
				Timestamp createdDate = set.getTimestamp("created_at");
				Timestamp updatedDate = set.getTimestamp("updated_at");
				int status = set.getInt("status");
				
				Post post = new Post(id, title, content, code, picture, catId, userId, createdDate, updatedDate, status);
				list.add(post);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<Post> getPostsByCatId(int catId){
		ArrayList<Post> list = new ArrayList<>();
		try {
			String query = "select * from posts where cat_id=? order by id desc";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setInt(1, catId);
			
			ResultSet set = pstmt.executeQuery();
			while(set.next()) {
				int id = set.getInt("id");
				String title = set.getString("title");
				String content = set.getString("content");
				String code = set.getString("code");
				String picture = set.getString("picture");
				int userId = set.getInt("user_id");
				Timestamp createdDate = set.getTimestamp("created_at");
				Timestamp updatedDate = set.getTimestamp("updated_at");
				int status = set.getInt("status");
				
				Post post = new Post(id, title, content, code, picture, catId, userId, createdDate, updatedDate, status);
				list.add(post);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public Post getPostById(int id) {
		Post post = null;
		try {
			String query = "select * from posts where id=?";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setInt(1, id);
			
			ResultSet set = pstmt.executeQuery();
			if(set.next()) {
				String title = set.getString("title");
				String content = set.getString("content");
				String code = set.getString("code");
				String picture = set.getString("picture");
				int userId = set.getInt("user_id");
				int catId = set.getInt("cat_id");
				Timestamp createdDate = set.getTimestamp("created_at");
				Timestamp updatedDate = set.getTimestamp("updated_at");
				int status = set.getInt("status");
				
				post = new Post(id, title, content, code, picture, catId, userId, createdDate, updatedDate, status);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return post;
		
	}

}
