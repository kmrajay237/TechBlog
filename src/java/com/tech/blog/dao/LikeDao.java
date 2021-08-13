/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author kajay002
 */
public class LikeDao {

    Connection con;

    public LikeDao(Connection con) {
        this.con = con;
    }

    public boolean insertLike(int pid, int uid) {
        boolean f = false;
        try {
            String query = "insert into likes(pid,uid) values(?,?)";
            PreparedStatement ps = this.con.prepareStatement(query);
            ps.setInt(1, pid);
            ps.setInt(2, uid);
            ps.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public int countLikesOnPost(int pid) {
        int count = 0;
        try {
            String query = "select count(*) from likes where pid=?";
            PreparedStatement ps = this.con.prepareStatement(query);
            ps.setInt(1, pid);
            ResultSet set = ps.executeQuery();
            if (set.next()) {
                count = set.getInt("count(*)");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }
    
    public boolean isLikedByUser(int pid,int uid){
        boolean f=false;
        try {
            PreparedStatement p=this.con.prepareStatement("Select * from likes where pid=? and uid=?");
            p.setInt(1, pid);
            p.setInt(2, uid);
            ResultSet set = p.executeQuery();
            if(set.next()){
                f=true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
    public boolean deleteLike(int pid,int uid){
        boolean f=false;
        try {
            PreparedStatement p=this.con.prepareStatement("delete from likes where pid=? and uid=?");
            p.setInt(1, pid);
            p.setInt(2, uid);
            p.executeUpdate();
            f=true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

}
