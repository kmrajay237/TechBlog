/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.dao;

import com.tech.blog.entities.Category;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author kajay002
 */
public class PostDao {
    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }
    
    public ArrayList<Category> getAllCategories(){
        ArrayList<Category> list=new ArrayList<>();
        try {
            String q="Select * from categories";
            Statement st=con.createStatement();
            ResultSet set=st.executeQuery(q);
            while(set.next()){
                int cid=set.getInt("cid");
                String name=set.getString("name");
                String description=set.getString("description");
                Category c=new Category(cid,name,description);
                list.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
