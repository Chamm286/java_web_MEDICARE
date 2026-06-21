<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Dashboard - Medicare</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: 'Inter', sans-serif;
            background: #f1f5f9;
        }
        /* Sidebar */
        .sidebar {
            position: fixed;
            left: 0;
            top: 0;
            width: 260px;
            height: 100%;
            background: linear-gradient(135deg, #1a5c3e, #0d3e28);
            z-index: 100;
        }
        .sidebar-header {
            padding: 24px;
            text-align: center;
            border-bottom: 1px solid rgba(255,255,255,0.1);
        }
        .sidebar-header h2 { color: white; display: flex; align-items: center; justify-content: center; gap: 8px; }
        .sidebar-header h2 i { color: #ffd700; }
        .nav-menu { list-style: none; padding: 20px 0; }
        .nav-link {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 12px 24px;
            color: rgba(255,255,255,0.8);
            text-decoration: none;
            transition: 0.2s;
        }
        .nav-link:hover, .nav-link.active {
            background: rgba(255,255,255,0.1);
            color: #ffd700;
            border-left: 3px solid #ffd700;
        }
        /* Main */
        .main {
            margin-left: 260px;
            padding: 24px 32px;
        }
        .topbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 28px;
            background: white;
            padding: 16px 24px;
            border-radius: 20px;
        }
        .user-info { display: flex; align-items: center; gap: 16px; }
        .avatar {
            width: 42px;
            height: 42px;
            background: #2ecc71;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
        }
        .logout {
            background: #fee2e2;
            color: #ef4444;
            padding: 8px 20px;
            border-radius: 40px;
            text-decoration: none;
        }
        .welcome-card {
            background: white;
            border-radius: 24px;
            padding: 28px;
            margin-bottom: 28px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.05);
        }
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            margin-bottom: 28px;
        }
        .stat-card {
            background: white;
            border-radius: 20px;
            padding: 20px;
            display: flex;
            align-items: center;
            gap: 16px;
            transition: 0.2s;
        }
        .stat-card:hover { transform: translateY(-3px); box-shadow: 0 8px 20px rgba(0,0,0,0.08); }
        .stat-icon {
            width: 52px;
            height: 52px;
            background: #e8f5e9;
            border-radius: 16px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .stat-icon i { font-size: 24px; color: #2ecc71; }
        .stat-info h3 { font-size: 1.6rem; font-weight: 700; color: #1a5c3e; }
        .table-container {
            background: white;
            border-radius: 20px;
            padding: 20px;
        }
        table { width: 100%; border-collapse: collapse; }
        th, td { padding: 12px 8px; text-align: left; border-bottom: 1px solid #e2e8f0; }
        th { color: #64748b; font-weight: 600; font-size: 0.75rem; }
        .badge {
            padding: 4px 10px;
            border-radius: 30px;
            font-size: 0.7rem;
            background: #e8f5e9;
            color: #2ecc71;
        }
        @media (max-width: 768px) {
            .sidebar { width: 70px; }
            .sidebar-header h2 span, .nav-link span { display: none; }
            .main { margin-left: 70px; }
            .stats-grid { grid-template-columns: 1fr; }
        }
    </style>
</head>
<body>

<div class="sidebar">
    <div class="sidebar-header">
        <h2><i class="fas fa-heartbeat"></i> <span>Medicare</span></h2>
    </div>
    <ul class="nav-menu">
        <li class="nav-item"><a href="#" class="nav-link active"><i class="fas fa-chart-pie"></i> <span>Dashboard</span></a></li>
        <li class="nav-item"><a href="#" class="nav-link"><i class="fas fa-calendar-plus"></i> <span>Đặt lịch</span></a></li>
        <li class="nav-item"><a href="#" class="nav-link"><i class="fas fa-calendar-check"></i> <span>Lịch hẹn</span></a></li>
        <li class="nav-item"><a href="#" class="nav-link"><i class="fas fa-file-alt"></i> <span>Hồ sơ</span></a></li>
    </ul>
</div>

<div class="main">
    <div class="topbar">
        <div><i class="fas fa-bars" style="cursor:pointer; color:#64748b;"></i></div>
        <div class="user-info">
            <div class="avatar"><i class="fas fa-user"></i></div>
            <span><strong>${sessionScope.fullName}</strong></span>
            <a href="${pageContext.request.contextPath}/logout" class="logout"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a>
        </div>
    </div>

    <div class="welcome-card">
        <h2>Xin chào, ${sessionScope.fullName}</h2>
        <p style="margin-top: 8px; color:#64748b;">Quản lý lịch khám và hồ sơ sức khỏe của bạn</p>
    </div>

    <div class="stats-grid">
        <div class="stat-card" onclick="location.href='${pageContext.request.contextPath}/patient/book-appointment'">
            <div class="stat-icon"><i class="fas fa-calendar-plus"></i></div>
            <div class="stat-info"><h3>Đặt lịch</h3><p>Khám bác sĩ ngay</p></div>
        </div>
        <div class="stat-card" onclick="location.href='${pageContext.request.contextPath}/patient/appointments'">
            <div class="stat-icon"><i class="fas fa-calendar-check"></i></div>
            <div class="stat-info"><h3>3</h3><p>Lịch hẹn sắp tới</p></div>
        </div>
        <div class="stat-card">
            <div class="stat-icon"><i class="fas fa-file-alt"></i></div>
            <div class="stat-info"><h3>2</h3><p>Hồ sơ bệnh án</p></div>
        </div>
    </div>

    <div class="table-container">
        <h3 style="margin-bottom: 16px;">Lịch hẹn sắp tới</h3>
        <table>
            <thead><tr><th>Bác sĩ</th><th>Ngày</th><th>Giờ</th><th>Trạng thái</th></tr></thead>
            <tbody>
                <tr><td>BS.CKI Nguyễn Thị Nghiêm</td><td>24/05/2026</td><td>09:00</td><td><span class="badge">Đã xác nhận</span></td></tr>
                <tr><td>BS. Lê Văn Hùng</td><td>28/05/2026</td><td>14:30</td><td><span class="badge">Chờ xác nhận</span></td></tr>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>