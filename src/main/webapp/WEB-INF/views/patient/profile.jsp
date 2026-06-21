<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>Hồ sơ của tôi - Medicare</title>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<style>
    *{margin:0;padding:0;box-sizing:border-box}
    body{font-family:'Inter',sans-serif;background:#f1f5f9;padding-top:80px}
    .container{max-width:800px;margin:0 auto;padding:20px}
    .card{background:white;border-radius:24px;padding:32px;box-shadow:0 4px 12px rgba(0,0,0,0.05)}
    .avatar{width:100px;height:100px;background:#2ecc71;border-radius:50%;display:flex;align-items:center;justify-content:center;margin:0 auto 20px}
    .avatar i{font-size:3rem;color:white}
    .info-row{display:flex;padding:12px 0;border-bottom:1px solid #e2e8f0}
    .info-label{width:120px;font-weight:600;color:#64748b}
    .info-value{flex:1;color:#1e293b}
    .btn-edit{background:#2ecc71;color:white;padding:12px 24px;border:none;border-radius:40px;cursor:pointer;margin-top:20px}
</style>
</head>
<body>
<jsp:include page="../common/header.jsp" />
<div class="container">
    <div class="card">
        <div class="avatar"><i class="fas fa-user"></i></div>
        <h2 style="text-align:center; margin-bottom:24px;">Hồ sơ của tôi</h2>
        <div class="info-row"><div class="info-label">Họ tên</div><div class="info-value">${sessionScope.fullName}</div></div>
        <div class="info-row"><div class="info-label">Email</div><div class="info-value">${sessionScope.user.email}</div></div>
        <div class="info-row"><div class="info-label">Số điện thoại</div><div class="info-value">${sessionScope.user.phone}</div></div>
        <button class="btn-edit" onclick="alert('Chức năng đang phát triển')"><i class="fas fa-edit"></i> Chỉnh sửa</button>
    </div>
</div>
<jsp:include page="../common/footer.jsp" />
</body>
</html>