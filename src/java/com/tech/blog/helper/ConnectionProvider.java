/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.helper;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author kajay002
 */
public class ConnectionProvider {

    private static Connection con;

    public static Connection getConnection() {
        try {
            if (con==null) {
                 //driver class load
            Class.forName("com.mysql.cj.jdbc.Driver");

            //Create a connection
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog", "root", "Zxcv@1234");

            }
           
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}
