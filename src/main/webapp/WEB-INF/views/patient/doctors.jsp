<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đội ngũ bác sĩ - Medicare</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Inter', sans-serif; background: #f5f7fb; padding-top: 70px; }
        
        .banner {
            background: linear-gradient(135deg, #0066b2, #004c8a);
            padding: 60px 0;
            text-align: center;
            color: white;
        }
        .banner h1 { font-size: 2rem; margin-bottom: 10px; }
        .banner p { opacity: 0.9; }
        
        .container { max-width: 1200px; margin: -30px auto 0; padding: 0 20px; }
        
        /* Filter */
        .filter-bar {
            background: white;
            border-radius: 60px;
            padding: 12px 24px;
            margin-bottom: 30px;
            display: flex;
            gap: 15px;
            flex-wrap: wrap;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
        }
        .filter-btn {
            padding: 8px 24px;
            border-radius: 40px;
            border: none;
            background: #eef2f6;
            cursor: pointer;
            transition: 0.2s;
        }
        .filter-btn.active, .filter-btn:hover {
            background: #0066b2;
            color: white;
        }
        
        /* Doctor Grid */
        .doctor-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 25px;
        }
        .doctor-card {
            background: white;
            border-radius: 20px;
            overflow: hidden;
            transition: 0.3s;
            cursor: pointer;
            box-shadow: 0 2px 8px rgba(0,0,0,0.04);
        }
        .doctor-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.1);
        }
        .doctor-img {
            height: 200px;
            background: linear-gradient(135deg, #0066b2, #004c8a);
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .doctor-img i { font-size: 5rem; color: white; opacity: 0.8; }
        .doctor-info { padding: 20px; }
        .doctor-name { font-size: 1.1rem; font-weight: 700; margin-bottom: 5px; }
        .doctor-specialty { color: #0066b2; font-size: 0.85rem; margin-bottom: 8px; }
        .doctor-exp { font-size: 0.75rem; color: #7f8c8d; margin-bottom: 8px; }
        .doctor-fee { font-weight: 600; color: #e67e22; }
        .rating { color: #f1c40f; margin-top: 8px; font-size: 0.8rem; }
        .btn-view {
            width: 100%;
            margin-top: 15px;
            padding: 10px;
            background: #eef2f6;
            border: none;
            border-radius: 40px;
            cursor: pointer;
            font-weight: 500;
            transition: 0.2s;
        }
        .btn-view:hover { background: #0066b2; color: white; }
        
        @media (max-width: 900px) { .doctor-grid { grid-template-columns: repeat(2, 1fr); } }
        @media (max-width: 600px) { .doctor-grid { grid-template-columns: 1fr; } }
    </style>
</head>
<body>

<jsp:include page="../common/header.jsp" />

<div class="banner">
    <h1>👨‍⚕️ Đội ngũ bác sĩ</h1>
    <p>Chuyên gia hàng đầu - Tận tâm với bệnh nhân</p>
</div>

<div class="container">
    <div class="filter-bar">
        <button class="filter-btn active" onclick="filterDoctors('all')">Tất cả</button>
        <button class="filter-btn" onclick="filterDoctors('tim_mach')">Tim mạch</button>
        <button class="filter-btn" onclick="filterDoctors('nhi_khoa')">Nhi khoa</button>
        <button class="filter-btn" onclick="filterDoctors('co_xuong_khop')">Cơ xương khớp</button>
        <button class="filter-btn" onclick="filterDoctors('san_phu_khoa')">Sản phụ khoa</button>
    </div>
    
    <div class="doctor-grid" id="doctorGrid">
        <c:forEach items="${doctors}" var="doc">
            <div class="doctor-card" data-specialty="${doc.specialization}">
                <div class="doctor-img"><i class="fas fa-user-md"></i></div>
                <div class="doctor-info">
                    <div class="doctor-name">${doc.fullName}</div>
                    <div class="doctor-specialty">${doc.specialization}</div>
                    <div class="doctor-exp"><i class="fas fa-briefcase"></i> ${doc.experienceYears} năm kinh nghiệm</div>
                    <div class="doctor-fee"><fmt:formatNumber value="${doc.consultingFee}" type="currency" currencySymbol="₫" groupingUsed="true"/></div>
                    <div class="rating">★★★★★ (128)</div>
                    <button class="btn-view" onclick="location.href='${pageContext.request.contextPath}/doctor/${doc.doctorId}'">Xem chi tiết</button>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<jsp:include page="../common/footer.jsp" />

<script>
    function filterDoctors(type) {
        document.querySelectorAll('.filter-btn').forEach(btn => btn.classList.remove('active'));
        event.target.classList.add('active');
        
        const cards = document.querySelectorAll('.doctor-card');
        cards.forEach(card => {
            const specialty = card.dataset.specialty;
            if (type === 'all') {
                card.style.display = 'block';
            } else {
                let match = false;
                if (type === 'tim_mach' && specialty.includes('Tim mạch')) match = true;
                if (type === 'nhi_khoa' && specialty.includes('Nhi')) match = true;
                if (type === 'co_xuong_khop' && specialty.includes('Cơ xương')) match = true;
                if (type === 'san_phu_khoa' && specialty.includes('Sản')) match = true;
                card.style.display = match ? 'block' : 'none';
            }
        });
    }
</script>
</body>
</html>