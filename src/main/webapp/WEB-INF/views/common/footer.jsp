<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<footer style="background: #0f172a; color: #94a3b8; padding: 50px 0 20px; margin-top: 60px;">
    <div style="max-width: 1280px; margin: 0 auto; padding: 0 24px;">
        <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 40px; margin-bottom: 40px;">
            <div>
                <div style="display: flex; align-items: center; gap: 8px; margin-bottom: 20px;">
                    <div style="width: 35px; height: 35px; background: linear-gradient(135deg, #2ecc71, #1a5c3e); border-radius: 10px; display: flex; align-items: center; justify-content: center;">
                        <i class="fas fa-heartbeat" style="color: white;"></i>
                    </div>
                    <span style="font-size: 1.3rem; font-weight: 700; color: white;">Medicare</span>
                </div>
                <p style="line-height: 1.6;">Hệ thống y tế thông minh hàng đầu Việt Nam, chăm sóc sức khỏe toàn diện cho bạn và gia đình.</p>
            </div>
            <div>
                <h4 style="color: #2ecc71; margin-bottom: 20px; font-size: 1rem;">Liên kết nhanh</h4>
                <p><a href="${pageContext.request.contextPath}/" style="color:#94a3b8; text-decoration:none; transition:0.3s;">Trang chủ</a></p>
                <p><a href="${pageContext.request.contextPath}/#services" style="color:#94a3b8; text-decoration:none; transition:0.3s;">Dịch vụ</a></p>
                <p><a href="${pageContext.request.contextPath}/#doctors" style="color:#94a3b8; text-decoration:none; transition:0.3s;">Bác sĩ</a></p>
                <p><a href="${pageContext.request.contextPath}/book" style="color:#94a3b8; text-decoration:none; transition:0.3s;">Đặt lịch</a></p>
            </div>
            <div>
                <h4 style="color: #2ecc71; margin-bottom: 20px; font-size: 1rem;">Thông tin liên hệ</h4>
                <p><i class="fas fa-map-marker-alt" style="width: 25px;"></i> 123 Nguyễn Văn Linh, Quận Hải Châu, Đà Nẵng</p>
                <p><i class="fas fa-phone" style="width: 25px;"></i> 0236 123 4567</p>
                <p><i class="fas fa-envelope" style="width: 25px;"></i> info@medicare.vn</p>
                <p><i class="fas fa-clock" style="width: 25px;"></i> Thứ 2 - Thứ 7: 7:30 - 17:30</p>
            </div>
            <div>
                <h4 style="color: #2ecc71; margin-bottom: 20px; font-size: 1rem;">Kết nối với chúng tôi</h4>
                <div style="display: flex; gap: 15px;">
                    <a href="#" style="color: #94a3b8; width: 36px; height: 36px; background: rgba(255,255,255,0.08); border-radius: 50%; display: flex; align-items: center; justify-content: center; transition: 0.3s;"><i class="fab fa-facebook-f"></i></a>
                    <a href="#" style="color: #94a3b8; width: 36px; height: 36px; background: rgba(255,255,255,0.08); border-radius: 50%; display: flex; align-items: center; justify-content: center; transition: 0.3s;"><i class="fab fa-instagram"></i></a>
                    <a href="#" style="color: #94a3b8; width: 36px; height: 36px; background: rgba(255,255,255,0.08); border-radius: 50%; display: flex; align-items: center; justify-content: center; transition: 0.3s;"><i class="fab fa-youtube"></i></a>
                    <a href="#" style="color: #94a3b8; width: 36px; height: 36px; background: rgba(255,255,255,0.08); border-radius: 50%; display: flex; align-items: center; justify-content: center; transition: 0.3s;"><i class="fab fa-tiktok"></i></a>
                </div>
            </div>
        </div>
        <div style="text-align: center; padding-top: 20px; border-top: 1px solid rgba(255,255,255,0.08);">
            <p>&copy; 2026 Medicare - Hệ thống y tế thông minh. All rights reserved.</p>
        </div>
    </div>
</footer>
<style>
    footer a:hover { color: #2ecc71 !important; transform: translateX(3px); display: inline-block; }
</style>