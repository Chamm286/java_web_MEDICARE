<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${title}</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Inter', sans-serif; background: #f0f2f5; }
        .app { display: flex; min-height: 100vh; }
        .sidebar {
            width: 280px;
            background: linear-gradient(135deg, #1a5c3e, #0d3e28);
            color: white;
            position: fixed;
            height: 100vh;
        }
        .sidebar-header { padding: 25px; text-align: center; border-bottom: 1px solid rgba(255,255,255,0.1); }
        .sidebar-header h2 { font-size: 1.5rem; display: flex; align-items: center; justify-content: center; gap: 8px; }
        .nav-menu { list-style: none; padding: 20px 0; }
        .nav-link {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 12px 25px;
            color: rgba(255,255,255,0.8);
            text-decoration: none;
        }
        .nav-link:hover, .nav-link.active { background: rgba(255,255,255,0.1); color: white; }
        .main-content { flex: 1; margin-left: 280px; }
        .top-bar {
            background: white;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        }
        .logout-btn {
            background: #dc3545;
            color: white;
            padding: 8px 20px;
            border-radius: 30px;
            text-decoration: none;
        }
        .content { padding: 30px; }
        .welcome-card {
            background: white;
            border-radius: 15px;
            padding: 30px;
            margin-bottom: 30px;
        }
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
            gap: 25px;
            margin-bottom: 30px;
        }
        .stat-card {
            background: white;
            border-radius: 15px;
            padding: 20px;
            display: flex;
            align-items: center;
            gap: 15px;
        }
        .stat-icon {
            width: 60px;
            height: 60px;
            background: linear-gradient(135deg, #2ecc71, #1a5c3e);
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .stat-icon i { font-size: 28px; color: white; }
        .stat-info h3 { font-size: 28px; font-weight: 700; color: #1a5c3e; }
        .table-container {
            background: white;
            border-radius: 15px;
            padding: 20px;
        }
        .table-title { font-size: 1.2rem; margin-bottom: 20px; border-bottom: 2px solid #2ecc71; padding-bottom: 10px; }
        table { width: 100%; border-collapse: collapse; }
        th, td { padding: 12px; text-align: left; border-bottom: 1px solid #eee; }
        th { background: #f8f9fa; }
    </style>
</head>
<body>
<div class="app">
    <div class="sidebar">
        <div class="sidebar-header">
            <h2><i class="fas fa-heartbeat"></i> <span>Medicare</span></h2>
            <p>Doctor Panel</p>
        </div>
        <ul class="nav-menu">
            <li><a href="${pageContext.request.contextPath}/doctor/dashboard" class="nav-link ${activePage == 'dashboard' ? 'active' : ''}"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
            <li><a href="${pageContext.request.contextPath}/doctor/appointments" class="nav-link ${activePage == 'appointments' ? 'active' : ''}"><i class="fas fa-calendar-check"></i> Lịch khám</a></li>
            <li><a href="${pageContext.request.contextPath}/doctor/patients" class="nav-link ${activePage == 'patients' ? 'active' : ''}"><i class="fas fa-users"></i> Bệnh nhân</a></li>
        </ul>
    </div>

    <div class="main-content">
        <div class="top-bar">
            <div>Xin chào, ${sessionScope.fullName}</div>
            <a href="${pageContext.request.contextPath}/logout" class="logout-btn"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a>
        </div>

        <div class="content">
            <div class="welcome-card">
                <h1>Chào mừng Bác sĩ ${sessionScope.fullName}!</h1>
                <p>Hôm nay là một ngày mới, chúc bác sĩ có một ngày làm việc hiệu quả.</p>
            </div>

            <div class="stats-grid">
                <div class="stat-card"><div class="stat-icon"><i class="fas fa-calendar-check"></i></div><div class="stat-info"><h3>8</h3><p>Lịch hẹn hôm nay</p></div></div>
                <div class="stat-card"><div class="stat-icon"><i class="fas fa-users"></i></div><div class="stat-info"><h3>124</h3><p>Bệnh nhân đã khám</p></div></div>
                <div class="stat-card"><div class="stat-icon"><i class="fas fa-star"></i></div><div class="stat-info"><h3>4.9</h3><p>Đánh giá</p></div></div>
            </div>

            <div class="table-container">
                <div class="table-title">Lịch khám hôm nay</div>
                <table>
                    <thead><tr><th>Thời gian</th><th>Bệnh nhân</th><th>Triệu chứng</th><th>Trạng thái</th></tr></thead>
                    <tbody>
                        <tr><td>09:00</td><td>Nguyễn Văn An</td><td>Đau ngực, khó thở</td><td>Đã đến</td></tr>
                        <tr><td>10:30</td><td>Trần Thị Bình</td><td>Ho, sốt</td><td>Chờ khám</td></tr>
                        <tr><td>14:00</td><td>Lê Văn Cường</td><td>Đau khớp gối</td><td>Chưa đến</td></tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>