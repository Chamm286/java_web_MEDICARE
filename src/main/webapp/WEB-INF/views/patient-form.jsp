<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thêm/Sửa bệnh nhân - Medicare</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f0f2f5;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background: white;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
        }
        h1 {
            color: #667eea;
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #333;
        }
        input, select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }
        .btn-submit {
            background: #667eea;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        .btn-submit:hover {
            background: #764ba2;
        }
        .btn-back {
            display: inline-block;
            margin-top: 20px;
            color: #667eea;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>${patient.patientId == null ? '➕ Thêm bệnh nhân mới' : '✏️ Cập nhật thông tin bệnh nhân'}</h1>
        <form action="${pageContext.request.contextPath}/patient/save" method="post">
            <div class="form-group">
                <label>Mã bệnh nhân:</label>
                <input type="text" name="patientId" value="${patient.patientId}" ${patient.patientId != null ? 'readonly' : ''} required>
            </div>
            <div class="form-group">
                <label>Họ tên:</label>
                <input type="text" name="name" value="${patient.name}" required>
            </div>
            <div class="form-group">
                <label>Ngày sinh:</label>
                <input type="date" name="dob" value="${patient.dob}" required>
            </div>
            <div class="form-group">
                <label>Giới tính:</label>
                <select name="gender">
                    <option value="M" ${patient.gender == 'M' ? 'selected' : ''}>Nam</option>
                    <option value="F" ${patient.gender == 'F' ? 'selected' : ''}>Nữ</option>
                </select>
            </div>
            <div class="form-group">
                <label>Số điện thoại:</label>
                <input type="text" name="phone" value="${patient.phone}">
            </div>
            <div class="form-group">
                <label>Địa chỉ:</label>
                <input type="text" name="address" value="${patient.address}">
            </div>
            <div class="form-group">
                <label>Nhóm máu:</label>
                <select name="bloodType">
                    <option value="">Chọn nhóm máu</option>
                    <option value="A" ${patient.bloodType == 'A' ? 'selected' : ''}>A</option>
                    <option value="B" ${patient.bloodType == 'B' ? 'selected' : ''}>B</option>
                    <option value="AB" ${patient.bloodType == 'AB' ? 'selected' : ''}>AB</option>
                    <option value="O" ${patient.bloodType == 'O' ? 'selected' : ''}>O</option>
                </select>
            </div>
            <div class="form-group">
                <label>Liên hệ khẩn cấp:</label>
                <input type="text" name="emergencyContact" value="${patient.emergencyContact}">
            </div>
            <button type="submit" class="btn-submit">Lưu thông tin</button>
        </form>
        <a href="${pageContext.request.contextPath}/patient/list" class="btn-back">← Quay lại danh sách</a>
    </div>
</body>
</html>