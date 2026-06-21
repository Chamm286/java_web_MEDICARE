package com.medicare.controller;

import com.medicare.dao.DoctorDAO;
import com.medicare.model.Doctor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/doctor")
public class DoctorDetailController {
    
    private DoctorDAO doctorDAO = new DoctorDAO();
    
    @GetMapping("/{id}")
    public String doctorDetail(@PathVariable String id, HttpSession session, Model model) {
        if (session.getAttribute("username") == null) {
            return "redirect:/login";
        }
        Doctor doctor = doctorDAO.getDoctorById(id);
        if (doctor == null) {
            return "redirect:/book";
        }
        model.addAttribute("doctor", doctor);
        return "patient/doctor-detail";
    }
}