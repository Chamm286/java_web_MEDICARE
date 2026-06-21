<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Medicare - Hệ thống Y tế Thông minh Hàng đầu</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <style>
        :root {
            --primary: #0d6e3e;
            --primary-dark: #0a5a32;
            --primary-light: #1a9b5c;
            --secondary: #f5a623;
            --dark: #1a1a2e;
            --light: #f8f9fa;
            --gray: #6c757d;
            --success: #28a745;
            --danger: #dc3545;
            --warning: #ffc107;
            --info: #17a2b8;
        }

        [data-theme="dark"] {
            --dark: #f8f9fa;
            --light: #1a1a2e;
            --gray: #adb5bd;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            background: var(--light);
            color: var(--dark);
            transition: all 0.3s ease;
            overflow-x: hidden;
        }

        /* Header */
        .header {
            background: rgba(255,255,255,0.95);
            backdrop-filter: blur(10px);
            padding: 15px 0;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
            box-shadow: 0 2px 20px rgba(0,0,0,0.1);
            transition: all 0.3s;
        }

        [data-theme="dark"] .header {
            background: rgba(26,26,46,0.95);
        }

        .header.scrolled {
            padding: 10px 0;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        .nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 10px;
        }

        .logo {
            font-size: 1.8rem;
            font-weight: 800;
            display: flex;
            align-items: center;
            gap: 10px;
            color: var(--primary);
        }

        .logo i {
            font-size: 2rem;
        }

        .nav-links {
            display: flex;
            gap: 1.5rem;
            align-items: center;
            flex-wrap: wrap;
        }

        .nav-links a {
            color: var(--dark);
            text-decoration: none;
            font-weight: 500;
            transition: 0.3s;
            font-size: 14px;
        }

        .nav-links a:hover {
            color: var(--primary);
        }

        .nav-links .hotline {
            color: #e53e3e;
            font-weight: 700;
        }
        .nav-links .hotline i { margin-right: 4px; }

        .theme-toggle {
            background: var(--primary);
            border: none;
            color: white;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            cursor: pointer;
            transition: 0.3s;
        }

        .btn-login {
            background: linear-gradient(45deg, var(--primary), var(--primary-light));
            padding: 10px 25px;
            border-radius: 30px;
            color: white !important;
        }

        .btn-book-nav {
            background: #2ecc71;
            padding: 10px 25px;
            border-radius: 30px;
            color: white !important;
        }

        .btn-book-nav:hover {
            background: #1a5c3e;
        }

        /* Hero Section */
        .hero {
            min-height: 100vh;
            display: flex;
            align-items: center;
            position: relative;
            padding-top: 80px;
            background: linear-gradient(135deg, rgba(13,110,62,0.05) 0%, rgba(26,155,92,0.05) 100%);
        }

        /* ===== ANIMATED BACKGROUND ===== */
        .hero-bg {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 0;
            overflow: hidden;
        }

        .hero-bg .wave {
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320"><path fill="rgba(13,110,62,0.1)" fill-opacity="1" d="M0,192L48,197.3C96,203,192,213,288,208C384,203,480,181,576,181.3C672,181,768,203,864,213.3C960,224,1056,224,1152,208C1248,192,1344,160,1392,144L1440,128L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z"></path></svg>') repeat-x;
            background-size: cover;
            animation: wave 20s infinite linear;
        }

        @keyframes wave {
            0% { transform: translateX(0); }
            100% { transform: translateX(-50%); }
        }

        .hero-content {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 50px;
            align-items: center;
            position: relative;
            z-index: 1;
        }

        .hero-text .badge {
            background: linear-gradient(45deg, var(--primary), var(--primary-light));
            padding: 8px 20px;
            border-radius: 30px;
            display: inline-block;
            margin-bottom: 20px;
            color: white;
            font-size: 0.9rem;
        }

        .hero-text h1 {
            font-size: 3.5rem;
            margin-bottom: 20px;
            line-height: 1.2;
        }

        .hero-text h1 span {
            color: var(--primary);
        }

        .hero-text p {
            font-size: 1.1rem;
            color: var(--gray);
            margin-bottom: 30px;
            line-height: 1.6;
        }

        .hero-stats {
            display: flex;
            gap: 30px;
            margin-bottom: 30px;
        }

        .hero-stats .stat-item {
            text-align: center;
        }

        .hero-stats .stat-number {
            font-size: 2rem;
            font-weight: 700;
            color: var(--primary);
        }

        .hero-stats .stat-label {
            font-size: 0.9rem;
            color: var(--gray);
        }

        .hero-buttons {
            display: flex;
            gap: 15px;
        }

        .btn-primary {
            background: linear-gradient(45deg, var(--primary), var(--primary-light));
            color: white;
            padding: 12px 30px;
            border-radius: 40px;
            text-decoration: none;
            font-weight: 600;
            transition: 0.3s;
            border: none;
            cursor: pointer;
        }

        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 25px rgba(13,110,62,0.3);
        }

        .btn-secondary {
            background: transparent;
            border: 2px solid var(--primary);
            color: var(--primary);
            padding: 12px 30px;
            border-radius: 40px;
            text-decoration: none;
            font-weight: 600;
            transition: 0.3s;
        }

        .btn-secondary:hover {
            background: var(--primary);
            color: white;
        }

        .hero-image {
            position: relative;
            animation: float 3s ease-in-out infinite;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-20px); }
        }

        .hero-image img {
            width: 100%;
            max-width: 500px;
            border-radius: 20px;
        }

        /* ===== SLIDER (THÊM MỚI) ===== */
        .slider-section {
            padding: 40px 0;
            background: var(--light);
        }
        .slider-container {
            position: relative;
            border-radius: 20px;
            overflow: hidden;
            height: 320px;
        }
        .slider-track {
            display: flex;
            width: 100%;
            height: 100%;
            transition: transform 0.6s ease;
        }
        .slider-slide {
            min-width: 100%;
            height: 100%;
            display: flex;
            align-items: center;
            padding: 40px 50px;
            color: white;
            position: relative;
        }
        .slider-slide.slide1 { background: linear-gradient(135deg, #0a7e6b, #12b886); }
        .slider-slide.slide2 { background: linear-gradient(135deg, #1a5c3e, #2ecc71); }
        .slider-slide.slide3 { background: linear-gradient(135deg, #0d6e3e, #1a9b5c); }
        .slider-slide .content { max-width: 550px; z-index: 2; }
        .slider-slide .content h2 {
            font-size: 30px;
            font-weight: 800;
            margin-bottom: 10px;
        }
        .slider-slide .content p {
            font-size: 16px;
            opacity: 0.9;
            margin-bottom: 18px;
        }
        .slider-slide .content .btn-slide {
            background: white;
            color: #0a7e6b;
            padding: 10px 28px;
            border-radius: 40px;
            font-weight: 600;
            display: inline-block;
            transition: 0.3s;
        }
        .slider-slide .content .btn-slide:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 25px rgba(0,0,0,0.15);
        }
        .slider-slide .icon-big {
            font-size: 80px;
            opacity: 0.2;
            position: absolute;
            right: 50px;
            bottom: 30px;
        }
        .slider-btn {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            background: rgba(255,255,255,0.2);
            border: none;
            color: white;
            width: 44px;
            height: 44px;
            border-radius: 50%;
            cursor: pointer;
            font-size: 20px;
            transition: 0.3s;
            z-index: 10;
        }
        .slider-btn:hover { background: rgba(255,255,255,0.35); }
        .slider-btn.prev { left: 16px; }
        .slider-btn.next { right: 16px; }
        .slider-dots {
            position: absolute;
            bottom: 16px;
            left: 50%;
            transform: translateX(-50%);
            display: flex;
            gap: 10px;
            z-index: 10;
        }
        .slider-dots .dot {
            width: 12px;
            height: 12px;
            border-radius: 50%;
            background: rgba(255,255,255,0.4);
            cursor: pointer;
            transition: 0.3s;
            border: none;
        }
        .slider-dots .dot.active { background: white; transform: scale(1.2); }

        /* ===== QUICK SERVICES (THÊM MỚI) ===== */
        .quick-services {
            padding: 30px 0;
            background: white;
            border-bottom: 1px solid #edf2f7;
        }
        .quick-grid {
            display: grid;
            grid-template-columns: repeat(6, 1fr);
            gap: 12px;
        }
        .quick-item {
            text-align: center;
            padding: 16px 10px;
            border-radius: 12px;
            cursor: pointer;
            transition: 0.3s;
            border: 1px solid transparent;
        }
        .quick-item:hover {
            background: #f0fdf4;
            border-color: var(--primary);
        }
        .quick-item .icon {
            font-size: 28px;
            color: var(--primary);
            margin-bottom: 6px;
            display: block;
        }
        .quick-item span {
            font-size: 13px;
            font-weight: 500;
        }

        /* ===== STATS BAR (THÊM MỚI) ===== */
        .stats-bar {
            padding: 40px 0;
            background: linear-gradient(135deg, var(--primary), var(--primary-dark));
            color: white;
        }
        .stats-bar-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            text-align: center;
        }
        .stats-bar-grid .num {
            font-size: 2.2rem;
            font-weight: 800;
        }
        .stats-bar-grid .label {
            font-size: 0.9rem;
            opacity: 0.85;
        }

        /* ===== SPECIALTIES (THÊM MỚI) ===== */
        .specialties-section {
            padding: 50px 0;
            background: white;
        }
        .specialties-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(140px, 1fr));
            gap: 12px;
        }
        .specialties-grid .spec {
            padding: 12px 16px;
            background: #f8fafc;
            border-radius: 10px;
            text-align: center;
            font-size: 13px;
            font-weight: 500;
            cursor: pointer;
            transition: 0.2s;
            border: 1px solid transparent;
        }
        .specialties-grid .spec:hover {
            background: #d4f5f0;
            border-color: var(--primary);
            color: var(--primary);
        }
        .specialties-grid .spec i {
            color: var(--primary);
            margin-right: 6px;
        }
        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 16px;
        }
        .section-header h3 {
            font-size: 1.2rem;
            font-weight: 700;
        }
        .section-header a {
            color: var(--primary);
            font-weight: 600;
            font-size: 14px;
        }

        /* ===== PARTNERS (THÊM MỚI) ===== */
        .partners-section {
            padding: 50px 0;
            background: var(--light);
        }
        .partners-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 16px;
        }
        .partners-grid .partner {
            padding: 16px;
            background: white;
            border-radius: 12px;
            text-align: center;
            font-size: 13px;
            font-weight: 500;
            border: 1px solid #edf2f7;
            transition: 0.2s;
        }
        .partners-grid .partner:hover {
            border-color: var(--primary);
            background: #f0fdf4;
        }
        .partners-grid .partner .star { color: #f6ad55; }
        .partners-grid .partner .btn-link {
            color: var(--primary);
            font-weight: 600;
            font-size: 13px;
            margin-top: 6px;
            display: inline-block;
        }

        /* Services Section */
        .services {
            padding: 80px 0;
            background: var(--light);
        }

        .section-title {
            text-align: center;
            font-size: 2.5rem;
            margin-bottom: 15px;
        }

        .section-subtitle {
            text-align: center;
            color: var(--gray);
            margin-bottom: 50px;
        }

        .services-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 30px;
        }

        .service-card {
            background: rgba(255,255,255,0.95);
            border-radius: 20px;
            padding: 40px 30px;
            text-align: center;
            transition: 0.4s;
            box-shadow: 0 5px 20px rgba(0,0,0,0.05);
            cursor: pointer;
        }

        [data-theme="dark"] .service-card {
            background: rgba(26,26,46,0.95);
        }

        .service-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 40px rgba(13,110,62,0.2);
        }

        .service-card i {
            font-size: 3rem;
            color: var(--primary);
            margin-bottom: 20px;
        }

        .service-card h3 {
            margin-bottom: 15px;
        }

        /* About Section */
        .about {
            padding: 80px 0;
            background: linear-gradient(135deg, var(--light) 0%, rgba(13,110,62,0.05) 100%);
        }

        .about-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 50px;
            align-items: center;
        }

        .about-image img {
            width: 100%;
            border-radius: 20px;
        }

        .about-text h2 {
            font-size: 2rem;
            margin-bottom: 20px;
        }

        .about-text p {
            color: var(--gray);
            margin-bottom: 20px;
            line-height: 1.6;
        }

        .feature-list {
            list-style: none;
        }

        .feature-list li {
            margin-bottom: 15px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .feature-list i {
            color: var(--primary);
        }

        /* Doctors Section */
        .doctors {
            padding: 80px 0;
            background: var(--light);
        }

        .doctors-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 30px;
        }

        .doctor-card {
            background: rgba(255,255,255,0.95);
            border-radius: 20px;
            padding: 30px;
            text-align: center;
            transition: 0.4s;
        }

        [data-theme="dark"] .doctor-card {
            background: rgba(26,26,46,0.95);
        }

        .doctor-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 35px rgba(0,0,0,0.1);
        }

        .doctor-card img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 20px;
            border: 4px solid var(--primary);
        }

        .doctor-card h3 {
            margin-bottom: 5px;
        }

        .specialty {
            color: var(--primary);
            margin-bottom: 10px;
        }

        .rating {
            color: #f1c40f;
            margin: 10px 0;
        }

        .btn-book-doctor {
            background: transparent;
            border: 2px solid var(--primary);
            color: var(--primary);
            padding: 8px 25px;
            border-radius: 30px;
            cursor: pointer;
            margin-top: 15px;
            transition: 0.3s;
        }

        .btn-book-doctor:hover {
            background: var(--primary);
            color: white;
        }

        /* Testimonials */
        .testimonials {
            padding: 80px 0;
            background: linear-gradient(135deg, rgba(13,110,62,0.05) 0%, var(--light) 100%);
        }

        .testimonials-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
        }

        .testimonial-card {
            background: rgba(255,255,255,0.95);
            border-radius: 20px;
            padding: 30px;
            text-align: center;
        }

        [data-theme="dark"] .testimonial-card {
            background: rgba(26,26,46,0.95);
        }

        .testimonial-card i {
            font-size: 3rem;
            color: var(--primary);
            opacity: 0.5;
            margin-bottom: 20px;
        }

        .testimonial-text {
            font-style: italic;
            margin-bottom: 20px;
        }

        .testimonial-author {
            font-weight: 600;
            margin-top: 10px;
        }

        /* Footer */
        .footer {
            background: var(--dark);
            color: white;
            padding: 50px 0 20px;
        }

        .footer-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 40px;
            margin-bottom: 30px;
        }

        .footer-col h4 {
            margin-bottom: 20px;
            color: var(--primary);
        }

        .footer-col a {
            color: #ccc;
            text-decoration: none;
            display: block;
            margin-bottom: 10px;
            transition: 0.3s;
        }

        .footer-col a:hover {
            color: var(--primary);
            transform: translateX(5px);
        }

        .footer-col .hotline-footer {
            color: #2ecc71;
            font-weight: 700;
            font-size: 1.1rem;
        }

        .social-links {
            display: flex;
            gap: 15px;
        }

        .social-links a {
            width: 40px;
            height: 40px;
            background: rgba(255,255,255,0.1);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .social-links a:hover {
            background: var(--primary);
            transform: translateY(-3px);
        }

        .copyright {
            text-align: center;
            padding-top: 20px;
            border-top: 1px solid rgba(255,255,255,0.1);
        }

        /* Chat Widget */
        .chat-widget {
            position: fixed;
            bottom: 30px;
            right: 30px;
            z-index: 1000;
        }

        .chat-button {
            width: 60px;
            height: 60px;
            background: linear-gradient(45deg, var(--primary), var(--primary-light));
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            box-shadow: 0 5px 20px rgba(13,110,62,0.4);
            transition: 0.3s;
        }

        .chat-button:hover {
            transform: scale(1.1);
        }

        .chat-button i {
            font-size: 1.8rem;
            color: white;
        }

        .chat-box {
            position: absolute;
            bottom: 80px;
            right: 0;
            width: 350px;
            background: white;
            border-radius: 20px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.2);
            display: none;
            overflow: hidden;
        }

        [data-theme="dark"] .chat-box {
            background: #2d2d44;
            color: white;
        }

        .chat-box.active {
            display: block;
            animation: slideIn 0.3s ease;
        }

        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .chat-header {
            background: linear-gradient(45deg, var(--primary), var(--primary-light));
            color: white;
            padding: 15px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .chat-body {
            padding: 15px;
            height: 300px;
            overflow-y: auto;
        }

        .message {
            margin-bottom: 15px;
            display: flex;
            gap: 10px;
        }

        .message.bot {
            justify-content: flex-start;
        }

        .message.user {
            justify-content: flex-end;
        }

        .message-content {
            max-width: 80%;
            padding: 10px 15px;
            border-radius: 15px;
        }

        .message.bot .message-content {
            background: #f0f2f5;
            color: #333;
        }

        [data-theme="dark"] .message.bot .message-content {
            background: #3d3d5c;
            color: white;
        }

        .message.user .message-content {
            background: linear-gradient(45deg, var(--primary), var(--primary-light));
            color: white;
        }

        .chat-input {
            padding: 15px;
            border-top: 1px solid #eee;
            display: flex;
            gap: 10px;
        }

        [data-theme="dark"] .chat-input {
            border-top-color: #444;
        }

        .chat-input input {
            flex: 1;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 25px;
            outline: none;
        }

        [data-theme="dark"] .chat-input input {
            background: #3d3d5c;
            border-color: #555;
            color: white;
        }

        .chat-input button {
            background: linear-gradient(45deg, var(--primary), var(--primary-light));
            border: none;
            padding: 10px 20px;
            border-radius: 25px;
            color: white;
            cursor: pointer;
        }

        @media (max-width: 992px) {
            .quick-grid { grid-template-columns: repeat(3, 1fr); }
            .stats-bar-grid { grid-template-columns: repeat(2, 1fr); }
        }

        @media (max-width: 768px) {
            .hero-content {
                grid-template-columns: 1fr;
                text-align: center;
            }
            .hero-stats {
                justify-content: center;
            }
            .hero-buttons {
                justify-content: center;
            }
            .about-grid {
                grid-template-columns: 1fr;
            }
            .nav {
                flex-direction: column;
                gap: 15px;
            }
            .hero-text h1 {
                font-size: 2.5rem;
            }
            .quick-grid { grid-template-columns: repeat(2, 1fr); }
            .slider-container { height: 250px; }
            .slider-slide { padding: 20px; }
            .slider-slide .content h2 { font-size: 20px; }
            .slider-slide .icon-big { font-size: 50px; right: 20px; bottom: 20px; }
            .slider-btn { width: 32px; height: 32px; font-size: 14px; }
            .specialties-grid { grid-template-columns: repeat(2, 1fr); }
            .stats-bar-grid { grid-template-columns: 1fr 1fr; }
        }

        @media (max-width: 480px) {
            .quick-grid { grid-template-columns: 1fr 1fr; }
            .nav-links { gap: 8px; }
            .nav-links a { font-size: 12px; }
            .nav-links .btn-login, .btn-book-nav { padding: 6px 14px; font-size: 12px; }
            .slider-container { height: 220px; }
            .slider-slide .content h2 { font-size: 17px; }
            .slider-slide .content p { font-size: 13px; }
            .slider-slide .content .btn-slide { padding: 6px 18px; font-size: 13px; }
        }
    </style>
</head>
<body>

<!-- Header -->
<header class="header" id="header">
    <div class="container">
        <nav class="nav">
            <div class="logo">
                <i class="fas fa-heartbeat"></i>
                Medicare
            </div>
            <div class="nav-links">
                <a href="#">Trang chủ</a>
                <a href="#services">Dịch vụ</a>
                <a href="#about">Giới thiệu</a>
                <a href="#doctors">Bác sĩ</a>
                <a href="#contact">Liên hệ</a>
                <a href="#" class="hotline"><i class="fas fa-phone"></i> 1900 2115</a>
                <a href="${pageContext.request.contextPath}/book" class="btn-book-nav"><i class="fas fa-calendar-check"></i> Đặt lịch</a>
                <button class="theme-toggle" onclick="toggleTheme()">
                    <i class="fas fa-moon"></i>
                </button>
                <a href="${pageContext.request.contextPath}/login" class="btn-login">Đăng nhập</a>
            </div>
        </nav>
    </div>
</header>

<!-- Hero Section -->
<section class="hero">
    <div class="hero-bg">
        <div class="wave"></div>
    </div>
    <div class="container">
        <div class="hero-content">
            <div class="hero-text" data-aos="fade-right">
                <div class="badge">
                    <i class="fas fa-shield-alt"></i> Bảo hiểm y tế toàn diện
                </div>
                <h1>Chăm sóc sức khỏe<br><span>Tận tâm - Chuyên nghiệp</span></h1>
                <p>Medicare - Hệ thống y tế thông minh hàng đầu Việt Nam, với đội ngũ bác sĩ giỏi, công nghệ AI tiên tiến, mang đến dịch vụ chăm sóc sức khỏe tốt nhất cho bạn và gia đình.</p>
                <div class="hero-stats">
                    <div class="stat-item">
                        <div class="stat-number">500+</div>
                        <div class="stat-label">Bác sĩ</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-number">50K+</div>
                        <div class="stat-label">Bệnh nhân</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-number">98%</div>
                        <div class="stat-label">Hài lòng</div>
                    </div>
                </div>
                <div class="hero-buttons">
                    <a href="${pageContext.request.contextPath}/book" class="btn-primary"><i class="fas fa-calendar-check"></i> Đặt lịch ngay</a>
                    <a href="#services" class="btn-secondary">Khám phá</a>
                </div>
            </div>
            <div class="hero-image" data-aos="fade-left">
                <img src="https://images.unsplash.com/photo-1559839734-2b71ea197ec2?w=500" alt="Bác sĩ Medicare đang khám bệnh">
            </div>
        </div>
    </div>
</section>

<!-- ===== SLIDER (THÊM MỚI) ===== -->
<section class="slider-section">
    <div class="container">
        <div class="slider-container" id="sliderContainer">
            <div class="slider-track" id="sliderTrack">
                <div class="slider-slide slide1">
                    <div class="content">
                        <h2>🏥 Đặt khám bệnh thông minh</h2>
                        <p>Kết nối người dân với cơ sở & dịch vụ y tế hàng đầu</p>
                        <a href="${pageContext.request.contextPath}/book" class="btn-slide">Đặt lịch ngay →</a>
                    </div>
                    <div class="icon-big"><i class="fas fa-hospital"></i></div>
                </div>
                <div class="slider-slide slide2">
                    <div class="content">
                        <h2>👨‍⚕️ Đội ngũ bác sĩ hàng đầu</h2>
                        <p>Chuyên gia giàu kinh nghiệm, tận tâm với sức khỏe của bạn</p>
                        <a href="#doctors" class="btn-slide">Xem bác sĩ →</a>
                    </div>
                    <div class="icon-big"><i class="fas fa-user-md"></i></div>
                </div>
                <div class="slider-slide slide3">
                    <div class="content">
                        <h2>📱 Đặt lịch online tiện lợi</h2>
                        <p>Chọn ngày giờ phù hợp, không phải chờ đợi, tiết kiệm thời gian</p>
                        <a href="${pageContext.request.contextPath}/book" class="btn-slide">Đặt ngay →</a>
                    </div>
                    <div class="icon-big"><i class="fas fa-calendar-check"></i></div>
                </div>
            </div>
            <button class="slider-btn prev" onclick="changeSlide(-1)"><i class="fas fa-chevron-left"></i></button>
            <button class="slider-btn next" onclick="changeSlide(1)"><i class="fas fa-chevron-right"></i></button>
            <div class="slider-dots" id="sliderDots">
                <span class="dot active" onclick="goToSlide(0)"></span>
                <span class="dot" onclick="goToSlide(1)"></span>
                <span class="dot" onclick="goToSlide(2)"></span>
            </div>
        </div>
    </div>
</section>

<!-- ===== QUICK SERVICES (THÊM MỚI) ===== -->
<section class="quick-services">
    <div class="container">
        <div class="quick-grid">
            <div class="quick-item" onclick="location.href='${pageContext.request.contextPath}/book'">
                <i class="fas fa-calendar-plus icon"></i>
                <span>Đặt khám tại cơ sở</span>
            </div>
            <div class="quick-item" onclick="location.href='${pageContext.request.contextPath}/book'">
                <i class="fas fa-user-md icon"></i>
                <span>Đặt khám chuyên khoa</span>
            </div>
            <div class="quick-item">
                <i class="fas fa-video icon"></i>
                <span>Gọi video với bác sĩ</span>
            </div>
            <div class="quick-item">
                <i class="fas fa-flask icon"></i>
                <span>Đặt lịch xét nghiệm</span>
            </div>
            <div class="quick-item">
                <i class="fas fa-clock icon"></i>
                <span>Đặt khám ngoài giờ</span>
            </div>
            <div class="quick-item">
                <i class="fas fa-hand-holding-heart icon"></i>
                <span>Giúp việc cá nhân</span>
            </div>
        </div>
    </div>
</section>

<!-- ===== STATS BAR (THÊM MỚI) ===== -->
<section class="stats-bar">
    <div class="container">
        <div class="stats-bar-grid">
            <div><div class="num">4.0M+</div><div class="label">Lượt khám</div></div>
            <div><div class="num">100+</div><div class="label">Bệnh viện</div></div>
            <div><div class="num">300+</div><div class="label">Cơ sở Y tế</div></div>
            <div><div class="num">2500+</div><div class="label">Bác sĩ</div></div>
        </div>
    </div>
</section>

<!-- ===== SPECIALTIES (THÊM MỚI) ===== -->
<section class="specialties-section">
    <div class="container">
        <div class="section-header">
            <h3><i class="fas fa-stethoscope"></i> Chuyên khoa</h3>
            <a href="#">Xem tất cả →</a>
        </div>
        <div class="specialties-grid">
            <div class="spec"><i class="fas fa-user-md"></i> Bác sĩ Gia Đình</div>
            <div class="spec"><i class="fas fa-lungs"></i> Nội Hô Hấp</div>
            <div class="spec"><i class="fas fa-heart"></i> Nội Tim Mạch</div>
            <div class="spec"><i class="fas fa-brain"></i> Nội Thần Kinh</div>
            <div class="spec"><i class="fas fa-bone"></i> Cơ Xương Khớp</div>
            <div class="spec"><i class="fas fa-ear-deaf"></i> Tai Mũi Họng</div>
            <div class="spec"><i class="fas fa-eye"></i> Mắt</div>
            <div class="spec"><i class="fas fa-stomach"></i> Tiêu Hóa Gan Mật</div>
            <div class="spec"><i class="fas fa-kidney"></i> Nội Tiết Niệu</div>
            <div class="spec"><i class="fas fa-allergies"></i> Da liễu</div>
        </div>
    </div>
</section>

<!-- ===== PARTNERS (THÊM MỚI) ===== -->
<section class="partners-section">
    <div class="container">
        <div class="section-header">
            <h3>🏥 Được tin tưởng hợp tác và đồng hành</h3>
            <a href="#">Xem tất cả →</a>
        </div>
        <div class="partners-grid">
            <div class="partner">
                <div>Bệnh viện Đa khoa Phương Đông</div>
                <div class="star"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></div>
                <a href="#" class="btn-link">Đặt khám ngay</a>
            </div>
            <div class="partner">
                <div>Trung Tâm Nội Soi Tiêu Hoá Doctor Check</div>
                <div class="star"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></div>
                <a href="#" class="btn-link">Đặt khám ngay</a>
            </div>
            <div class="partner">
                <div>Bệnh viện Mắt Á Châu</div>
                <div class="star"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></div>
                <a href="#" class="btn-link">Đặt khám ngay</a>
            </div>
            <div class="partner">
                <div>Phòng Khám Sản Phụ Khoa Dr.Marie</div>
                <div class="star"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></div>
                <a href="#" class="btn-link">Đặt khám ngay</a>
            </div>
        </div>
    </div>
</section>

<!-- Services Section -->
<section id="services" class="services">
    <div class="container">
        <h2 class="section-title" data-aos="fade-up">Dịch vụ nổi bật</h2>
        <p class="section-subtitle" data-aos="fade-up">Đa dạng dịch vụ chăm sóc sức khỏe chất lượng cao</p>
        <div class="services-grid">
            <div class="service-card" data-aos="flip-left" onclick="location.href='${pageContext.request.contextPath}/book'">
                <i class="fas fa-heartbeat"></i>
                <h3>Khám Tim mạch</h3>
                <p>Đội ngũ bác sĩ tim mạch hàng đầu, trang thiết bị hiện đại, chẩn đoán chính xác</p>
            </div>
            <div class="service-card" data-aos="flip-left" data-aos-delay="100" onclick="location.href='${pageContext.request.contextPath}/book'">
                <i class="fas fa-baby"></i>
                <h3>Khám Nhi khoa</h3>
                <p>Chuyên gia nhi khoa giàu kinh nghiệm, chăm sóc trẻ tận tình, tiêm chủng đầy đủ</p>
            </div>
            <div class="service-card" data-aos="flip-left" data-aos-delay="200" onclick="location.href='${pageContext.request.contextPath}/book'">
                <i class="fas fa-bone"></i>
                <h3>Cơ Xương Khớp</h3>
                <p>Điều trị các bệnh lý về xương khớp, thoái hóa cột sống, vật lý trị liệu</p>
            </div>
            <div class="service-card" data-aos="flip-left" data-aos-delay="300" onclick="location.href='${pageContext.request.contextPath}/book'">
                <i class="fas fa-eye"></i>
                <h3>Khám Mắt</h3>
                <p>Phẫu thuật mắt, cắt kính, điều trị các bệnh về mắt, tật khúc xạ</p>
            </div>
            <div class="service-card" data-aos="flip-left" data-aos-delay="400" onclick="location.href='${pageContext.request.contextPath}/book'">
                <i class="fas fa-tooth"></i>
                <h3>Răng Hàm Mặt</h3>
                <p>Niềng răng, nhổ răng, điều trị tủy, phục hình răng thẩm mỹ</p>
            </div>
            <div class="service-card" data-aos="flip-left" data-aos-delay="500" onclick="location.href='${pageContext.request.contextPath}/book'">
                <i class="fas fa-brain"></i>
                <h3>Thần kinh</h3>
                <p>Điều trị đau đầu, mất ngủ, tai biến, động kinh, Parkinson</p>
            </div>
        </div>
    </div>
</section>

<!-- About Section -->
<section id="about" class="about">
    <div class="container">
        <div class="about-grid">
            <div class="about-image" data-aos="fade-right">
                <img src="https://images.unsplash.com/photo-1559839734-2b71ea197ec2?w=500" alt="About Medicare">
            </div>
            <div class="about-text" data-aos="fade-left">
                <h2>Về <span style="color: var(--primary);">Medicare</span></h2>
                <p>Medicare được thành lập năm 2010 với sứ mệnh mang đến dịch vụ chăm sóc sức khỏe chất lượng cao, tiếp cận dễ dàng cho mọi người dân Việt Nam.</p>
                <ul class="feature-list">
                    <li><i class="fas fa-check-circle"></i> Đội ngũ bác sĩ giỏi, giàu kinh nghiệm</li>
                    <li><i class="fas fa-check-circle"></i> Trang thiết bị y tế hiện đại, nhập khẩu</li>
                    <li><i class="fas fa-check-circle"></i> Bảo hiểm y tế liên kết đa dạng</li>
                    <li><i class="fas fa-check-circle"></i> Hệ thống đặt lịch online tiện lợi</li>
                    <li><i class="fas fa-check-circle"></i> Hỗ trợ khám chữa bệnh từ xa</li>
                </ul>
            </div>
        </div>
    </div>
</section>

<!-- Doctors Section -->
<section id="doctors" class="doctors">
    <div class="container">
        <h2 class="section-title" data-aos="fade-up">Đội ngũ bác sĩ</h2>
        <p class="section-subtitle" data-aos="fade-up">Những chuyên gia hàng đầu trong lĩnh vực y tế</p>
        <div class="doctors-grid">
            <c:forEach var="doc" items="${allDoctors}" end="5">
                <div class="doctor-card" data-aos="zoom-in">
                    <img src="https://randomuser.me/api/portraits/men/32.jpg" alt="Doctor">
                    <h3>BS. ${doc.fullName}</h3>
                    <p class="specialty">${doc.specialization}</p>
                    <div class="rating">★★★★★</div>
                    <p>${doc.experienceYears} năm kinh nghiệm</p>
                    <button class="btn-book-doctor" onclick="location.href='${pageContext.request.contextPath}/book'">Đặt lịch</button>
                </div>
            </c:forEach>
        </div>
    </div>
</section>

<!-- Testimonials Section -->
<section class="testimonials">
    <div class="container">
        <h2 class="section-title" data-aos="fade-up">Khách hàng nói về chúng tôi</h2>
        <p class="section-subtitle" data-aos="fade-up">Hàng ngàn bệnh nhân tin tưởng và hài lòng</p>
        <div class="testimonials-grid">
            <div class="testimonial-card" data-aos="fade-up">
                <i class="fas fa-quote-left"></i>
                <p class="testimonial-text">"Medicare là nơi tôi tin tưởng để chăm sóc sức khỏe gia đình. Bác sĩ tận tình, cơ sở vật chất hiện đại."</p>
                <p class="testimonial-author">- Nguyễn Văn An -</p>
            </div>
            <div class="testimonial-card" data-aos="fade-up" data-aos-delay="100">
                <i class="fas fa-quote-left"></i>
                <p class="testimonial-text">"Con tôi được khám và điều trị tại khoa Nhi rất tốt, bé khỏe nhanh chóng. Cảm ơn Medicare!"</p>
                <p class="testimonial-author">- Trần Thị Bình -</p>
            </div>
            <div class="testimonial-card" data-aos="fade-up" data-aos-delay="200">
                <i class="fas fa-quote-left"></i>
                <p class="testimonial-text">"Dịch vụ đặt lịch online tiện lợi, không phải chờ đợi lâu. Rất hài lòng!"</p>
                <p class="testimonial-author">- Lê Văn Cường -</p>
            </div>
        </div>
    </div>
</section>

<!-- Footer -->
<footer id="contact" class="footer">
    <div class="container">
        <div class="footer-grid">
            <div class="footer-col">
                <h4><i class="fas fa-heartbeat"></i> Medicare</h4>
                <p>Chăm sóc sức khỏe toàn diện cho bạn và gia đình.</p>
            </div>
            <div class="footer-col">
                <h4>Dịch vụ</h4>
                <a href="#">Đặt khám tại cơ sở</a>
                <a href="#">Đặt khám chuyên khoa</a>
                <a href="#">Gọi video với bác sĩ</a>
                <a href="#">Đặt lịch xét nghiệm</a>
            </div>
            <div class="footer-col">
                <h4>Thông tin liên hệ</h4>
                <a href="#"><i class="fas fa-phone"></i> 1900 2115</a>
                <a href="#"><i class="fas fa-envelope"></i> info@medicare.vn</a>
                <a href="#"><i class="fas fa-map-marker-alt"></i> 123 Đường Láng, Đống Đa, Hà Nội</a>
            </div>
            <div class="footer-col">
                <h4>Theo dõi</h4>
                <div class="social-links">
                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-youtube"></i></a>
                    <a href="#"><i class="fab fa-tiktok"></i></a>
                </div>
            </div>
        </div>
        <div class="copyright">
            <p>&copy; 2026 Medicare - Hệ thống y tế thông minh. All rights reserved.</p>
        </div>
    </div>
</footer>

<!-- Chat AI Widget -->
<div class="chat-widget">
    <div class="chat-button" onclick="toggleChat()">
        <i class="fas fa-robot"></i>
    </div>
    <div class="chat-box" id="chatBox">
        <div class="chat-header">
            <i class="fas fa-robot"></i>
            <strong>Medicare AI Assistant</strong>
        </div>
        <div class="chat-body" id="chatBody">
            <div class="message bot">
                <div class="message-content">
                    👋 Xin chào! Tôi là AI của Medicare. Tôi có thể giúp gì cho bạn hôm nay?
                </div>
            </div>
        </div>
        <div class="chat-input">
            <input type="text" id="chatInput" placeholder="Nhập tin nhắn..." onkeypress="if(event.key==='Enter') sendMessage()">
            <button onclick="sendMessage()"><i class="fas fa-paper-plane"></i></button>
        </div>
    </div>
</div>

<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>
    AOS.init({
        duration: 1000,
        once: true
    });

    let isDark = false;

    function toggleTheme() {
        isDark = !isDark;
        if (isDark) {
            document.body.setAttribute('data-theme', 'dark');
            document.querySelector('.theme-toggle i').className = 'fas fa-sun';
        } else {
            document.body.removeAttribute('data-theme');
            document.querySelector('.theme-toggle i').className = 'fas fa-moon';
        }
    }

    window.addEventListener('scroll', function() {
        const header = document.getElementById('header');
        if (window.scrollY > 50) {
            header.classList.add('scrolled');
        } else {
            header.classList.remove('scrolled');
        }
    });

    function toggleChat() {
        const chatBox = document.getElementById('chatBox');
        chatBox.classList.toggle('active');
    }

    function sendMessage() {
        const input = document.getElementById('chatInput');
        const message = input.value.trim();
        if (!message) return;

        const chatBody = document.getElementById('chatBody');

        const userMsg = document.createElement('div');
        userMsg.className = 'message user';
        userMsg.innerHTML = '<div class="message-content">' + message + '</div>';
        chatBody.appendChild(userMsg);

        input.value = '';
        chatBody.scrollTop = chatBody.scrollHeight;

        setTimeout(() => {
            const botMsg = document.createElement('div');
            botMsg.className = 'message bot';
            let response = '';

            if (message.toLowerCase().includes('khám') || message.toLowerCase().includes('đặt lịch')) {
                response = '🏥 Vui lòng đăng nhập để đặt lịch khám với bác sĩ nhé!';
            } else if (message.toLowerCase().includes('giá') || message.toLowerCase().includes('phí')) {
                response = '💰 Phí khám bệnh: 200.000đ - 500.000đ tùy bác sĩ. Bạn có thể xem chi tiết sau khi đăng nhập.';
            } else if (message.toLowerCase().includes('bác sĩ')) {
                response = '👨‍⚕️ Medicare có đội ngũ bác sĩ hàng đầu với nhiều chuyên khoa: Tim mạch, Nhi, Cơ xương khớp, Mắt, Răng hàm mặt, Thần kinh...';
            } else if (message.toLowerCase().includes('giờ') || message.toLowerCase().includes('thời gian')) {
                response = '🕐 Thời gian làm việc: Thứ 2 - Thứ 7: 7:30 - 17:30. Chủ nhật: 8:00 - 12:00.';
            } else {
                response = '🤖 Cảm ơn bạn đã liên hệ! Vui lòng đăng nhập để được hỗ trợ tốt nhất. Hotline: 1900 2115.';
            }

            botMsg.innerHTML = '<div class="message-content">' + response + '</div>';
            chatBody.appendChild(botMsg);
            chatBody.scrollTop = chatBody.scrollHeight;
        }, 500);
    }

    // ===== SLIDER =====
    let currentSlide = 0;
    const slides = document.querySelectorAll('.slider-slide');
    const dots = document.querySelectorAll('.dot');
    const totalSlides = slides.length;
    let autoSlideInterval;

    function updateSlider() {
        const track = document.getElementById('sliderTrack');
        track.style.transform = 'translateX(-' + (currentSlide * 100) + '%)';
        dots.forEach((dot, index) => {
            dot.classList.toggle('active', index === currentSlide);
        });
    }

    function changeSlide(direction) {
        currentSlide = (currentSlide + direction + totalSlides) % totalSlides;
        updateSlider();
        resetAutoSlide();
    }

    function goToSlide(index) {
        currentSlide = index;
        updateSlider();
        resetAutoSlide();
    }

    function resetAutoSlide() {
        clearInterval(autoSlideInterval);
        autoSlideInterval = setInterval(() => {
            changeSlide(1);
        }, 5000);
    }

    // Start auto slide
    autoSlideInterval = setInterval(() => {
        changeSlide(1);
    }, 5000);

    // Touch support for slider
    let touchStartX = 0;
    let touchEndX = 0;
    const sliderContainer = document.getElementById('sliderContainer');

    sliderContainer.addEventListener('touchstart', (e) => {
        touchStartX = e.changedTouches[0].screenX;
    });

    sliderContainer.addEventListener('touchend', (e) => {
        touchEndX = e.changedTouches[0].screenX;
        const diff = touchStartX - touchEndX;
        if (Math.abs(diff) > 50) {
            if (diff > 0) changeSlide(1);
            else changeSlide(-1);
        }
    });
</script>
</body>
</html>