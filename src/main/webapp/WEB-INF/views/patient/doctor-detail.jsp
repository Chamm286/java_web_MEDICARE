<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi tiết bác sĩ - Medicare</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Inter', sans-serif; background: #f8fafc; padding-top: 80px; }
        .container { max-width: 1200px; margin: 0 auto; padding: 0 20px; }
        
        /* Header */
        .header {
            background: white; box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            position: fixed; top: 0; left: 0; right: 0; z-index: 1000;
        }
        .nav { display: flex; justify-content: space-between; align-items: center; height: 70px; }
        .logo { font-size: 1.4rem; font-weight: 700; display: flex; align-items: center; gap: 8px; color: #0d6e3e; text-decoration: none; }
        .logo i { color: #2ecc71; }
        .nav-links { display: flex; gap: 2rem; align-items: center; }
        .nav-links a { text-decoration: none; color: #2c3e50; font-weight: 500; transition: 0.3s; }
        .nav-links a:hover { color: #0d6e3e; }
        .btn-book-nav {
            background: linear-gradient(135deg, #0d6e3e, #1a9b5c);
            padding: 8px 24px; border-radius: 30px; color: white !important;
        }
        
        /* Breadcrumb */
        .breadcrumb { margin: 20px 0; font-size: 0.8rem; color: #64748b; }
        .breadcrumb a { color: #0d6e3e; text-decoration: none; }
        
        /* Doctor Profile */
        .profile-card {
            background: white; border-radius: 24px; padding: 30px;
            display: flex; gap: 40px; margin-bottom: 30px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.04);
        }
        .profile-avatar {
            width: 150px; height: 150px; background: linear-gradient(135deg, #0d6e3e, #1a9b5c);
            border-radius: 50%; display: flex; align-items: center; justify-content: center;
            flex-shrink: 0;
        }
        .profile-avatar i { font-size: 4rem; color: white; }
        .profile-name { font-size: 1.5rem; font-weight: 700; margin-bottom: 5px; }
        .profile-specialty { color: #0d6e3e; font-size: 0.9rem; margin-bottom: 10px; }
        .profile-exp { display: flex; align-items: center; gap: 8px; margin-bottom: 10px; }
        .profile-fee { font-size: 1.2rem; font-weight: 700; color: #e67e22; margin: 15px 0; }
        .rating { display: flex; align-items: center; gap: 10px; }
        .stars { color: #f1c40f; }
        
        /* Tabs */
        .tabs { display: flex; gap: 10px; margin-bottom: 20px; border-bottom: 1px solid #e2e8f0; }
        .tab-btn {
            padding: 12px 24px; background: none; border: none; font-weight: 500;
            cursor: pointer; transition: 0.3s; color: #64748b;
        }
        .tab-btn.active { color: #0d6e3e; border-bottom: 2px solid #0d6e3e; }
        
        /* Content */
        .tab-content { display: none; background: white; border-radius: 20px; padding: 30px; margin-bottom: 30px; }
        .tab-content.active { display: block; }
        .info-row { display: flex; padding: 12px 0; border-bottom: 1px solid #eef2f6; }
        .info-label { width: 120px; font-weight: 600; }
        .info-value { flex: 1; color: #64748b; }
        
        /* Booking Section */
        .booking-card { background: white; border-radius: 20px; padding: 30px; margin-bottom: 30px; }
        .date-tabs { display: flex; gap: 10px; overflow-x: auto; margin-bottom: 20px; }
        .date-tab {
            min-width: 80px; padding: 10px; text-align: center; background: #f1f5f9;
            border-radius: 16px; cursor: pointer; transition: 0.3s;
        }
        .date-tab.active { background: #0d6e3e; color: white; }
        .time-slots { display: flex; flex-wrap: wrap; gap: 10px; margin: 20px 0; }
        .time-slot {
            padding: 8px 20px; border: 1px solid #cbd5e1; border-radius: 30px;
            cursor: pointer; transition: 0.3s;
        }
        .time-slot:hover, .time-slot.selected { background: #0d6e3e; color: white; border-color: #0d6e3e; }
        textarea { width: 100%; padding: 12px; border: 1px solid #e2e8f0; border-radius: 16px; margin: 15px 0; }
        .btn-submit {
            background: linear-gradient(135deg, #0d6e3e, #1a9b5c);
            color: white; border: none; padding: 14px; border-radius: 40px;
            font-weight: 600; cursor: pointer; width: 100%;
        }
        
        /* Footer */
        .footer { background: #1a2a2a; color: #ccc; padding: 50px 0 20px; margin-top: 50px; }
        .footer-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 40px; margin-bottom: 30px; }
        .footer-col h4 { color: #2ecc71; margin-bottom: 15px; }
        .copyright { text-align: center; padding-top: 20px; border-top: 1px solid #444; }
        
        @media (max-width: 768px) {
            .profile-card { flex-direction: column; text-align: center; }
            .profile-avatar { margin: 0 auto; }
            .nav { flex-direction: column; height: auto; padding: 15px 0; gap: 15px; }
            body { padding-top: 120px; }
        }
    </style>
</head>
<body>

<header class="header">
    <div class="container">
        <nav class="nav">
            <a href="${pageContext.request.contextPath}/" class="logo"><i class="fas fa-heartbeat"></i> Medicare</a>
            <div class="nav-links">
                <a href="${pageContext.request.contextPath}/">Trang chủ</a>
                <a href="${pageContext.request.contextPath}/#services">Dịch vụ</a>
                <a href="${pageContext.request.contextPath}/doctors">Bác sĩ</a>
                <a href="${pageContext.request.contextPath}/#contact">Liên hệ</a>
                <a href="${pageContext.request.contextPath}/book" class="btn-book-nav">Đặt lịch</a>
                <a href="${pageContext.request.contextPath}/login" class="btn-login">Đăng nhập</a>
            </div>
        </nav>
    </div>
</header>

<div class="container">
    <div class="breadcrumb">
        <a href="${pageContext.request.contextPath}/">Trang chủ</a> / 
        <a href="${pageContext.request.contextPath}/doctors">Bác sĩ</a> / 
        <span>${doctor.fullName}</span>
    </div>

    <!-- Profile -->
    <div class="profile-card">
        <div class="profile-avatar"><i class="fas fa-user-md"></i></div>
        <div>
            <h1 class="profile-name">${doctor.fullName}</h1>
            <p class="profile-specialty">${doctor.specialization}</p>
            <p class="profile-exp"><i class="fas fa-briefcase"></i> ${doctor.experienceYears} năm kinh nghiệm</p>
            <p class="profile-fee"><fmt:formatNumber value="${doctor.consultingFee}" type="currency" currencySymbol="₫" groupingUsed="true"/></p>
            <div class="rating"><span class="stars">★★★★★</span> 4.9 (128 đánh giá)</div>
        </div>
    </div>

    <!-- Tabs -->
    <div class="tabs">
        <button class="tab-btn active" onclick="showTab('intro')">Giới thiệu</button>
        <button class="tab-btn" onclick="showTab('education')">Đào tạo</button>
        <button class="tab-btn" onclick="showTab('experience')">Kinh nghiệm</button>
        <button class="tab-btn" onclick="showTab('schedule')">Lịch làm việc</button>
    </div>

    <div id="intro" class="tab-content active">
        <p>Bác sĩ ${doctor.fullName} là chuyên gia hàng đầu trong lĩnh vực ${doctor.specialization} với hơn ${doctor.experienceYears} năm kinh nghiệm. Bác sĩ đã điều trị thành công cho hàng ngàn bệnh nhân và được nhiều người tin tưởng.</p>
    </div>

    <div id="education" class="tab-content">
        <div class="info-row"><div class="info-label">Tốt nghiệp</div><div class="info-value">Đại học Y Hà Nội (Thủ khoa)</div></div>
        <div class="info-row"><div class="info-label">Chuyên khoa I</div><div class="info-value">Đại học Y Dược TP.HCM</div></div>
        <div class="info-row"><div class="info-label">Chuyên khoa II</div><div class="info-value">Đại học Y Hà Nội</div></div>
        <div class="info-row"><div class="info-label">Thạc sĩ</div><div class="info-value">Đại học Y khoa Phạm Ngọc Thạch</div></div>
    </div>

    <div id="experience" class="tab-content">
        <div class="info-row"><div class="info-label">2010-2018</div><div class="info-value">Bác sĩ chính - Bệnh viện Bạch Mai</div></div>
        <div class="info-row"><div class="info-label">2018-2022</div><div class="info-value">Trưởng khoa - Bệnh viện Đa khoa Medic</div></div>
        <div class="info-row"><div class="info-label">2022-nay</div><div class="info-value">Giảng viên Đại học Y Hà Nội</div></div>
    </div>

    <div id="schedule" class="tab-content">
        <div class="info-row"><div class="info-label">Thứ 2 - Thứ 6</div><div class="info-value">8:00 - 17:00</div></div>
        <div class="info-row"><div class="info-label">Thứ 7</div><div class="info-value">8:00 - 12:00</div></div>
        <div class="info-row"><div class="info-label">Chủ nhật</div><div class="info-value">Nghỉ</div></div>
    </div>

    <!-- Booking -->
    <div class="booking-card">
        <h3 style="margin-bottom: 20px;">📅 Đặt lịch khám</h3>
        <div class="date-tabs" id="dateTabs"></div>
        <div class="time-slots" id="timeSlots"></div>
        <textarea id="reason" rows="3" placeholder="Mô tả triệu chứng của bạn..."></textarea>
        <input type="hidden" id="selectedDate">
        <input type="hidden" id="selectedTime">
        <button class="btn-submit" onclick="submitBooking()">Xác nhận đặt lịch</button>
    </div>
</div>

<footer class="footer">
    <div class="container">
        <div class="footer-grid">
            <div><h4>Medicare</h4><p>Chăm sóc sức khỏe toàn diện</p></div>
            <div><h4>Liên hệ</h4><a href="#">1900 1234</a><a href="#">info@medicare.vn</a></div>
            <div><h4>Địa chỉ</h4><p>123 Đường Láng, Đà Nẵng</p></div>
        </div>
        <div class="copyright"><p>&copy; 2026 Medicare. All rights reserved.</p></div>
    </div>
</footer>

<script>
    let selectedDate = null;
    let selectedTime = null;
    const doctorFee = ${doctor.consultingFee};
    const timeSlots = ['08:00','08:30','09:00','09:30','10:00','10:30','13:30','14:00','14:30','15:00','15:30','16:00'];
    
    // Tạo ngày (14 ngày tới)
    const dates = [];
    for (let i = 0; i < 14; i++) {
        const d = new Date();
        d.setDate(d.getDate() + i);
        dates.push(new Date(d));
    }
    
    const dateContainer = document.getElementById('dateTabs');
    dates.forEach((date, idx) => {
        const dayNames = ['CN', 'T2', 'T3', 'T4', 'T5', 'T6', 'T7'];
        const day = dayNames[date.getDay()];
        const dateStr = date.toLocaleDateString('vi-VN');
        const div = document.createElement('div');
        div.className = 'date-tab';
        div.innerHTML = `<div><strong>${day}</strong><br>${dateStr}</div>`;
        div.onclick = () => {
            document.querySelectorAll('.date-tab').forEach(t => t.classList.remove('active'));
            div.classList.add('active');
            selectedDate = dateStr;
            document.getElementById('selectedDate').value = dateStr;
        };
        if (idx === 0) div.click();
        dateContainer.appendChild(div);
    });
    
    const timeContainer = document.getElementById('timeSlots');
    timeSlots.forEach(t => {
        const div = document.createElement('div');
        div.className = 'time-slot';
        div.textContent = t;
        div.onclick = () => {
            document.querySelectorAll('.time-slot').forEach(s => s.classList.remove('selected'));
            div.classList.add('selected');
            selectedTime = t;
            document.getElementById('selectedTime').value = t;
        };
        timeContainer.appendChild(div);
    });
    
    function showTab(tabId) {
        document.querySelectorAll('.tab-content').forEach(tab => tab.classList.remove('active'));
        document.querySelectorAll('.tab-btn').forEach(btn => btn.classList.remove('active'));
        document.getElementById(tabId).classList.add('active');
        event.target.classList.add('active');
    }
    
    function submitBooking() {
        if (!selectedDate) { alert('Vui lòng chọn ngày khám'); return; }
        if (!selectedTime) { alert('Vui lòng chọn giờ khám'); return; }
        alert(`✅ ĐẶT LỊCH THÀNH CÔNG!\n\n👨‍⚕️ Bác sĩ: ${doctor.fullName}\n📅 Ngày: ${selectedDate}\n⏰ Giờ: ${selectedTime}\n💰 Phí: ${doctorFee.toLocaleString()}₫\n\nMedicare sẽ liên hệ xác nhận!`);
        window.location.href = '${pageContext.request.contextPath}/patient/dashboard';
    }
</script>
</body>
</html>