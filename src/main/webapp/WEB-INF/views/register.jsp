<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng ký - Medicare</title>
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
            padding: 40px 20px;
        }
        .register-container {
            background: white;
            border-radius: 30px;
            box-shadow: 0 25px 50px rgba(0,0,0,0.15);
            width: 100%;
            max-width: 550px;
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
        .form-group { margin-bottom: 20px; }
        .input-group {
            position: relative;
            display: flex;
            align-items: center;
        }
        .input-group i {
            position: absolute;
            left: 15px;
            color: #1a5c3e;
        }
        .input-group input, .input-group select {
            width: 100%;
            padding: 12px 15px 12px 45px;
            border: 2px solid #e0e0e0;
            border-radius: 12px;
            font-size: 0.9rem;
            transition: 0.3s;
            outline: none;
        }
        .input-group input:focus, .input-group select:focus {
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
        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
        }
        .btn-register {
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
            margin-top: 10px;
        }
        .btn-register:hover { transform: translateY(-2px); box-shadow: 0 10px 20px rgba(46,204,113,0.3); }
        .login-link { text-align: center; margin-top: 25px; padding-top: 20px; border-top: 1px solid #eee; }
        .login-link a { color: #2ecc71; text-decoration: none; font-weight: 600; }
        .alert {
            padding: 12px 15px;
            border-radius: 10px;
            margin-bottom: 20px;
            font-size: 0.85rem;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .alert-danger { background: #fee; color: #c00; border-left: 4px solid #c00; }
        .alert-success { background: #e8f5e9; color: #1a5c3e; border-left: 4px solid #2ecc71; }
        @media (max-width: 600px) {
            .form-row { grid-template-columns: 1fr; gap: 0; }
            .register-container { padding: 30px 25px; }
        }
    </style>
</head>
<body>
<div class="register-container">
    <div class="logo">
        <i class="fas fa-heartbeat"></i>
        <h1>Đăng ký tài khoản</h1>
    </div>

    <% if(request.getAttribute("error") != null) { %>
        <div class="alert alert-danger"><i class="fas fa-exclamation-circle"></i> <%= request.getAttribute("error") %></div>
    <% } %>

    <form action="${pageContext.request.contextPath}/register" method="post" id="registerForm">
        <div class="form-group">
            <div class="input-group">
                <i class="fas fa-user"></i>
                <input type="text" name="username" placeholder="Tên đăng nhập" required>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group">
                <div class="input-group">
                    <i class="fas fa-lock"></i>
                    <div class="password-wrapper">
                        <input type="password" name="password" id="password" placeholder="Mật khẩu (>=8 ký tự)" required>
                        <i class="fas fa-eye toggle-password" onclick="togglePassword('password')"></i>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="input-group">
                    <i class="fas fa-check-circle"></i>
                    <div class="password-wrapper">
                        <input type="password" name="confirmPassword" id="confirmPassword" placeholder="Xác nhận mật khẩu" required>
                        <i class="fas fa-eye toggle-password" onclick="togglePassword('confirmPassword')"></i>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group">
                <div class="input-group">
                    <i class="fas fa-id-card"></i>
                    <input type="text" name="fullName" placeholder="Họ và tên" required>
                </div>
            </div>
            <div class="form-group">
                <div class="input-group">
                    <i class="fas fa-envelope"></i>
                    <input type="email" name="email" placeholder="Email" required>
                </div>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group">
                <div class="input-group">
                    <i class="fas fa-phone"></i>
                    <input type="tel" name="phone" placeholder="Số điện thoại" required>
                </div>
            </div>
            <div class="form-group">
                <div class="input-group">
                    <i class="fas fa-calendar"></i>
                    <input type="date" name="dob" required>
                </div>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group">
                <div class="input-group">
                    <i class="fas fa-venus-mars"></i>
                    <select name="gender">
                        <option value="MALE">Nam</option>
                        <option value="FEMALE">Nữ</option>
                        <option value="OTHER">Khác</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <div class="input-group">
                    <i class="fas fa-map-marker-alt"></i>
                    <input type="text" name="address" placeholder="Địa chỉ">
                </div>
            </div>
        </div>
        <button type="submit" class="btn-register">Đăng ký</button>
    </form>
    <div class="login-link">
        Đã có tài khoản? <a href="login">Đăng nhập ngay</a>
    </div>
</div>

<script>
    function togglePassword(fieldId) {
        const field = document.getElementById(fieldId);
        const icon = field.nextElementSibling;
        if (field.type === 'password') {
            field.type = 'text';
            icon.classList.remove('fa-eye');
            icon.classList.add('fa-eye-slash');
        } else {
            field.type = 'password';
            icon.classList.remove('fa-eye-slash');
            icon.classList.add('fa-eye');
        }
    }
</script>
</body>
</html>