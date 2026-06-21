package com.medicare.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/patient")
public class PatientController {
    
    @GetMapping("/dashboard")
    public String dashboard(Model model) {
        model.addAttribute("title", "Patient Dashboard");
        return "patient/dashboard";
    }
    
    @GetMapping("/book-appointment")
    public String bookAppointment(Model model) {
        model.addAttribute("title", "??t l?ch kh?m");
        return "patient/book-appointment";
    }
    
    @PostMapping("/appointment/save")
    public String saveAppointment(@RequestParam String doctorId,
                                   @RequestParam String appointmentDate,
                                   @RequestParam String appointmentTime,
                                   @RequestParam String symptoms,
                                   Model model) {
        // TODO: L?u v?o database
        System.out.println("??t l?ch - BS: " + doctorId + ", Ng?y: " + appointmentDate + ", Gi?: " + appointmentTime);
        model.addAttribute("message", "??t l?ch th?nh c?ng! Vui l?ng ch? x?c nh?n.");
        return "patient/book-appointment";
    }
    
    @GetMapping("/appointments")
    public String appointments(Model model) {
        model.addAttribute("title", "L?ch h?n c?a t?i");
        return "patient/appointments";
    }
}