package com.medicare.dao;

import org.springframework.stereotype.Repository;
import com.medicare.config.DBConnection;
import java.sql.*;

@Repository
public class AppointmentDAO {
    
    public boolean saveAppointment(int patientId, int doctorId, String appointmentDate, String appointmentTime, String symptoms) {
        String sql = "INSERT INTO appointment (appointment_code, patient_id, doctor_id, appointment_date, appointment_time, symptoms, status, created_at) VALUES (?, ?, ?, ?, ?, ?, 'pending', NOW())";
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBConnection.getConnection();
            String code = "APP" + System.currentTimeMillis();
            ps = conn.prepareStatement(sql);
            ps.setString(1, code);
            ps.setInt(2, patientId);
            ps.setInt(3, doctorId);
            ps.setDate(4, java.sql.Date.valueOf(appointmentDate));
            ps.setString(5, appointmentTime);
            ps.setString(6, symptoms);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            DBConnection.closeConnection(conn, ps, null);
        }
    }
    
    public int getPatientIdByUserId(int userId) {
        String sql = "SELECT patient_id FROM patient WHERE user_id = ?";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBConnection.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("patient_id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeConnection(conn, ps, rs);
        }
        return -1;
    }
}