package com.medicare.controller;

import com.medicare.dao.StatisticsDAO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminController {
    
    private StatisticsDAO statisticsDAO = new StatisticsDAO();
    
    @GetMapping("/dashboard")
    public String dashboard(Model model) {
        Map<String, Object> stats = statisticsDAO.getDashboardStats();
        model.addAttribute("stats", stats);
        model.addAttribute("recentAppointments", statisticsDAO.getRecentAppointments());
        model.addAttribute("topDoctors", statisticsDAO.getTopDoctors());
        model.addAttribute("monthlyRevenue", statisticsDAO.getMonthlyRevenue());
        return "admin/dashboard";
    }
}