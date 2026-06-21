<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách bệnh nhân - Medicare</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f0f2f5;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            background: white;
            border-radius: 15px;
            padding: 20px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
        }
        h1 {
            color: #667eea;
            margin-bottom: 20px;
        }
        .btn-add {
            background: #667eea;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            display: inline-block;
            margin-bottom: 20px;
        }
        .btn-add:hover {
            background: #764ba2;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background: #667eea;
            color: white;
        }
        tr:hover {
            background: #f5f5f5;
        }
        .btn-edit, .btn-delete {
            padding: 5px 10px;
            text-decoration: none;
            border-radius: 3px;
            margin: 0 5px;
        }
        .btn-edit {
            background: #ffc107;
            color: #333;
        }
        .btn-delete {
            background: #dc3545;
            color: white;
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
        <h1>📋 Danh sách bệnh nhân</h1>
        <a href="${pageContext.request.contextPath}/patient/add" class="btn-add">➕ Thêm bệnh nhân mới</a>
        
        <table>
            <thead>
                <tr>
                    <th>Mã BN</th>
                    <th>Họ tên</th>
                    <th>Ngày sinh</th>
                    <th>Giới tính</th>
                    <th>Số điện thoại</th>
                    <th>Địa chỉ</th>
                    <th>Nhóm máu</th>
                    <th>Thao tác</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${patients}" var="p">
                    <tr>
                        <td>${p.patientId}</td>
                        <td>${p.name}</td>
                        <td>${p.dob}</td>
                        <td>${p.gender == 'M' ? 'Nam' : 'Nữ'}</td>
                        <td>${p.phone}</td>
                        <td>${p.address}</td>
                        <td>${p.bloodType}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/patient/edit/${p.patientId}" class="btn-edit">Sửa</a>
                            <a href="${pageContext.request.contextPath}/patient/delete/${p.patientId}" class="btn-delete" onclick="return confirm('Bạn có chắc muốn xóa?')">Xóa</a>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty patients}">
                    <tr>
                        <td colspan="8" style="text-align: center;">Chưa có dữ liệu</td>
                    </tr>
                </c:if>
            </tbody>
        </table>
        <a href="${pageContext.request.contextPath}/" class="btn-back">← Về trang chủ</a>
    </div>
</body>
</html>