package com.medicare.controller;

import com.medicare.dao.AppointmentDAO;
import com.medicare.dao.DoctorDAO;
import com.medicare.model.Doctor;
import com.medicare.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class BookController {

    @Autowired
    private DoctorDAO doctorDAO;
    
    private AppointmentDAO appointmentDAO = new AppointmentDAO();

    // Trang đặt lịch - Hiển thị tất cả bác sĩ
    @GetMapping("/patient/book")
    public String showBookingForm(@RequestParam(value = "doctorId", required = false) String doctorId,
                                  HttpServletRequest request,
                                  Model model) {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            session.setAttribute("redirectAfterLogin", "/patient/book" + (doctorId != null ? "?doctorId=" + doctorId : ""));
            return "redirect:/login";
        }

        // Lấy danh sách tất cả bác sĩ
        List<Doctor> allDoctors = doctorDAO.getAllDoctors();
        model.addAttribute("allDoctors", allDoctors);

        // Nếu có chọn bác sĩ cụ thể
        if (doctorId != null && !doctorId.trim().isEmpty()) {
            Doctor selectedDoctor = doctorDAO.getDoctorById(doctorId);
            model.addAttribute("selectedDoctor", selectedDoctor);
        } else {
            // Mặc định chọn bác sĩ đầu tiên nếu danh sách không rỗng
            if (allDoctors != null && !allDoctors.isEmpty()) {
                model.addAttribute("selectedDoctor", allDoctors.get(0));
            }
        }

        return "patient/book";
    }

    // Xử lý submit đặt lịch
    @PostMapping("/patient/book/submit")
    public String handleBookingSubmit(HttpServletRequest request, Model model) {
        try {
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            if (user == null) {
                return "redirect:/login";
            }

            String doctorId = request.getParameter("doctorId");
            String patientName = request.getParameter("patientName");
            String phoneNumber = request.getParameter("phoneNumber");
            String appointmentDate = request.getParameter("appointmentDate");
            String symptoms = request.getParameter("symptoms");

            int patientId = appointmentDAO.getPatientIdByUserId(user.getUserId());
            if (patientId == -1) {
                model.addAttribute("error", "Không tìm thấy thông tin bệnh nhân.");
                model.addAttribute("allDoctors", doctorDAO.getAllDoctors());
                return "patient/book";
            }

            if (doctorId == null || doctorId.trim().isEmpty()) {
                List<Doctor> doctors = doctorDAO.getAllDoctors();
                if (!doctors.isEmpty()) {
                    doctorId = String.valueOf(doctors.get(0).getDoctorId());
                } else {
                    model.addAttribute("error", "Hiện không có bác sĩ nào.");
                    model.addAttribute("allDoctors", doctorDAO.getAllDoctors());
                    return "patient/book";
                }
            }

            boolean success = appointmentDAO.saveAppointment(
                patientId,
                Integer.parseInt(doctorId),
                appointmentDate,
                "09:00:00",
                symptoms != null ? symptoms : ""
            );

            if (success) {
                model.addAttribute("success", "Đặt lịch thành công! Chúng tôi sẽ liên hệ qua: " + phoneNumber);
                model.addAttribute("allDoctors", doctorDAO.getAllDoctors());
                return "patient/book";
            } else {
                model.addAttribute("error", "Đặt lịch thất bại. Vui lòng thử lại!");
                model.addAttribute("allDoctors", doctorDAO.getAllDoctors());
                return "patient/book";
            }

        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "Lỗi hệ thống: " + e.getMessage());
            model.addAttribute("allDoctors", doctorDAO.getAllDoctors());
            return "patient/book";
        }
    }

    // Chi tiết bác sĩ
    @GetMapping("/book/doctor-detail/{doctorId}")
    public String doctorDetail(@PathVariable String doctorId, Model model) {
        Doctor doctor = doctorDAO.getDoctorById(doctorId);
        if (doctor != null) {
            model.addAttribute("selectedDoctor", doctor);
        }
        return "redirect:/patient/book?doctorId=" + doctorId;
    }
}