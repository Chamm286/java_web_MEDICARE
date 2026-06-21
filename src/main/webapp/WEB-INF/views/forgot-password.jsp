<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quên mật khẩu - Medicare</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
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
        }
        .forgot-box {
            background: white;
            border-radius: 28px;
            width: 100%;
            max-width: 450px;
            padding: 40px;
            text-align: center;
            box-shadow: 0 20px 40px rgba(0,0,0,0.08);
            animation: fadeIn 0.5s ease;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .logo i { font-size: 3rem; color: #2ecc71; margin-bottom: 16px; }
        .logo h1 { font-size: 1.6rem; color: #1a5c3e; }
        .desc { color: #64748b; margin: 16px 0 24px; font-size: 0.9rem; }
        .input-group {
            position: relative;
            margin-bottom: 24px;
        }
        .input-group i {
            position: absolute;
            left: 16px;
            top: 50%;
            transform: translateY(-50%);
            color: #94a3b8;
        }
        .input-group input {
            width: 100%;
            padding: 14px 16px 14px 45px;
            border: 1px solid #e2e8f0;
            border-radius: 40px;
            font-size: 0.9rem;
            outline: none;
            transition: 0.2s;
        }
        .input-group input:focus {
            border-color: #2ecc71;
            box-shadow: 0 0 0 3px rgba(46,204,113,0.1);
        }
        .btn-send {
            width: 100%;
            padding: 14px;
            background: #2ecc71;
            color: white;
            border: none;
            border-radius: 40px;
            font-weight: 600;
            cursor: pointer;
            transition: 0.2s;
        }
        .btn-send:hover { background: #1a5c3e; transform: translateY(-2px); }
        .back-link {
            margin-top: 20px;
            display: inline-block;
            color: #2ecc71;
            text-decoration: none;
            font-size: 0.85rem;
        }
        .alert {
            padding: 12px;
            border-radius: 12px;
            margin-bottom: 20px;
            font-size: 0.85rem;
        }
        .alert-success { background: #d4edda; color: #155724; }
        .alert-danger { background: #fee2e2; color: #c00; }
    </style>
</head>
<body>
<div class="forgot-box">
    <div class="logo">
        <i class="fas fa-heartbeat"></i>
        <h1>Quên mật khẩu?</h1>
    </div>
    <p class="desc">Nhập email của bạn, chúng tôi sẽ gửi hướng dẫn đặt lại mật khẩu.</p>

    <% if(request.getAttribute("message") != null) { %>
        <div class="alert alert-success"><i class="fas fa-check-circle"></i> <%= request.getAttribute("message") %></div>
    <% } %>
    <% if(request.getAttribute("error") != null) { %>
        <div class="alert alert-danger"><i class="fas fa-exclamation-triangle"></i> <%= request.getAttribute("error") %></div>
    <% } %>

    <form action="${pageContext.request.contextPath}/forgot-password" method="post">
        <div class="input-group">
            <i class="fas fa-envelope"></i>
            <input type="email" name="email" placeholder="Địa chỉ email" required>
        </div>
        <button type="submit" class="btn-send">Gửi yêu cầu</button>
    </form>
    <a href="login" class="back-link"><i class="fas fa-arrow-left"></i> Quay lại đăng nhập</a>
</div>
</body>
</html>