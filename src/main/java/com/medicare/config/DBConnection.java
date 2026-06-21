package com.medicare.config;

import java.sql.*;

public class DBConnection {
    private static final String URL = "jdbc:mysql://localhost:3307/medicare?useSSL=false&characterEncoding=UTF-8";
    private static final String USER = "root";
    private static final String PASSWORD = "";
    
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("? MySQL Driver loaded!");
        } catch (ClassNotFoundException e) {
            System.out.println("? MySQL Driver NOT found!");
            e.printStackTrace();
        }
    }
    
    public static Connection getConnection() {
        try {
            Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("? K?t n?i database th?nh c?ng! (port 3307)");
            return conn;
        } catch (SQLException e) {
            System.out.println("? K?t n?i database th?t b?i!");
            System.out.println("L?i: " + e.getMessage());
            return null;
        }
    }
    
    // ??ng k?t n?i - cho PreparedStatement v? ResultSet
    public static void closeConnection(Connection conn, PreparedStatement ps, ResultSet rs) {
        try { if (rs != null) rs.close(); } catch (SQLException e) {}
        try { if (ps != null) ps.close(); } catch (SQLException e) {}
        try { if (conn != null) conn.close(); } catch (SQLException e) {}
    }
    
    // ??ng k?t n?i - ch? PreparedStatement
    public static void closeConnection(Connection conn, PreparedStatement ps) {
        closeConnection(conn, ps, null);
    }
}