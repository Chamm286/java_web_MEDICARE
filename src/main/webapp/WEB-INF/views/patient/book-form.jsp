<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Điền thông tin đặt lịch khám - Medicare</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary: #0d6e3e;
            --primary-light: #2ecc71;
            --text-main: #1e293b;
            --text-muted: #64748b;
            --bg-global: #f8fafc;
            --card-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.05), 0 8px 10px -6px rgba(0, 0, 0, 0.05);
        }
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Inter', sans-serif; background-color: var(--bg-global); color: var(--text-main); line-height: 1.6; }
        .wrapper { max-width: 650px; margin: 50px auto; padding: 0 20px; }
        .form-card { background: white; padding: 40px 35px; border-radius: 24px; box-shadow: var(--card-shadow); border: 1px solid #f1f5f9; }
        .form-header { text-align: center; margin-bottom: 30px; }
        .form-header h2 { font-size: 1.8rem; font-weight: 800; color: #0f172a; }
        .form-header h2 span { color: var(--primary); }
        .form-header p { color: var(--text-muted); font-size: 0.95rem; margin-top: 6px; }
        .doctor-preset-box { background: linear-gradient(135deg, #f0fdf4 0%, #dcfce7 100%); border: 1px solid #bbf7d0; padding: 18px; border-radius: 16px; margin-bottom: 25px; display: flex; align-items: center; gap: 16px; }
        .doctor-preset-box .doc-icon { width: 50px; height: 50px; background: var(--primary); color: white; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 1.4rem; }
        .doctor-preset-box label { display: block; font-size: 0.8rem; text-transform: uppercase; letter-spacing: 0.5px; color: var(--primary); font-weight: 700; margin-bottom: 2px; }
        .doctor-preset-box .doc-name { font-size: 1.15rem; font-weight: 700; color: #0f172a; }
        .doctor-preset-box .doc-spec { font-size: 0.85rem; color: #475569; }
        .form-group { margin-bottom: 22px; }
        .form-group label { display: block; font-weight: 600; margin-bottom: 8px; font-size: 0.9rem; color: #334155; }
        .form-group label i { margin-right: 6px; color: var(--primary-light); }
        .input-ctrl { width: 100%; padding: 14px 16px; border: 1px solid #cbd5e1; border-radius: 12px; font-family: inherit; font-size: 0.95rem; color: var(--text-main); outline: none; transition: all 0.2s; background: #f8fafc; }
        .input-ctrl:focus { background: white; border-color: var(--primary); box-shadow: 0 0 0 4px rgba(13,110,62,0.12); }
        .btn-submit { background: linear-gradient(135deg, var(--primary), var(--primary-light)); color: white; border: none; width: 100%; padding: 16px; border-radius: 12px; font-size: 1rem; font-weight: 700; cursor: pointer; transition: all 0.3s; display: flex; align-items: center; justify-content: center; gap: 10px; box-shadow: 0 10px 20px rgba(13,110,62,0.2); margin-top: 30px; }
        .btn-submit:hover { box-shadow: 0 12px 25px rgba(13,110,62,0.35); transform: translateY(-1px); opacity: 0.95; }
    </style>
</head>
<body>
<jsp:include page="../common/header.jsp" />
<div class="wrapper">
    <div class="form-card">
        <div class="form-header">
            <h2>Tạo <span>Phiếu Khám Bệnh</span></h2>
            <p>Vui lòng cung cấp thông tin chính xác để hệ thống sắp xếp lịch</p>
        </div>
        <form action="${pageContext.request.contextPath}/book/submit" method="POST">
            <c:if test="${not empty doctor}">
                <div class="doctor-preset-box">
                    <div class="doc-icon"><i class="fas fa-user-md"></i></div>
                    <div>
                        <label>Bác sĩ tiếp nhận khám</label>
                        <div class="doc-name">BS. ${doctor.fullName}</div>
                        <div class="doc-spec">Chuyên khoa: ${doctor.specialization}</div>
                    </div>
                </div>
                <input type="hidden" name="doctorId" value="${doctor.doctorId}">
            </c:if>
            <div class="form-group">
                <label for="patientName"><i class="fas fa-user"></i> Họ tên người đăng ký khám</label>
                <input type="text" id="patientName" name="patientName" class="input-ctrl" placeholder="Ví dụ: Nguyễn Văn Hải" required>
            </div>
            <div class="form-group">
                <label for="phoneNumber"><i class="fas fa-phone"></i> Số điện thoại liên hệ</label>
                <input type="tel" id="phoneNumber" name="phoneNumber" class="input-ctrl" placeholder="Ví dụ: 09XXXXXXXX" required>
            </div>
            <div class="form-group">
                <label for="appointmentDate"><i class="fas fa-calendar-alt"></i> Chọn ngày đặt hẹn khám</label>
                <input type="date" id="appointmentDate" name="appointmentDate" class="input-ctrl" required>
            </div>
            <div class="form-group">
                <label for="symptoms"><i class="fas fa-notes-medical"></i> Tình trạng sức khỏe lâm sàng</label>
                <textarea id="symptoms" name="symptoms" class="input-ctrl" rows="4" placeholder="Mô tả ngắn gọn lý do đi khám hoặc các triệu chứng mệt mỏi..."></textarea>
            </div>
            <button type="submit" class="btn-submit">Xác nhận hoàn tất đăng ký lịch khám <i class="fas fa-paper-plane"></i></button>
        </form>
    </div>
</div>
<jsp:include page="../common/footer.jsp" />
<script>
    const todayStr = new Date().toISOString().split('T')[0];
    document.getElementById('appointmentDate').setAttribute('min', todayStr);
</script>
</body>
</html>