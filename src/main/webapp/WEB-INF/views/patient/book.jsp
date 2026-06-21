<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đặt Lịch Khám - Medicare</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: 'Inter', sans-serif;
            background: #f1f5f9;
            min-height: 100vh;
            padding: 20px;
        }
        .container { max-width: 1200px; margin: 0 auto; }
        
        /* Navbar */
        .navbar {
            background: white;
            padding: 16px 32px;
            border-radius: 16px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.05);
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 24px;
        }
        .navbar .logo {
            font-size: 1.5rem;
            font-weight: 700;
            color: #1a5c3e;
        }
        .navbar .logo i { color: #2ecc71; margin-right: 8px; }
        .navbar .user-info {
            display: flex;
            align-items: center;
            gap: 16px;
        }
        .navbar .user-info .avatar {
            width: 40px;
            height: 40px;
            background: #2ecc71;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
        }
        .navbar .user-info .logout {
            background: #fee2e2;
            color: #ef4444;
            padding: 8px 16px;
            border-radius: 40px;
            text-decoration: none;
            font-size: 0.85rem;
        }
        .navbar .nav-links a {
            color: #64748b;
            text-decoration: none;
            margin: 0 16px;
            font-size: 0.9rem;
            padding: 8px 0;
            border-bottom: 2px solid transparent;
        }
        .navbar .nav-links a.active {
            color: #1a5c3e;
            border-bottom-color: #2ecc71;
        }

        /* Title */
        .page-title {
            font-size: 1.8rem;
            font-weight: 700;
            color: #1a5c3e;
            margin-bottom: 8px;
        }
        .page-subtitle {
            color: #64748b;
            margin-bottom: 24px;
        }

        /* Doctor Grid */
        .doctor-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 20px;
            margin-bottom: 32px;
        }
        .doctor-card {
            background: white;
            border-radius: 16px;
            padding: 24px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.05);
            cursor: pointer;
            transition: 0.3s;
            border: 2px solid transparent;
            text-align: center;
        }
        .doctor-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 8px 24px rgba(0,0,0,0.08);
        }
        .doctor-card.selected {
            border-color: #2ecc71;
            background: #f0fdf4;
        }
        .doctor-card .avatar {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            background: #e8f5e9;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 12px;
            font-size: 2rem;
            color: #1a5c3e;
        }
        .doctor-card h3 { font-size: 1rem; color: #1a5c3e; }
        .doctor-card .specialty { color: #64748b; font-size: 0.85rem; }
        .doctor-card .fee { color: #2ecc71; font-weight: 600; font-size: 0.9rem; margin-top: 8px; }
        .doctor-card .exp { color: #64748b; font-size: 0.8rem; }
        .doctor-card .check-mark {
            display: none;
            color: #2ecc71;
            margin-top: 8px;
        }
        .doctor-card.selected .check-mark { display: block; }

        /* Booking Form */
        .booking-form {
            background: white;
            border-radius: 16px;
            padding: 32px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.05);
        }
        .booking-form h2 {
            font-size: 1.3rem;
            color: #1a5c3e;
            margin-bottom: 20px;
        }
        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }
        @media (max-width: 600px) { .form-row { grid-template-columns: 1fr; } }
        .form-group { margin-bottom: 16px; }
        .form-group label {
            display: block;
            font-weight: 600;
            font-size: 0.85rem;
            margin-bottom: 6px;
            color: #334155;
        }
        .form-group label i { color: #2ecc71; margin-right: 6px; }
        .form-group input, .form-group textarea {
            width: 100%;
            padding: 10px 14px;
            border: 1px solid #e2e8f0;
            border-radius: 10px;
            font-size: 0.9rem;
            outline: none;
            transition: 0.3s;
            background: #f8fafc;
        }
        .form-group input:focus, .form-group textarea:focus {
            border-color: #2ecc71;
            box-shadow: 0 0 0 3px rgba(46,204,113,0.1);
            background: white;
        }
        .form-group textarea { resize: vertical; min-height: 60px; }
        .btn-submit {
            padding: 12px 32px;
            background: linear-gradient(135deg, #2ecc71, #1a5c3e);
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: 0.3s;
        }
        .btn-submit:hover { transform: translateY(-2px); box-shadow: 0 8px 20px rgba(46,204,113,0.3); }

        .alert {
            padding: 12px 16px;
            border-radius: 10px;
            margin-bottom: 16px;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .alert-danger { background: #fee; color: #c00; border-left: 4px solid #c00; }
        .alert-success { background: #e8f5e9; color: #1a5c3e; border-left: 4px solid #2ecc71; }

        .selected-doctor-info {
            background: #f0fdf4;
            border-radius: 10px;
            padding: 12px 16px;
            margin-bottom: 16px;
            border: 1px solid #2ecc71;
        }
        .selected-doctor-info strong { color: #1a5c3e; }
    </style>
</head>
<body>
<div class="container">
    <!-- Navbar -->
    <div class="navbar">
        <div class="logo"><i class="fas fa-heartbeat"></i> Medicare</div>
        <div class="nav-links">
            <a href="${pageContext.request.contextPath}/patient/book" class="active"><i class="fas fa-calendar-plus"></i> Đặt lịch</a>
            <a href="${pageContext.request.contextPath}/patient/dashboard"><i class="fas fa-chart-pie"></i> Lịch sử</a>
            <a href="${pageContext.request.contextPath}/patient/appointments"><i class="fas fa-calendar-check"></i> Lịch hẹn</a>
            <a href="${pageContext.request.contextPath}/patient/profile"><i class="fas fa-user"></i> Hồ sơ</a>
        </div>
        <div class="user-info">
            <div class="avatar"><i class="fas fa-user"></i></div>
            <span>${sessionScope.fullName}</span>
            <a href="${pageContext.request.contextPath}/logout" class="logout"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a>
        </div>
    </div>

    <h1 class="page-title"><i class="fas fa-user-md"></i> Đặt lịch khám bệnh</h1>
    <p class="page-subtitle">Chọn bác sĩ và điền thông tin để đặt lịch hẹn</p>

    <!-- Doctor List -->
    <div class="doctor-grid">
        <c:forEach items="${allDoctors}" var="doc">
            <div class="doctor-card ${selectedDoctor != null && selectedDoctor.doctorId == doc.doctorId ? 'selected' : ''}" 
                 onclick="selectDoctor('${doc.doctorId}')">
                <div class="avatar"><i class="fas fa-user-md"></i></div>
                <h3>BS. ${doc.fullName}</h3>
                <p class="specialty">${doc.specialization}</p>
                <p class="exp"><i class="fas fa-briefcase"></i> ${doc.experienceYears} năm kinh nghiệm</p>
                <p class="fee">💰 ${doc.consultingFee}đ / lượt</p>
                <div class="check-mark"><i class="fas fa-check-circle"></i> Đã chọn</div>
            </div>
        </c:forEach>
    </div>

    <!-- Booking Form -->
    <div class="booking-form">
        <h2><i class="fas fa-pencil-alt"></i> Thông tin đặt lịch</h2>

        <% if(request.getAttribute("error") != null) { %>
            <div class="alert alert-danger"><i class="fas fa-exclamation-circle"></i> <%= request.getAttribute("error") %></div>
        <% } %>
        <% if(request.getAttribute("success") != null) { %>
            <div class="alert alert-success"><i class="fas fa-check-circle"></i> <%= request.getAttribute("success") %></div>
        <% } %>

        <c:if test="${not empty selectedDoctor}">
            <div class="selected-doctor-info">
                <i class="fas fa-user-md" style="color:#2ecc71;"></i>
                <strong>Bác sĩ đã chọn:</strong> BS. ${selectedDoctor.fullName} - ${selectedDoctor.specialization}
            </div>
        </c:if>

        <form action="${pageContext.request.contextPath}/patient/book/submit" method="POST">
            <input type="hidden" name="doctorId" id="selectedDoctorId" value="${selectedDoctor != null ? selectedDoctor.doctorId : ''}">

            <div class="form-row">
                <div class="form-group">
                    <label><i class="fas fa-user"></i> Họ và tên</label>
                    <input type="text" name="patientName" placeholder="Nhập họ tên đầy đủ" required>
                </div>
                <div class="form-group">
                    <label><i class="fas fa-phone"></i> Số điện thoại</label>
                    <input type="tel" name="phoneNumber" pattern="[0-9]{10}" placeholder="0912345678" required>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label><i class="fas fa-calendar"></i> Ngày khám</label>
                    <input type="date" name="appointmentDate" id="appointmentDate" required>
                </div>
                <div class="form-group">
                    <label><i class="fas fa-clock"></i> Giờ khám</label>
                    <input type="time" name="appointmentTime" value="09:00" required>
                </div>
            </div>

            <div class="form-group">
                <label><i class="fas fa-notes-medical"></i> Triệu chứng / Lý do khám</label>
                <textarea name="symptoms" placeholder="Mô tả triệu chứng của bạn..."></textarea>
            </div>

            <button type="submit" class="btn-submit"><i class="fas fa-check-circle"></i> Xác nhận đặt lịch</button>
        </form>
    </div>
</div>

<script>
    function selectDoctor(doctorId) {
        // Cập nhật input hidden
        document.getElementById('selectedDoctorId').value = doctorId;
        
        // Cập nhật UI - highlight card được chọn
        document.querySelectorAll('.doctor-card').forEach(card => {
            card.classList.remove('selected');
        });
        document.querySelectorAll('.doctor-card').forEach(card => {
            if (card.textContent.includes(doctorId) || card.getAttribute('onclick').includes(doctorId)) {
                card.classList.add('selected');
            }
        });
        
        // Submit form để reload với doctorId được chọn
        window.location.href = '${pageContext.request.contextPath}/patient/book?doctorId=' + doctorId;
    }

    const today = new Date().toISOString().split('T')[0];
    document.getElementById('appointmentDate').setAttribute('min', today);
</script>
</body>
</html>