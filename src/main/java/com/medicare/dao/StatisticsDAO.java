package com.medicare.dao;

import com.medicare.config.DBConnection;
import java.sql.*;
import java.util.*;

public class StatisticsDAO {
    
    public Map<String, Object> getDashboardStats() {
        Map<String, Object> stats = new HashMap<>();
        String sqlDoctor = "SELECT COUNT(*) as total FROM doctor WHERE status = 'active'";
        String sqlPatient = "SELECT COUNT(*) as total FROM patient WHERE status = 'active'";
        String sqlAppointment = "SELECT COUNT(*) as total FROM appointment WHERE DATE(appointment_date) = CURDATE()";
        String sqlRevenue = "SELECT COALESCE(SUM(total_amount), 0) as total FROM bill WHERE MONTH(payment_date) = MONTH(CURDATE())";
        String sqlRating = "SELECT COALESCE(AVG(rating), 0) as avg FROM feedback WHERE status = 'approved'";
        
        Connection conn = null;
        try {
            conn = DBConnection.getConnection();
            // Doctor count
            try (PreparedStatement ps = conn.prepareStatement(sqlDoctor); ResultSet rs = ps.executeQuery()) {
                if (rs.next()) stats.put("totalDoctors", rs.getInt("total"));
            }
            // Patient count
            try (PreparedStatement ps = conn.prepareStatement(sqlPatient); ResultSet rs = ps.executeQuery()) {
                if (rs.next()) stats.put("totalPatients", rs.getInt("total"));
            }
            // Today appointments
            try (PreparedStatement ps = conn.prepareStatement(sqlAppointment); ResultSet rs = ps.executeQuery()) {
                if (rs.next()) stats.put("todayAppointments", rs.getInt("total"));
            }
            // Monthly revenue
            try (PreparedStatement ps = conn.prepareStatement(sqlRevenue); ResultSet rs = ps.executeQuery()) {
                if (rs.next()) stats.put("monthlyRevenue", rs.getLong("total"));
            }
            // Average rating
            try (PreparedStatement ps = conn.prepareStatement(sqlRating); ResultSet rs = ps.executeQuery()) {
                if (rs.next()) stats.put("avgRating", Math.round(rs.getDouble("avg") * 10) / 10.0);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            stats.put("totalDoctors", 0);
            stats.put("totalPatients", 0);
            stats.put("todayAppointments", 0);
            stats.put("monthlyRevenue", 0L);
            stats.put("avgRating", 0.0);
        } finally {
            if (conn != null) try { conn.close(); } catch (Exception e) {}
        }
        return stats;
    }
    
    public List<Map<String, String>> getRecentAppointments() {
        List<Map<String, String>> list = new ArrayList<>();
        String sql = "SELECT a.appointment_code, p.full_name as patient_name, d.full_name as doctor_name, " +
                     "a.appointment_date, a.appointment_time, a.status " +
                     "FROM appointment a " +
                     "JOIN patient p ON a.patient_id = p.patient_id " +
                     "JOIN doctor d ON a.doctor_id = d.doctor_id " +
                     "ORDER BY a.appointment_date DESC LIMIT 10";
        Connection conn = null;
        try {
            conn = DBConnection.getConnection();
            try (PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Map<String, String> row = new HashMap<>();
                    row.put("code", rs.getString("appointment_code"));
                    row.put("patient", rs.getString("patient_name"));
                    row.put("doctor", rs.getString("doctor_name"));
                    row.put("date", rs.getString("appointment_date"));
                    row.put("time", rs.getString("appointment_time"));
                    row.put("status", rs.getString("status"));
                    list.add(row);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) try { conn.close(); } catch (Exception e) {}
        }
        return list;
    }
    
    public List<Map<String, String>> getTopDoctors() {
        List<Map<String, String>> list = new ArrayList<>();
        String sql = "SELECT d.full_name, d.specialization, COUNT(a.appointment_id) as total_appointments " +
                     "FROM doctor d LEFT JOIN appointment a ON d.doctor_id = a.doctor_id " +
                     "GROUP BY d.doctor_id ORDER BY total_appointments DESC LIMIT 5";
        Connection conn = null;
        try {
            conn = DBConnection.getConnection();
            try (PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Map<String, String> row = new HashMap<>();
                    row.put("name", rs.getString("full_name"));
                    row.put("specialization", rs.getString("specialization"));
                    row.put("total", String.valueOf(rs.getInt("total_appointments")));
                    list.add(row);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) try { conn.close(); } catch (Exception e) {}
        }
        return list;
    }
    
    public List<Map<String, Object>> getMonthlyRevenue() {
        List<Map<String, Object>> list = new ArrayList<>();
        String sql = "SELECT MONTH(payment_date) as month, COALESCE(SUM(final_amount), 0) as revenue " +
                     "FROM bill WHERE YEAR(payment_date) = YEAR(CURDATE()) " +
                     "GROUP BY MONTH(payment_date) ORDER BY month";
        Connection conn = null;
        try {
            conn = DBConnection.getConnection();
            try (PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Map<String, Object> row = new HashMap<>();
                    row.put("month", rs.getInt("month"));
                    row.put("revenue", rs.getLong("revenue"));
                    list.add(row);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) try { conn.close(); } catch (Exception e) {}
        }
        return list;
    }
}