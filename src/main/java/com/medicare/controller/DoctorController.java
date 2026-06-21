package com.medicare.controller;

import com.medicare.dao.DoctorDAO;
import com.medicare.model.Doctor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/doctors")
public class DoctorController {
    
    private DoctorDAO doctorDAO = new DoctorDAO();
    
    @GetMapping
    public String listDoctors(HttpSession session, Model model) {
        if (session.getAttribute("username") == null) {
            return "redirect:/login";
        }
        List<Doctor> doctors = doctorDAO.getAllDoctors();
        model.addAttribute("doctors", doctors);
        return "patient/doctors";
    }
}