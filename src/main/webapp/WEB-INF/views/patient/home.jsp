<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Trang chủ bệnh nhân - Medicare</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: 'Inter', sans-serif;
            background: #f4f7fc;
            color: #0b1a33;
            scroll-behavior: smooth;
        }
        a { text-decoration: none; }
        .container { max-width: 1200px; margin: 0 auto; padding: 0 24px; }

        .header {
            background: rgba(255,255,255,0.95);
            backdrop-filter: blur(14px);
            padding: 12px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: sticky;
            top: 0;
            z-index: 999;
            border-bottom: 1px solid rgba(0,0,0,0.04);
            flex-wrap: wrap;
            gap: 10px;
        }
        .header .logo {
            font-size: 24px;
            font-weight: 800;
            color: #0a7e6b;
        }
        .header .logo i { color: #12b886; margin-right: 6px; }
        .header .nav-links {
            display: flex;
            gap: 22px;
            font-weight: 500;
            font-size: 14px;
            align-items: center;
            flex-wrap: wrap;
        }
        .header .nav-links a {
            color: #1e293b;
            transition: 0.2s;
        }
        .header .nav-links a:hover,
        .header .nav-links a.active {
            color: #0a7e6b;
        }
        .header .nav-links .hotline {
            color: #e53e3e;
            font-weight: 700;
            font-size: 15px;
        }
        .header .nav-links .hotline i { margin-right: 6px; }
        .header .nav-links .btn-book {
            background: #12b886;
            color: white !important;
            padding: 8px 22px;
            border-radius: 40px;
            font-weight: 600;
            transition: 0.3s;
        }
        .header .nav-links .btn-book:hover {
            background: #0f9f74;
            transform: scale(1.02);
        }
        .header-right {
            display: flex;
            align-items: center;
            gap: 14px;
        }
        .header-right .avatar {
            width: 38px;
            height: 38px;
            background: #12b886;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: 700;
            font-size: 14px;
        }
        .header-right .name {
            font-weight: 600;
            font-size: 14px;
        }
        .header-right .logout {
            color: #ef4444;
            background: #fee2e2;
            padding: 6px 16px;
            border-radius: 40px;
            font-size: 13px;
            font-weight: 500;
            transition: 0.2s;
        }
        .header-right .logout:hover { background: #fecaca; }

        .hero-banner {
            background: linear-gradient(135deg, #0a7e6b 0%, #12b886 100%);
            border-radius: 24px;
            padding: 40px 44px;
            margin: 24px 0 30px;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 20px;
        }
        .hero-banner .left h1 {
            font-size: 30px;
            font-weight: 800;
            margin-bottom: 6px;
        }
        .hero-banner .left h1 i { margin-right: 10px; }
        .hero-banner .left p {
            opacity: 0.9;
            font-size: 15px;
            max-width: 480px;
        }
        .hero-banner .left .badge {
            display: inline-block;
            background: rgba(255,255,255,0.2);
            padding: 4px 16px;
            border-radius: 40px;
            font-size: 13px;
            margin-top: 10px;
        }
        .hero-banner .stats {
            display: flex;
            gap: 30px;
            background: rgba(255,255,255,0.1);
            padding: 14px 26px;
            border-radius: 16px;
        }
        .hero-banner .stats .item { text-align: center; }
        .hero-banner .stats .item .number {
            font-size: 26px;
            font-weight: 800;
        }
        .hero-banner .stats .item .label {
            font-size: 12px;
            opacity: 0.8;
        }

        .quick-services {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            gap: 12px;
            margin-bottom: 30px;
        }
        .quick-services .service {
            background: white;
            border-radius: 14px;
            padding: 16px 12px;
            text-align: center;
            cursor: pointer;
            transition: 0.3s;
            border: 1px solid #edf2f7;
        }
        .quick-services .service:hover {
            transform: translateY(-3px);
            border-color: #12b886;
            box-shadow: 0 8px 24px rgba(0,0,0,0.04);
        }
        .quick-services .service .icon {
            font-size: 24px;
            color: #12b886;
            margin-bottom: 6px;
        }
        .quick-services .service span {
            font-size: 13px;
            font-weight: 500;
        }

        .stats-section {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            gap: 16px;
            margin-bottom: 30px;
        }
        .stats-section .stat {
            background: white;
            border-radius: 14px;
            padding: 16px;
            text-align: center;
            border: 1px solid #edf2f7;
        }
        .stats-section .stat .num {
            font-size: 28px;
            font-weight: 800;
            color: #0a7e6b;
        }
        .stats-section .stat .label {
            font-size: 13px;
            color: #64748b;
        }

        .specialties-section {
            background: white;
            border-radius: 20px;
            padding: 24px 28px;
            margin-bottom: 30px;
            border: 1px solid #edf2f7;
        }
        .specialties-section .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 16px;
            background: transparent;
            padding: 0;
            border: none;
        }
        .specialties-section .header h3 {
            font-size: 18px;
            font-weight: 700;
        }
        .specialties-section .header a {
            color: #12b886;
            font-weight: 600;
            font-size: 14px;
        }
        .specialties-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(130px, 1fr));
            gap: 10px;
        }
        .specialties-grid .spec {
            padding: 10px 14px;
            background: #f8fafc;
            border-radius: 10px;
            text-align: center;
            font-size: 13px;
            font-weight: 500;
            cursor: pointer;
            transition: 0.2s;
            border: 1px solid transparent;
        }
        .specialties-grid .spec:hover {
            background: #d4f5f0;
            border-color: #12b886;
            color: #0a7e6b;
        }
        .specialties-grid .spec i {
            color: #12b886;
            margin-right: 6px;
        }

        .partners-section {
            background: white;
            border-radius: 20px;
            padding: 24px 28px;
            margin-bottom: 30px;
            border: 1px solid #edf2f7;
            text-align: center;
        }
        .partners-section h3 {
            font-size: 18px;
            font-weight: 700;
            margin-bottom: 16px;
        }
        .partners-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(180px, 1fr));
            gap: 16px;
        }
        .partners-grid .partner {
            padding: 14px;
            background: #f8fafc;
            border-radius: 12px;
            font-size: 13px;
            font-weight: 500;
            border: 1px solid #edf2f7;
            transition: 0.2s;
        }
        .partners-grid .partner:hover {
            border-color: #12b886;
            background: #f0fdf4;
        }
        .partners-grid .partner .star {
            color: #f6ad55;
            font-size: 12px;
        }
        .partners-grid .partner .btn-link {
            color: #12b886;
            font-weight: 600;
            font-size: 13px;
            margin-top: 6px;
            display: inline-block;
        }

        .testimonials-section {
            background: white;
            border-radius: 20px;
            padding: 24px 28px;
            margin-bottom: 30px;
            border: 1px solid #edf2f7;
        }
        .testimonials-section .header h3 {
            font-size: 18px;
            font-weight: 700;
            margin-bottom: 16px;
        }
        .testimonials-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 20px;
        }
        .testimonial-card {
            background: #f8fafc;
            border-radius: 14px;
            padding: 20px;
            border: 1px solid #edf2f7;
        }
        .testimonial-card .stars {
            color: #f6ad55;
            font-size: 14px;
            margin-bottom: 8px;
        }
        .testimonial-card p {
            font-size: 14px;
            color: #475569;
            line-height: 1.6;
        }
        .testimonial-card .author {
            font-weight: 600;
            margin-top: 10px;
            font-size: 14px;
        }

        .doctor-section .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            margin-bottom: 16px;
            background: transparent;
            padding: 0;
            border: none;
        }
        .doctor-section .header h2 {
            font-size: 22px;
            font-weight: 700;
        }
        .doctor-section .header a {
            color: #12b886;
            font-weight: 600;
            font-size: 14px;
        }
        .doctor-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 18px;
            margin-bottom: 30px;
        }
        .doctor-card {
            background: white;
            border-radius: 16px;
            padding: 20px 14px;
            text-align: center;
            border: 1px solid #edf2f7;
            transition: 0.3s;
            cursor: pointer;
        }
        .doctor-card:hover {
            transform: translateY(-4px);
            border-color: #12b886;
            box-shadow: 0 8px 24px rgba(0,0,0,0.04);
        }
        .doctor-card .avatar {
            width: 64px;
            height: 64px;
            background: #d4f5f0;
            border-radius: 50%;
            margin: 0 auto 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            color: #0a7e6b;
        }
        .doctor-card h4 { font-size: 14px; font-weight: 600; }
        .doctor-card .specialty { font-size: 12px; color: #64748b; }
        .doctor-card .fee { color: #12b886; font-weight: 600; font-size: 13px; margin-top: 4px; }
        .doctor-card .rating { font-size: 12px; color: #f6ad55; }

        .appointment-list {
            background: white;
            border-radius: 16px;
            padding: 20px 24px;
            border: 1px solid #edf2f7;
            margin-bottom: 30px;
        }
        .appointment-list .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 12px;
            background: transparent;
            padding: 0;
            border: none;
        }
        .appointment-list .header h3 { font-size: 18px; font-weight: 700; }
        .appointment-list .header a { color: #12b886; font-weight: 500; font-size: 14px; }
        .appointment-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 12px 0;
            border-bottom: 1px solid #f1f5f9;
            flex-wrap: wrap;
            gap: 8px;
        }
        .appointment-item:last-child { border-bottom: none; }
        .appointment-item .info .doc { font-weight: 600; font-size: 14px; }
        .appointment-item .info .detail { font-size: 13px; color: #64748b; }
        .status {
            padding: 3px 14px;
            border-radius: 30px;
            font-size: 12px;
            font-weight: 600;
        }
        .status-pending { background: #fef3c7; color: #b45309; }
        .status-confirmed { background: #dbeafe; color: #1d4ed8; }
        .status-completed { background: #d1fae5; color: #065f46; }
        .status-cancelled { background: #fee2e2; color: #dc2626; }
        .empty-state {
            text-align: center;
            padding: 20px 0;
            color: #94a3b8;
        }
        .empty-state i { font-size: 32px; display: block; margin-bottom: 8px; }

        .footer {
            background: #0b1a33;
            color: rgba(255,255,255,0.7);
            padding: 32px 40px;
            margin-top: 20px;
            border-radius: 20px 20px 0 0;
        }
        .footer .grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(160px, 1fr));
            gap: 24px;
        }
        .footer .grid h4 { color: white; font-size: 15px; margin-bottom: 10px; }
        .footer .grid a {
            display: block;
            color: rgba(255,255,255,0.6);
            font-size: 13px;
            margin: 4px 0;
            transition: 0.2s;
        }
        .footer .grid a:hover { color: #12b886; }
        .footer .bottom {
            border-top: 1px solid rgba(255,255,255,0.06);
            padding-top: 16px;
            margin-top: 20px;
            text-align: center;
            font-size: 13px;
        }
        .footer .bottom span { color: #12b886; }

        @media (max-width: 768px) {
            .header { padding: 10px 16px; }
            .header .nav-links { gap: 12px; font-size: 12px; }
            .header .nav-links .hotline { font-size: 13px; }
            .hero-banner { padding: 24px 20px; flex-direction: column; text-align: center; }
            .hero-banner .left h1 { font-size: 22px; }
            .hero-banner .stats { gap: 16px; padding: 12px 16px; width: 100%; justify-content: center; }
            .quick-services { grid-template-columns: repeat(3, 1fr); }
            .doctor-grid { grid-template-columns: repeat(2, 1fr); }
            .specialties-grid { grid-template-columns: repeat(3, 1fr); }
            .testimonials-grid { grid-template-columns: 1fr; }
        }
        @media (max-width: 480px) {
            .quick-services { grid-template-columns: repeat(2, 1fr); }
            .doctor-grid { grid-template-columns: 1fr; }
            .specialties-grid { grid-template-columns: repeat(2, 1fr); }
            .header .nav-links .btn-book { padding: 4px 12px; font-size: 12px; }
            .header-right .name { display: none; }
            .header .nav-links .hotline { font-size: 12px; }
        }
    </style>
</head>
<body>

    <header class="header">
        <div class="logo"><i class="fas fa-heartbeat"></i> Medicare</div>
        <div class="nav-links">
            <a href="${pageContext.request.contextPath}/patient/home" class="active">Trang chủ</a>
            <a href="${pageContext.request.contextPath}/patient/book">Đặt lịch</a>
            <a href="${pageContext.request.contextPath}/patient/appointments">Lịch hẹn</a>
            <a href="#">Bác sĩ</a>
            <a href="#">Tin tức</a>
            <a href="#" class="hotline"><i class="fas fa-phone"></i> 1900 2115</a>
            <a href="${pageContext.request.contextPath}/patient/book" class="btn-book"><i class="fas fa-calendar-plus"></i> Đặt lịch</a>
        </div>
        <div class="header-right">
            <div class="avatar"><i class="fas fa-user"></i></div>
            <span class="name">${sessionScope.fullName}</span>
            <a href="${pageContext.request.contextPath}/logout" class="logout"><i class="fas fa-sign-out-alt"></i></a>
        </div>
    </header>

    <div class="container">

        <section class="hero-banner">
            <div class="left">
                <h1><i class="fas fa-heart"></i> Xin chào, ${sessionScope.fullName}</h1>
                <p>Đặt lịch khám bệnh nhanh chóng, kết nối với bác sĩ hàng đầu tại Đà Nẵng</p>
                <div class="badge"><i class="fas fa-check-circle"></i> Hơn 10.000 bệnh nhân đã tin tưởng</div>
            </div>
            <div class="stats">
                <div class="item"><div class="number">5</div><div class="label">Lịch hẹn</div></div>
                <div class="item"><div class="number">2</div><div class="label">Đã khám</div></div>
                <div class="item"><div class="number">3</div><div class="label">Chờ xác nhận</div></div>
            </div>
        </section>

        <div class="quick-services">
            <div class="service" onclick="location.href='${pageContext.request.contextPath}/patient/book'">
                <div class="icon"><i class="fas fa-calendar-plus"></i></div>
                <span>Đặt khám tại cơ sở</span>
            </div>
            <div class="service" onclick="location.href='${pageContext.request.contextPath}/patient/book'">
                <div class="icon"><i class="fas fa-user-md"></i></div>
                <span>Đặt khám chuyên khoa</span>
            </div>
            <div class="service">
                <div class="icon"><i class="fas fa-video"></i></div>
                <span>Gọi video với bác sĩ</span>
            </div>
            <div class="service">
                <div class="icon"><i class="fas fa-flask"></i></div>
                <span>Đặt lịch xét nghiệm</span>
            </div>
            <div class="service">
                <div class="icon"><i class="fas fa-clock"></i></div>
                <span>Đặt khám ngoài giờ</span>
            </div>
            <div class="service">
                <div class="icon"><i class="fas fa-hand-holding-heart"></i></div>
                <span>Giúp việc cá nhân</span>
            </div>
        </div>

        <div class="stats-section">
            <div class="stat"><div class="num">4.0M+</div><div class="label">Lượt khám</div></div>
            <div class="stat"><div class="num">100+</div><div class="label">Bệnh viện</div></div>
            <div class="stat"><div class="num">300+</div><div class="label">Cơ sở Y tế</div></div>
            <div class="stat"><div class="num">2500+</div><div class="label">Bác sĩ</div></div>
        </div>

        <div class="specialties-section">
            <div class="header">
                <h3><i class="fas fa-stethoscope"></i> Chuyên khoa</h3>
                <a href="#">Xem tất cả →</a>
            </div>
            <div class="specialties-grid">
                <div class="spec"><i class="fas fa-user-md"></i> Bác sĩ Gia Đình</div>
                <div class="spec"><i class="fas fa-lungs"></i> Nội Hô Hấp</div>
                <div class="spec"><i class="fas fa-heart"></i> Nội Tim Mạch</div>
                <div class="spec"><i class="fas fa-brain"></i> Nội Thần Kinh</div>
                <div class="spec"><i class="fas fa-bone"></i> Cơ Xương Khớp</div>
                <div class="spec"><i class="fas fa-ear-deaf"></i> Tai Mũi Họng</div>
                <div class="spec"><i class="fas fa-eye"></i> Mắt</div>
                <div class="spec"><i class="fas fa-stomach"></i> Tiêu Hóa Gan Mật</div>
                <div class="spec"><i class="fas fa-kidney"></i> Nội Tiết Niệu</div>
                <div class="spec"><i class="fas fa-allergies"></i> Da liễu</div>
            </div>
        </div>

        <div class="doctor-section">
            <div class="header">
                <h2>👨‍⚕️ Bác sĩ nổi bật</h2>
                <a href="${pageContext.request.contextPath}/patient/book">Xem tất cả →</a>
            </div>
            <div class="doctor-grid">
                <c:forEach var="doc" items="${allDoctors}" end="5">
                    <div class="doctor-card" onclick="location.href='${pageContext.request.contextPath}/patient/book?doctorId=${doc.doctorId}'">
                        <div class="avatar"><i class="fas fa-user-md"></i></div>
                        <h4>BS. ${doc.fullName}</h4>
                        <div class="specialty">${doc.specialization}</div>
                        <div class="rating"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></div>
                        <div class="fee">${doc.consultingFee}đ</div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <div class="appointment-list">
            <div class="header">
                <h3><i class="fas fa-clock"></i> Lịch hẹn gần đây</h3>
                <a href="${pageContext.request.contextPath}/patient/appointments">Xem tất cả →</a>
            </div>
            <c:choose>
                <c:when test="${not empty recentAppointments}">
                    <c:forEach var="app" items="${recentAppointments}" end="3">
                        <div class="appointment-item">
                            <div class="info">
                                <div class="doc">BS. ${app.doctorName}</div>
                                <div class="detail">${app.date} - ${app.time} · ${app.symptoms}</div>
                            </div>
                            <span class="status status-${app.status}">${app.status}</span>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div class="empty-state">
                        <i class="fas fa-calendar"></i>
                        <p>Bạn chưa có lịch hẹn nào</p>
                        <a href="${pageContext.request.contextPath}/patient/book" style="color:#12b886;font-weight:600;">Đặt lịch ngay</a>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>

        <div class="testimonials-section">
            <div class="header"><h3>💬 Cảm nhận từ khách hàng</h3></div>
            <div class="testimonials-grid">
                <div class="testimonial-card">
                    <div class="stars"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></div>
                    <p>"Đặt lịch xét nghiệm bên này rất gọn, có ngày giờ cụ thể luôn lên là được xét nghiệm liền không rườm rà gì mấy."</p>
                    <div class="author">- Nhân Nguyễn</div>
                </div>
                <div class="testimonial-card">
                    <div class="stars"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></div>
                    <p>"Dịch vụ tư vấn bác sĩ qua video tiện thật. Bác sĩ tư vấn chi tiết, nhẹ nhàng. Mình thấy đáng tiền lắm nha."</p>
                    <div class="author">- Mai Vy</div>
                </div>
                <div class="testimonial-card">
                    <div class="stars"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></div>
                    <p>"Đi làm bận rộn như mình đặt trước ở đây có chọn ngày giờ thì khỏi mất thời gian tới xếp hàng đợi ở bệnh viện."</p>
                    <div class="author">- Mộc Trà</div>
                </div>
            </div>
        </div>

    </div>

    <footer class="footer">
        <div class="container">
            <div class="grid">
                <div>
                    <h4><i class="fas fa-heartbeat"></i> Medicare</h4>
                    <a href="#">Đặt khám nhanh</a>
                    <a href="#">Tư vấn sức khỏe</a>
                    <a href="#">Khám doanh nghiệp</a>
                </div>
                <div>
                    <h4>Dịch vụ Y tế</h4>
                    <a href="#">Đặt khám tại cơ sở</a>
                    <a href="#">Đặt khám chuyên khoa</a>
                    <a href="#">Gọi video với bác sĩ</a>
                    <a href="#">Đặt lịch xét nghiệm</a>
                </div>
                <div>
                    <h4>Cơ sở y tế</h4>
                    <a href="#">Bệnh viện</a>
                    <a href="#">Phòng khám</a>
                    <a href="#">Phòng mạch</a>
                    <a href="#">Y tế tại nhà</a>
                </div>
                <div>
                    <h4>Hỗ trợ</h4>
                    <a href="#">Hướng dẫn</a>
                    <a href="#">Quy trình hoàn phí</a>
                    <a href="#">Câu hỏi thường gặp</a>
                    <a href="tel:19002115"><strong style="color:#12b886;">1900 2115</strong></a>
                </div>
            </div>
            <div class="bottom">
                © 2026 <span>Medicare</span> - Đặt lịch khám bệnh thông minh tại Đà Nẵng
            </div>
        </div>
    </footer>

</body>
</html>