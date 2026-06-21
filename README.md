# 🏥 Medicare - Hệ thống Đặt lịch Khám bệnh Thông minh

![Java](https://img.shields.io/badge/Java-17-blue.svg)
![Spring](https://img.shields.io/badge/Spring-5.3.30-green.svg)
![MySQL](https://img.shields.io/badge/MySQL-8.0-orange.svg)
![Tomcat](https://img.shields.io/badge/Tomcat-9.0-red.svg)
![Version](https://img.shields.io/badge/Version-1.0.0-brightgreen.svg)

---

## 📋 Giới thiệu

**Medicare** là nền tảng đặt lịch khám bệnh trực tuyến thông minh, ứng dụng trí tuệ nhân tạo (AI) để phân tích triệu chứng và gợi ý bác sĩ phù hợp nhất cho từng bệnh nhân. Hệ thống được xây dựng nhằm giải quyết bài toán quá tải và tối ưu hóa quy trình khám chữa bệnh trong thời đại công nghệ số.

---

## 🎯 Mục tiêu

### 1. Tối ưu hóa trải nghiệm bệnh nhân
- Cung cấp công cụ tìm kiếm bác sĩ thông minh, tiết kiệm thời gian chờ đợi
- Quy trình đặt lịch đơn giản, nhanh chóng chỉ với vài thao tác
- Thanh toán trực tuyến tiện lợi, an toàn

### 2. Tự động hóa quản lý y tế
- Tự động phân bổ bác sĩ dựa trên nhu cầu của bệnh nhân
- Hệ thống nhắc nhở lịch hẹn, tránh bỏ lỡ cuộc hẹn
- Tự động hủy lịch nếu bệnh nhân không thanh toán đúng hạn

### 3. Nâng cao hiệu quả công việc của bác sĩ
- Dashboard hiển thị lịch khám trực quan, dễ quản lý
- Quản lý hồ sơ bệnh nhân tập trung, đầy đủ
- Hỗ trợ kê đơn thuốc nhanh chóng, chính xác

### 4. Quản lý tập trung cho Admin
- Giám sát toàn bộ hoạt động của hệ thống
- Báo cáo, thống kê doanh thu, số liệu bệnh nhân
- Quản lý bác sĩ, chuyên khoa linh hoạt

---

## 🚀 Nghiệp vụ chính

### Quy trình đặt lịch thông minh

**1. Phân tích triệu chứng bằng AI**
- Bệnh nhân nhập triệu chứng (đau đầu, sốt, ho, đau bụng...)
- Hệ thống AI phân tích, gợi ý chuyên khoa phù hợp
- Gợi ý danh sách bác sĩ có chuyên môn tương ứng

**2. Đặt lịch hẹn**
- Xem thông tin chi tiết bác sĩ (chuyên khoa, kinh nghiệm, đánh giá)
- Chọn ngày, giờ còn trống theo lịch của bác sĩ
- Xác nhận đặt lịch

**3. Xác nhận và thanh toán**
- Gửi email xác nhận đặt lịch thành công
- Chuyển sang trang thanh toán trực tuyến (VNPay/Momo)
- Bệnh nhân có **10 phút** để hoàn tất thanh toán

**4. Quản lý trạng thái lịch hẹn**
- ✅ **PENDING**: Chờ thanh toán (tự động hủy sau 10 phút)
- ✅ **PAID**: Đã thanh toán, đợi bác sĩ xác nhận
- ✅ **CONFIRMED**: Bác sĩ xác nhận lịch khám
- ✅ **COMPLETED**: Đã khám xong
- ❌ **CANCELLED**: Bị hủy (do không thanh toán/hủy bởi bác sĩ/bệnh nhân)

**5. Nhắc nhở và thông báo**
- Gửi email nhắc lịch hẹn trước 1 ngày
- Gửi thông báo khi bác sĩ thay đổi lịch
- Gửi báo cáo sau khi khám

---

## 📊 Chức năng theo vai trò

### 👤 Bệnh nhân
- 🔍 **Tìm bác sĩ thông minh với AI**
- 📅 **Đặt lịch khám** theo bác sĩ, ngày giờ
- 💳 **Thanh toán trực tuyến** an toàn, nhanh chóng
- 📋 **Quản lý lịch hẹn**: Xem, hủy, thay đổi
- 📝 **Lịch sử khám bệnh**: Lưu trữ hồ sơ sức khỏe cá nhân
- ⏰ **Tự động hủy lịch** nếu quá 10 phút không thanh toán

### 👨‍⚕️ Bác sĩ
- 📊 **Dashboard**: Xem lịch khám trong ngày, tuần
- ✅ **Xác nhận/từ chối** lịch hẹn của bệnh nhân
- 👥 **Quản lý bệnh nhân**: Xem thông tin và tiền sử bệnh
- 💊 **Kê đơn thuốc**: Tạo và lưu đơn thuốc cho bệnh nhân
- 📈 **Xem đánh giá** từ bệnh nhân

### 🛡️ Admin
- 📊 **Dashboard tổng quan**: Doanh thu, bệnh nhân, lịch hẹn
- 👨‍⚕️ **Quản lý bác sĩ**: Thêm/sửa/xóa, phân chuyên khoa
- 👤 **Quản lý bệnh nhân**: Duyệt, khóa tài khoản
- 💰 **Quản lý thanh toán**: Xác nhận, đối soát giao dịch
- 📅 **Quản lý lịch hẹn**: Giám sát và xử lý lịch hẹn
- 📊 **Báo cáo thống kê**: Xuất báo cáo doanh thu, đánh giá hiệu quả

---

## 🛠️ Công nghệ

| Thành phần | Công nghệ |
|------------|-----------|
| Ngôn ngữ | Java 17 |
| Framework | Spring 5.3.30 |
| ORM | Spring JDBC |
| Database | MySQL 8.0 |
| Frontend | JSP, Bootstrap 5 |
| Build Tool | Maven 3.8 |
| Server | Apache Tomcat 9.0 |
| AI Engine | TensorFlow/Python (API) |
| Payment | VNPay/Momo |

---

## 🚀 Hướng dẫn cài đặt

### Yêu cầu hệ thống
- JDK 17+
- Maven 3.8+
- MySQL 8.0+
- Apache Tomcat 9.0

### Clone dự án
\\\ash
git clone https://github.com/Chamm286/java_web_MEDICARE.git
cd java_web_MEDICARE
\\\

### Cấu hình database
\\\sql
CREATE DATABASE medicare_db CHARACTER SET utf8mb4;
\\\

Cập nhật thông tin kết nối trong file:
\src/main/resources/database.properties\

### Build và chạy
\\\ash
mvn clean install
mvn tomcat7:run
\\\

### Truy cập
- **Web**: http://localhost:8080
- **Admin**: http://localhost:8080/admin/dashboard
- **Bác sĩ**: http://localhost:8080/doctor/dashboard
- **Bệnh nhân**: http://localhost:8080/patient/dashboard

---

## 👤 Tác giả

**Nguyễn Thị Bích Trâm** - Developer

---

## 📄 Bản quyền

Copyright © 2026 **Medicare System**. All rights reserved.

---

## 🙏 Lời cảm ơn

Cảm ơn các bạn đã quan tâm đến dự án. Mọi đóng góp vui lòng liên hệ hoặc tạo issue trên GitHub!

