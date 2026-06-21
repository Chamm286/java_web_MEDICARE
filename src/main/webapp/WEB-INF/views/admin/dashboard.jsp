<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Medicare</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Inter', sans-serif;
            background: #f1f5f9;
            overflow-x: hidden;
        }
        /* Sidebar */
        .sidebar {
            position: fixed;
            left: 0;
            top: 0;
            width: 260px;
            height: 100%;
            background: #fff;
            box-shadow: 2px 0 12px rgba(0,0,0,0.05);
            z-index: 100;
        }
        .sidebar-header {
            padding: 20px 24px;
            border-bottom: 1px solid #e2e8f0;
            margin-bottom: 16px;
        }
        .sidebar-header h2 {
            font-size: 1.4rem;
            font-weight: 700;
            display: flex;
            align-items: center;
            gap: 8px;
        }
        .sidebar-header h2 i { color: #2ecc71; }
        .nav-item { margin-bottom: 4px; }
        .nav-link {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 12px 24px;
            color: #475569;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.2s;
            border-left: 3px solid transparent;
        }
        .nav-link i { width: 20px; }
        .nav-link:hover, .nav-link.active {
            background: #e8f5e9;
            color: #2ecc71;
            border-left-color: #2ecc71;
        }
        /* Main */
        .main {
            margin-left: 260px;
            padding: 20px 28px;
        }
        /* Topbar */
        .topbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 28px;
        }
        .page-title h1 {
            font-size: 1.6rem;
            font-weight: 600;
            color: #1e293b;
        }
        .page-title p {
            font-size: 0.85rem;
            color: #64748b;
            margin-top: 4px;
        }
        .user-area {
            display: flex;
            align-items: center;
            gap: 20px;
        }
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
            padding: 8px 18px;
            border-radius: 40px;
            text-decoration: none;
            font-size: 0.85rem;
            font-weight: 500;
            transition: 0.2s;
        }
        .logout:hover { background: #fecaca; }
        /* Stats Cards - 5 màu khác nhau */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(5, 1fr);
            gap: 20px;
            margin-bottom: 28px;
        }
        .stat-card {
            border-radius: 20px;
            padding: 20px;
            color: white;
            transition: 0.2s;
            cursor: pointer;
        }
        .stat-card:hover { transform: translateY(-4px); }
        .stat-card .stat-value { font-size: 1.8rem; font-weight: 700; }
        .stat-card .stat-label { font-size: 0.8rem; opacity: 0.9; margin-top: 6px; }
        .stat-card i { font-size: 2rem; opacity: 0.3; float: right; }
        .card-1 { background: linear-gradient(135deg, #2ecc71, #1a5c3e); }
        .card-2 { background: linear-gradient(135deg, #3498db, #1e5799); }
        .card-3 { background: linear-gradient(135deg, #e67e22, #c0392b); }
        .card-4 { background: linear-gradient(135deg, #f1c40f, #f39c12); }
        .card-5 { background: linear-gradient(135deg, #9b59b6, #8e44ad); }
        /* Charts */
        .charts-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            margin-bottom: 28px;
        }
        .chart-box {
            background: #fff;
            border-radius: 20px;
            padding: 20px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.05);
        }
        .chart-title {
            font-weight: 600;
            margin-bottom: 16px;
            font-size: 0.9rem;
            color: #1e293b;
            display: flex;
            align-items: center;
            gap: 8px;
        }
        canvas { max-height: 260px; width: 100%; }
        /* Table */
        .table-wrapper {
            background: #fff;
            border-radius: 20px;
            padding: 20px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.05);
        }
        .table-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .table-header h3 { font-size: 1rem; font-weight: 600; }
        .search-input {
            padding: 8px 16px;
            border: 1px solid #e2e8f0;
            border-radius: 30px;
            font-size: 0.8rem;
            width: 220px;
            outline: none;
        }
        .search-input:focus { border-color: #2ecc71; }
        table { width: 100%; border-collapse: collapse; }
        th { text-align: left; padding: 14px 8px; font-size: 0.75rem; font-weight: 600; color: #64748b; border-bottom: 1px solid #e2e8f0; }
        td { padding: 14px 8px; font-size: 0.85rem; border-bottom: 1px solid #f1f5f9; }
        .badge {
            padding: 4px 10px;
            border-radius: 30px;
            font-size: 0.7rem;
            font-weight: 500;
        }
        .badge-success { background: #e8f5e9; color: #2ecc71; }
        .badge-warning { background: #fef3c7; color: #f59e0b; }
        .action-group button {
            background: none;
            border: none;
            cursor: pointer;
            padding: 6px;
            margin: 0 4px;
            border-radius: 8px;
            color: #94a3b8;
            transition: 0.2s;
        }
        .action-group button:hover { background: #f1f5f9; color: #2ecc71; }
        @media (max-width: 1100px) { .stats-grid { grid-template-columns: repeat(3,1fr); } }
        @media (max-width: 900px) { .stats-grid { grid-template-columns: repeat(2,1fr); } .charts-row { grid-template-columns: 1fr; } }
        @media (max-width: 768px) { .sidebar { width: 70px; } .sidebar-header h2 span, .nav-link span { display: none; } .main { margin-left: 70px; } .stats-grid { grid-template-columns: 1fr; } }
    </style>
</head>
<body>

<div class="sidebar">
    <div class="sidebar-header">
        <h2><i class="fas fa-heartbeat"></i> <span>Medicare</span></h2>
    </div>
    <div class="nav-item"><a href="#" class="nav-link active"><i class="fas fa-chart-pie"></i> <span>Dashboard</span></a></div>
    <div class="nav-item"><a href="#" class="nav-link"><i class="fas fa-user-md"></i> <span>Bác sĩ</span></a></div>
    <div class="nav-item"><a href="#" class="nav-link"><i class="fas fa-users"></i> <span>Bệnh nhân</span></a></div>
    <div class="nav-item"><a href="#" class="nav-link"><i class="fas fa-calendar-alt"></i> <span>Lịch hẹn</span></a></div>
    <div class="nav-item"><a href="#" class="nav-link"><i class="fas fa-chart-line"></i> <span>Báo cáo</span></a></div>
</div>

<div class="main">
    <div class="topbar">
        <div class="page-title">
            <h1>Xin chào, ${sessionScope.fullName}</h1>
            <p>Đây là tổng quan hệ thống hôm nay</p>
        </div>
        <div class="user-area">
            <div class="avatar"><i class="fas fa-user"></i></div>
            <a href="${pageContext.request.contextPath}/logout" class="logout"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a>
        </div>
    </div>

    <!-- 5 cards màu -->
    <div class="stats-grid">
        <div class="stat-card card-1" onclick="alert('Xem chi tiết bác sĩ')">
            <i class="fas fa-user-md"></i>
            <div class="stat-value">${stats.totalDoctors != null ? stats.totalDoctors : 8}</div>
            <div class="stat-label">Bác sĩ</div>
        </div>
        <div class="stat-card card-2" onclick="alert('Xem chi tiết bệnh nhân')">
            <i class="fas fa-users"></i>
            <div class="stat-value">${stats.totalPatients != null ? stats.totalPatients : 124}</div>
            <div class="stat-label">Bệnh nhân</div>
        </div>
        <div class="stat-card card-3" onclick="alert('Xem lịch hẹn hôm nay')">
            <i class="fas fa-calendar-check"></i>
            <div class="stat-value">${stats.todayAppointments != null ? stats.todayAppointments : 18}</div>
            <div class="stat-label">Lịch hẹn hôm nay</div>
        </div>
        <div class="stat-card card-4" onclick="alert('Xem doanh thu')">
            <i class="fas fa-chart-line"></i>
            <div class="stat-value"><fmt:formatNumber value="${stats.monthlyRevenue != null ? stats.monthlyRevenue : 0}" type="currency" currencySymbol="₫" groupingUsed="true" maxFractionDigits="0"/></div>
            <div class="stat-label">Doanh thu tháng</div>
        </div>
        <div class="stat-card card-5" onclick="alert('Xem đánh giá')">
            <i class="fas fa-star"></i>
            <div class="stat-value">${stats.avgRating != null ? stats.avgRating : 4.8}</div>
            <div class="stat-label">Đánh giá</div>
        </div>
    </div>

    <!-- Charts -->
    <div class="charts-row">
        <div class="chart-box">
            <div class="chart-title"><i class="fas fa-chart-bar" style="color:#2ecc71;"></i> Doanh thu 6 tháng (triệu ₫)</div>
            <canvas id="revenueChart"></canvas>
        </div>
        <div class="chart-box">
            <div class="chart-title"><i class="fas fa-chart-pie" style="color:#2ecc71;"></i> Top bác sĩ theo lịch hẹn</div>
            <canvas id="doctorChart"></canvas>
        </div>
    </div>

    <!-- Bảng lịch hẹn -->
    <div class="table-wrapper">
        <div class="table-header">
            <h3><i class="fas fa-history"></i> Lịch hẹn gần đây</h3>
            <input type="text" id="searchInput" class="search-input" placeholder="🔍 Tìm kiếm...">
        </div>
        <table>
            <thead>
                <tr><th>Bệnh nhân</th><th>Bác sĩ</th><th>Ngày</th><th>Giờ</th><th>Trạng thái</th><th>Thao tác</th></tr>
            </thead>
            <tbody id="appointmentTable">
                <c:forEach items="${recentAppointments}" var="app">
                    <tr>
                        <td>${app.patient}</td><td>${app.doctor}</td><td>${app.date}</td><td>${app.time}</td>
                        <td><span class="badge badge-success">${app.status}</span></td>
                        <td class="action-group">
                            <button onclick="alert('Sửa lịch hẹn')"><i class="fas fa-edit"></i></button>
                            <button onclick="alert('Xóa lịch hẹn')"><i class="fas fa-trash-alt"></i></button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<script>
    // Chart doanh thu
    new Chart(document.getElementById('revenueChart'), {
        type: 'bar',
        data: { labels: ['T1', 'T2', 'T3', 'T4', 'T5', 'T6'], datasets: [{ label: 'Triệu ₫', data: [125, 142, 168, 185, 210, 245], backgroundColor: '#2ecc71', borderRadius: 8, barPercentage: 0.6 }] },
        options: { responsive: true, maintainAspectRatio: true, plugins: { legend: { display: false } }, scales: { y: { grid: { color: '#e2e8f0' } }, x: { grid: { display: false } } } }
    });
    // Chart bác sĩ
    new Chart(document.getElementById('doctorChart'), {
        type: 'doughnut',
        data: { labels: ['BS. Nghiêm', 'BS. Tùng', 'BS. Lan', 'BS. Hùng'], datasets: [{ data: [145, 128, 112, 98], backgroundColor: ['#2ecc71', '#3498db', '#f39c12', '#e74c3c'], borderWidth: 0 }] },
        options: { responsive: true, maintainAspectRatio: true, plugins: { legend: { position: 'bottom', labels: { boxWidth: 10, font: { size: 11 } } } } }
    });
    // Tìm kiếm debounce
    let searchTimeout;
    document.getElementById('searchInput').addEventListener('keyup', function() {
        clearTimeout(searchTimeout);
        searchTimeout = setTimeout(() => {
            const term = this.value.toLowerCase();
            document.querySelectorAll('#appointmentTable tr').forEach(row => {
                row.style.display = row.innerText.toLowerCase().includes(term) ? '' : 'none';
            });
        }, 200);
    });
</script>
</body>
</html>