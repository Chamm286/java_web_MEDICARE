package com.medicare.controller;

import com.medicare.dao.DoctorDAO;
import com.medicare.model.Doctor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class HomeController {

    @Autowired
    private DoctorDAO doctorDAO;

    @GetMapping("/")
    public String home(Model model) {
        model.addAttribute("title", "Medicare Hospital System");

        // Lấy danh sách bác sĩ từ database
        List<Doctor> allDoctors = doctorDAO.getAllDoctors();
        model.addAttribute("allDoctors", allDoctors);

        return "home";
    }
}