/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ajax.dao;

import com.ajax.bean.Bean;
//import java.sql.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Dao {

    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crud", "root", "Gmail@91100");
        } catch (Exception e) {
            System.out.println(e);
        }
        return con;
    }

    public static int Save(Bean obj) {
        int status = 0;
        try {
            try ( Connection con = Dao.getConnection()) {
                String query = "insert into formajax(name,lname) values(?,?)";
                PreparedStatement ps = con.prepareStatement(query);
                ps.setString(1, obj.getName());
                ps.setString(2, obj.getLname());
                status = ps.executeUpdate();
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }

    public static List<Bean> ShowUserInfo(Bean userinfo) {
        List<Bean> l = new ArrayList<>();
        try {
            Connection con = Dao.getConnection();
            String query = "SELECT * FROM formajax";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Bean u = new Bean();
                u.setName(rs.getString("name"));
                u.setLname(rs.getString("lname"));
                l.add(u);
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return l;
    }
}
