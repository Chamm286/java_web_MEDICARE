package com.medicare.dao;

import org.springframework.stereotype.Repository;

import com.medicare.config.DBConnection;
import com.medicare.model.Doctor;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Repository
public class DoctorDAO {

    public List<Doctor> getAllDoctors() {
        List<Doctor> list = new ArrayList<>();
        String sql = "SELECT doctor_id, doctor_code, user_id, full_name, specialization, qualification, experience_years, phone, email, avatar, consulting_fee, dept_id, schedule, status, created_at FROM doctor WHERE status = 'active'";
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            conn = DBConnection.getConnection();
            if (conn == null) return list;
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            while (rs.next()) {
                Doctor d = new Doctor();
                d.setDoctorId(String.valueOf(rs.getInt("doctor_id")));
                d.setDoctorCode(rs.getString("doctor_code"));
                d.setUserId(rs.getInt("user_id"));
                d.setFullName(rs.getString("full_name"));
                d.setSpecialization(rs.getString("specialization"));
                d.setQualification(rs.getString("qualification"));
                d.setExperienceYears(rs.getInt("experience_years"));
                d.setPhone(rs.getString("phone"));
                d.setEmail(rs.getString("email"));
                d.setAvatar(rs.getString("avatar"));
                d.setConsultingFee(rs.getLong("consulting_fee"));
                d.setDeptId(rs.getInt("dept_id"));
                d.setSchedule(rs.getString("schedule"));
                d.setStatus(rs.getString("status"));
                d.setCreatedAt(rs.getString("created_at"));
                list.add(d);
            }
            System.out.println("Đã load " + list.size() + " bác sĩ từ database");
        } catch (SQLException e) {
            System.err.println("Lỗi khi load bác sĩ: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try { if (rs != null) rs.close(); } catch(Exception e) {}
            try { if (stmt != null) stmt.close(); } catch(Exception e) {}
            try { if (conn != null) conn.close(); } catch(Exception e) {}
        }
        return list;
    }

    public Doctor getDoctorById(String id) {
        String sql = "SELECT doctor_id, doctor_code, user_id, full_name, specialization, qualification, experience_years, phone, email, avatar, consulting_fee, dept_id, schedule, status, created_at FROM doctor WHERE doctor_id = ? AND status = 'active'";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DBConnection.getConnection();
            if (conn == null) return null;
            ps = conn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(id));
            rs = ps.executeQuery();
            if (rs.next()) {
                Doctor d = new Doctor();
                d.setDoctorId(String.valueOf(rs.getInt("doctor_id")));
                d.setDoctorCode(rs.getString("doctor_code"));
                d.setUserId(rs.getInt("user_id"));
                d.setFullName(rs.getString("full_name"));
                d.setSpecialization(rs.getString("specialization"));
                d.setQualification(rs.getString("qualification"));
                d.setExperienceYears(rs.getInt("experience_years"));
                d.setPhone(rs.getString("phone"));
                d.setEmail(rs.getString("email"));
                d.setAvatar(rs.getString("avatar"));
                d.setConsultingFee(rs.getLong("consulting_fee"));
                d.setDeptId(rs.getInt("dept_id"));
                d.setSchedule(rs.getString("schedule"));
                d.setStatus(rs.getString("status"));
                d.setCreatedAt(rs.getString("created_at"));
                return d;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try { if (rs != null) rs.close(); } catch(Exception e) {}
            try { if (ps != null) ps.close(); } catch(Exception e) {}
            try { if (conn != null) conn.close(); } catch(Exception e) {}
        }
        return null;
    }
}