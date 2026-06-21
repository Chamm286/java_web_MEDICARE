package com.medicare.controller;

import com.medicare.dao.UserDAO;
import com.medicare.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
public class AuthController {

    private UserDAO userDAO = new UserDAO();

    @GetMapping("/login")
    public String showLoginPage() {
        return "login";
    }

    @PostMapping("/login")
    public String login(@RequestParam String email,
                        @RequestParam String password,
                        HttpSession session,
                        Model model) {
        try {
            System.out.println("=== LOGIN ATTEMPT ===");
            System.out.println("Email: " + email);

            User user = userDAO.findByEmail(email);

            if (user != null && user.getPassword().equals(password)) {
                session.setAttribute("user", user);
                session.setAttribute("userId", user.getUserId());
                session.setAttribute("username", user.getUsername());
                session.setAttribute("role", user.getRole());
                session.setAttribute("fullName", user.getFullName());
                session.setAttribute("email", user.getEmail());

                System.out.println("LOGIN SUCCESS! Role: " + user.getRole());

                // Äiá»u hÆ°á»›ng theo role
                if (user.getRole().equals("PATIENT")) {
                    // Bá»‡nh nhÃ¢n vÃ o trang Ä‘áº·t lá»‹ch ngay
                    return "redirect:/patient/home";
                } else if (user.getRole().equals("ADMIN")) {
                    return "redirect:/admin/dashboard";
                } else if (user.getRole().equals("DOCTOR")) {
                    return "redirect:/doctor/dashboard";
                } else if (user.getRole().equals("RECEPTIONIST")) {
                    return "redirect:/receptionist/dashboard";
                }
                return "redirect:/";
            }

            model.addAttribute("error", "Email hoáº·c máº­t kháº©u khÃ´ng chÃ­nh xÃ¡c!");
            return "login";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "Lá»—i há»‡ thá»‘ng: " + e.getMessage());
            return "login";
        }
    }

    @GetMapping("/register")
    public String showRegisterPage() {
        return "register";
    }

    @PostMapping("/register")
    public String register(@RequestParam String username,
                           @RequestParam String password,
                           @RequestParam String confirmPassword,
                           @RequestParam String fullName,
                           @RequestParam String email,
                           @RequestParam String phone,
                           @RequestParam String dob,
                           @RequestParam String gender,
                           @RequestParam(required = false) String address,
                           Model model) {
        try {
            if (!password.equals(confirmPassword)) {
                model.addAttribute("error", "Máº­t kháº©u xÃ¡c nháº­n khÃ´ng khá»›p!");
                return "register";
            }
            if (password.length() < 8) {
                model.addAttribute("error", "Máº­t kháº©u pháº£i cÃ³ Ã­t nháº¥t 8 kÃ½ tá»±!");
                return "register";
            }

            User existingUser = userDAO.findByUsername(username);
            if (existingUser != null) {
                model.addAttribute("error", "TÃªn Ä‘Äƒng nháº­p Ä‘Ã£ tá»“n táº¡i!");
                return "register";
            }

            User existingEmail = userDAO.findByEmail(email);
            if (existingEmail != null) {
                model.addAttribute("error", "Email Ä‘Ã£ Ä‘Æ°á»£c Ä‘Äƒng kÃ½!");
                return "register";
            }

            User newUser = new User();
            newUser.setUsername(username);
            newUser.setPassword(password);
            newUser.setFullName(fullName);
            newUser.setEmail(email);
            newUser.setPhone(phone);
            newUser.setAddress(address != null ? address : "");
            newUser.setRole("PATIENT");
            newUser.setStatus("active");

            boolean success = userDAO.register(newUser);
            if (success) {
                model.addAttribute("success", "ÄÄƒng kÃ½ thÃ nh cÃ´ng! Vui lÃ²ng Ä‘Äƒng nháº­p.");
                return "login";
            } else {
                model.addAttribute("error", "ÄÄƒng kÃ½ tháº¥t báº¡i, vui lÃ²ng thá»­ láº¡i!");
                return "register";
            }
        } catch (Exception e) {
            model.addAttribute("error", "Lá»—i há»‡ thá»‘ng: " + e.getMessage());
            return "register";
        }
    }

    @GetMapping("/forgot-password")
    public String showForgotPasswordPage() {
        return "forgot-password";
    }

    @PostMapping("/forgot-password")
    public String forgotPassword(@RequestParam String email, Model model) {
        model.addAttribute("message", "HÆ°á»›ng dáº«n Ä‘áº·t láº¡i máº­t kháº©u Ä‘Ã£ Ä‘Æ°á»£c gá»­i Ä‘áº¿n email: " + email);
        return "forgot-password";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }
}