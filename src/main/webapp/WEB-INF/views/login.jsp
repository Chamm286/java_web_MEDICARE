<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập - Medicare</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #e8f5e9 0%, #c8e6d9 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 80px 20px;
        }
        .login-container {
            background: white;
            border-radius: 30px;
            box-shadow: 0 25px 50px rgba(0,0,0,0.15);
            width: 100%;
            max-width: 480px;
            padding: 40px;
            animation: slideUp 0.6s ease;
        }
        @keyframes slideUp {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .logo { text-align: center; margin-bottom: 30px; }
        .logo i { font-size: 3rem; color: #2ecc71; }
        .logo h1 { font-size: 1.8rem; color: #1a5c3e; margin-top: 10px; }
        .logo p { color: #6c757d; font-size: 0.9rem; margin-top: 5px; }
        .input-group {
            position: relative;
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }
        .input-group i {
            position: absolute;
            left: 15px;
            color: #1a5c3e;
            font-size: 1rem;
        }
        .input-group input {
            width: 100%;
            padding: 14px 15px 14px 45px;
            border: 2px solid #e0e0e0;
            border-radius: 12px;
            font-size: 0.95rem;
            outline: none;
            transition: 0.3s;
        }
        .input-group input:focus {
            border-color: #2ecc71;
            box-shadow: 0 0 0 3px rgba(46,204,113,0.1);
        }
        .password-wrapper { position: relative; width: 100%; }
        .toggle-password {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            color: #6c757d;
            z-index: 10;
        }
        .form-options {
            display: flex;
            justify-content: space-between;
            margin-bottom: 25px;
            font-size: 0.85rem;
        }
        .forgot-link { color: #2ecc71; text-decoration: none; }
        .btn-login {
            width: 100%;
            padding: 14px;
            background: linear-gradient(45deg, #2ecc71, #1a5c3e);
            color: white;
            border: none;
            border-radius: 12px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: 0.3s;
        }
        .btn-login:hover { transform: translateY(-2px); box-shadow: 0 10px 20px rgba(46,204,113,0.3); }
        .register-link { text-align: center; margin-top: 25px; padding-top: 20px; border-top: 1px solid #eee; }
        .register-link a { color: #2ecc71; text-decoration: none; font-weight: 600; }
        .alert {
            padding: 12px 15px;
            border-radius: 10px;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .alert-danger { background: #fee; color: #c00; border-left: 4px solid #c00; }
        .alert-success { background: #e8f5e9; color: #1a5c3e; border-left: 4px solid #2ecc71; }
        .demo-info {
            background: #f8f9fa;
            border-radius: 12px;
            padding: 15px;
            margin-top: 25px;
            font-size: 0.8rem;
        }
        .demo-info p { margin: 5px 0; color: #6c757d; }
        .demo-info strong { color: #1a5c3e; }
        .demo-info .role-badge {
            display: inline-block;
            padding: 2px 8px;
            border-radius: 10px;
            font-size: 0.65rem;
            font-weight: 600;
        }
        .role-admin { background: #f44336; color: white; }
        .role-doctor { background: #2196F3; color: white; }
        .role-patient { background: #4CAF50; color: white; }
    </style>
</head>
<body>
<div class="login-container">
    <div class="logo">
        <i class="fas fa-heartbeat"></i>
        <h1>Medicare</h1>
        <p>Hệ thống đặt lịch khám bệnh thông minh</p>
    </div>

    <% if(request.getAttribute("error") != null) { %>
        <div class="alert alert-danger"><i class="fas fa-exclamation-circle"></i> <%= request.getAttribute("error") %></div>
    <% } %>
    
    <% if(request.getAttribute("success") != null) { %>
        <div class="alert alert-success"><i class="fas fa-check-circle"></i> <%= request.getAttribute("success") %></div>
    <% } %>

    <form action="${pageContext.request.contextPath}/login" method="post">
        <div class="input-group">
            <i class="fas fa-envelope"></i>
            <input type="email" name="email" placeholder="Email đăng nhập" required autofocus>
        </div>
        <div class="input-group">
            <i class="fas fa-lock"></i>
            <div class="password-wrapper">
                <input type="password" name="password" id="password" placeholder="Mật khẩu" required>
                <i class="fas fa-eye toggle-password" onclick="togglePassword()"></i>
            </div>
        </div>
        <div class="form-options">
            <label><input type="checkbox" name="remember"> Ghi nhớ</label>
            <a href="forgot-password" class="forgot-link">Quên mật khẩu?</a>
        </div>
        <button type="submit" class="btn-login"><i class="fas fa-sign-in-alt"></i> Đăng nhập</button>
    </form>
    <div class="register-link">
        Chưa có tài khoản? <a href="register">Đăng ký ngay</a>
    </div>
    <div class="demo-info">
        <p><strong>📋 Tài khoản demo</strong></p>
        <p>👑 <span class="role-badge role-admin">ADMIN</span> <strong>chamm4930@gmail.com</strong> / 12345678</p>
        <p>👨‍⚕️ <span class="role-badge role-doctor">DOCTOR</span> <strong>nguyenthinghiem@medicare.vn</strong> / 12345678</p>
        <p>👨‍⚕️ <span class="role-badge role-doctor">DOCTOR</span> <strong>tranthihuong@medicare.vn</strong> / 12345678</p>
        <p>👤 <span class="role-badge role-patient">PATIENT</span> <strong>tranvanbinh@gmail.com</strong> / 12345678</p>
        <p>👤 <span class="role-badge role-patient">PATIENT</span> <strong>nguyenvanan@gmail.com</strong> / 12345678</p>
    </div>
</div>

<script>
    function togglePassword() {
        const password = document.getElementById('password');
        const icon = document.querySelector('.toggle-password');
        if (password.type === 'password') {
            password.type = 'text';
            icon.classList.remove('fa-eye');
            icon.classList.add('fa-eye-slash');
        } else {
            password.type = 'password';
            icon.classList.remove('fa-eye-slash');
            icon.classList.add('fa-eye');
        }
    }
</script>
</body>
</html>