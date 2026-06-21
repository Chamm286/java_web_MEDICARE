# 🏥 Medicare - Hệ thống Đặt lịch Khám bệnh Thông minh

![Java](https://img.shields.io/badge/Java-17-blue.svg)
![Spring](https://img.shields.io/badge/Spring-5.3.30-green.svg)
![MySQL](https://img.shields.io/badge/MySQL-8.0-orange.svg)
![Tomcat](https://img.shields.io/badge/Tomcat-9.0-red.svg)

## 📋 Giới thiệu

**Medicare** là hệ thống quản lý đặt lịch khám bệnh thông minh, tích hợp **AI** để gợi ý bác sĩ phù hợp dựa trên triệu chứng của bệnh nhân, giúp tối ưu hóa quy trình khám chữa bệnh.

## 🚀 Tính năng chính

### 👤 Bệnh nhân (Patient)
- 🔍 Tìm kiếm bác sĩ thông minh với AI
- 📅 Đặt lịch khám bệnh
- 💳 Thanh toán trực tuyến
- ⏰ Tự động hủy lịch sau 10 phút
- 📋 Quản lý lịch sử khám bệnh

### 👨‍⚕️ Bác sĩ (Doctor)
- 📊 Dashboard lịch khám trong ngày
- ✅ Xác nhận/từ chối lịch hẹn
- 📝 Kê đơn thuốc
- 👥 Quản lý bệnh nhân

### 🛡️ Admin
- 📈 Dashboard thống kê tổng quan
- 👨‍⚕️ Quản lý bác sĩ, chuyên khoa
- 👤 Quản lý người dùng
- 💰 Quản lý thanh toán
- 📊 Xuất báo cáo doanh thu

## 🔄 Quy trình đặt lịch

1. Bệnh nhân nhập triệu chứng
2. AI phân tích → Gợi ý bác sĩ phù hợp
3. Chọn bác sĩ, ngày giờ
4. Đặt lịch (PENDING)
5. Thanh toán trong 10 phút
6. Nếu thanh toán → PAID → Gửi email xác nhận
7. Nếu không thanh toán → CANCELLED

## 🛠️ Công nghệ sử dụng

### Backend
- Java 17
- Spring Framework 5.3.30
- Spring MVC
- Spring JDBC
- MySQL 8.0
- Apache Tomcat 9.0

### Frontend
- JSP
- HTML5, CSS3
- JavaScript
- Bootstrap 5
- FontAwesome 6

### Tools
- Maven 3.8+
- IntelliJ IDEA
- Git & GitHub

## 📁 Cấu trúc thư mục

\\\
src/main/
├── java/com/medicare/
│   ├── controller/     # Xử lý request
│   ├── dao/           # Truy xuất database
│   ├── model/         # Entity classes
│   ├── service/       # Business logic
│   └── config/        # Cấu hình Spring
└── webapp/
    ├── WEB-INF/
    │   └── views/
    │       ├── admin/      # Giao diện Admin
    │       ├── doctor/     # Giao diện Bác sĩ
    │       ├── patient/    # Giao diện Bệnh nhân
    │       └── public/     # Trang chủ, giới thiệu
    └── assets/
        ├── css/
        ├── js/
        └── images/
\\\

## 🚀 Cài đặt và chạy

### Yêu cầu
- JDK 17+
- Maven 3.8+
- MySQL 8.0+
- Apache Tomcat 9.0

### Bước 1: Clone project
\\\ash
git clone https://github.com/Chamm286/java_web_MEDICARE.git
cd java_web_MEDICARE
\\\

### Bước 2: Cấu hình database
\\\sql
CREATE DATABASE medicare_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
\\\

### Bước 3: Cấu hình kết nối
Sửa file \src/main/resources/application.properties\:
\\\properties
spring.datasource.url=jdbc:mysql://localhost:3306/medicare_db
spring.datasource.username=root
spring.datasource.password=your_password
\\\

### Bước 4: Build và chạy
\\\ash
mvn clean install
mvn tomcat7:run
\\\

### Bước 5: Truy cập
- Web: http://localhost:8080
- Admin: http://localhost:8080/admin/dashboard

## 👥 Tác giả

**Nguyễn Thị Bích Trâm**

## 📄 License

Copyright © 2024 Medicare. All rights reserved.

## 🙏 Cảm ơn

Cảm ơn bạn đã quan tâm đến dự án Medicare!
