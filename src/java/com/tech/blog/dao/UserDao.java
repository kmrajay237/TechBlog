/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.dao;

import com.tech.blog.entities.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author kajay002
 */
public class UserDao {

    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }

    //Method to insert user into DB
    public boolean saveUser(User user) {
        boolean f = false;
        try {
            String query = "insert into user(name,email,password,confirm_password,gender,about) values(?,?,?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getConfirm_password());
            pstmt.setString(5, user.getGender());
            pstmt.setString(6, user.getAbout());
            pstmt.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    //Get User by email & password
    public User getUserByElementAndPassword(String email, String password) {
        User user = null;
        try {
            String query = "select * from user where email=? and password=?";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            ResultSet resultSet = pstmt.executeQuery();
            if (resultSet.next()) {
                user = new User();
                String name = resultSet.getString("name");
                user.setName(name);

                user.setId(resultSet.getInt("id"));
                user.setEmail(resultSet.getString("email"));
                user.setPassword(resultSet.getString("password"));
                user.setGender(resultSet.getString("gender"));
                user.setAbout(resultSet.getString("about"));
                user.setDateTime(resultSet.getTimestamp("rdate"));
                user.setProfile(resultSet.getString("profile"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public boolean updateUser(User user) {
        boolean f=false;
        try {
            String query = "update user set name=?,email=?,password=?,gender=?,about=?,profile=? where id=?";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            pstmt.setString(5, user.getAbout());
            pstmt.setString(6, user.getProfile());
            pstmt.setInt(7, user.getId());
            
            pstmt.executeUpdate();
            f=true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return f;
    }
    
    public User getUserByUserId(int userId){
        User user=null;
        try {
            String q="select * from user where id=?";
            PreparedStatement ps=this.con.prepareStatement(q);
            ps.setInt(1, userId);
            ResultSet resultSet=ps.executeQuery();
            if(resultSet.next()){
                user = new User();
                String name = resultSet.getString("name");
                user.setName(name);

                user.setId(resultSet.getInt("id"));
                user.setEmail(resultSet.getString("email"));
                user.setPassword(resultSet.getString("password"));
                user.setGender(resultSet.getString("gender"));
                user.setAbout(resultSet.getString("about"));
                user.setDateTime(resultSet.getTimestamp("rdate"));
                user.setProfile(resultSet.getString("profile"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
}
