<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lịch hẹn của tôi</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: 'Inter', sans-serif;
            background: #f1f5f9;
            padding: 40px 20px;
        }
        .container { max-width: 900px; margin: 0 auto; }
        .card {
            background: white;
            border-radius: 24px;
            padding: 28px;
            margin-bottom: 20px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        }
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .badge {
            padding: 6px 14px;
            border-radius: 30px;
            font-size: 0.75rem;
            font-weight: 500;
        }
        .badge-success { background: #e8f5e9; color: #2ecc71; }
        .badge-warning { background: #fef3c7; color: #f59e0b; }
        .back-link {
            display: inline-block;
            margin-top: 20px;
            color: #2ecc71;
            text-decoration: none;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="card">
        <div class="header">
            <h2><i class="fas fa-calendar-alt"></i> Lịch hẹn của tôi</h2>
            <a href="${pageContext.request.contextPath}/patient/dashboard" style="color:#2ecc71;">← Quay lại</a>
        </div>
        
        <!-- Giả lập dữ liệu -->
        <div style="padding: 12px; border-bottom: 1px solid #e2e8f0; display: flex; justify-content: space-between; align-items: center;">
            <div><strong>BS.CKI Nguyễn Thị Nghiêm</strong><br><small>Tim mạch - 24/05/2026 09:00</small></div>
            <span class="badge badge-success">Đã xác nhận</span>
        </div>
        <div style="padding: 12px; border-bottom: 1px solid #e2e8f0; display: flex; justify-content: space-between; align-items: center;">
            <div><strong>BS. Lê Văn Hùng</strong><br><small>Cơ xương khớp - 28/05/2026 14:30</small></div>
            <span class="badge badge-warning">Chờ xác nhận</span>
        </div>
        <div style="padding: 12px; display: flex; justify-content: space-between; align-items: center;">
            <div><strong>BS.CKI Phạm Thị Lan</strong><br><small>Nhi khoa - 01/06/2026 10:00</small></div>
            <span class="badge badge-warning">Chờ xác nhận</span>
        </div>
    </div>
    <a href="${pageContext.request.contextPath}/patient/book-appointment" class="back-link"><i class="fas fa-plus-circle"></i> Đặt lịch mới</a>
</div>
</body>
</html>