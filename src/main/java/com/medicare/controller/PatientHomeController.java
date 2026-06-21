package com.medicare.controller;

import com.medicare.dao.DoctorDAO;
import com.medicare.model.Doctor;
import com.medicare.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import java.util.List;

@Controller
public class PatientHomeController {

    @Autowired
    private DoctorDAO doctorDAO;

    @GetMapping("/patient/home")
    public String patientHome(@SessionAttribute(value = "user", required = false) User user,
                              Model model) {
        if (user == null) {
            return "redirect:/login";
        }

        List<Doctor> allDoctors = doctorDAO.getAllDoctors();
        model.addAttribute("allDoctors", allDoctors);

        return "patient/home";
    }
}