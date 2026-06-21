<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<header style="background: white; box-shadow: 0 4px 20px rgba(0,0,0,0.05); position: fixed; top: 0; left: 0; right: 0; z-index: 1000;">
    <div style="max-width: 1280px; margin: 0 auto; padding: 0 24px;">
        <!-- Top bar: Logo + Search + Actions -->
        <div style="display: flex; justify-content: space-between; align-items: center; height: 80px; gap: 20px;">
            <!-- Logo -->
            <a href="${pageContext.request.contextPath}/" style="display: flex; align-items: center; gap: 12px; text-decoration: none; flex-shrink: 0;">
                <div style="width: 45px; height: 45px; background: linear-gradient(135deg, #1a5c3e, #2ecc71); border-radius: 14px; display: flex; align-items: center; justify-content: center;">
                    <i class="fas fa-heartbeat" style="color: white; font-size: 1.3rem;"></i>
                </div>
                <div>
                    <span style="font-size: 1.4rem; font-weight: 800; color: #1a5c3e; letter-spacing: -0.5px;">Medicare</span>
                    <span style="font-size: 0.65rem; color: #2ecc71; display: block; margin-top: -2px;">Chăm sóc sức khỏe</span>
                </div>
            </a>
            
            <!-- Search Box - Chuyên nghiệp -->
            <div style="flex: 1; max-width: 500px; position: relative;">
                <div style="display: flex; align-items: center; background: #f5f7fb; border-radius: 50px; border: 1px solid #e2e8f0; transition: 0.3s; padding: 0 8px;">
                    <i class="fas fa-search" style="color: #94a3b8; padding-left: 12px; font-size: 1rem;"></i>
                    <input type="text" id="searchInput" placeholder="Tìm bác sĩ, dịch vụ, thuốc..." style="flex: 1; padding: 12px 16px; border: none; background: transparent; outline: none; font-size: 0.9rem;">
                    <button onclick="startVoiceSearch()" style="background: none; border: none; cursor: pointer; padding: 8px; color: #94a3b8; transition: 0.3s;">
                        <i class="fas fa-microphone" style="font-size: 1.1rem;"></i>
                    </button>
                    <button onclick="openQRScanner()" style="background: none; border: none; cursor: pointer; padding: 8px; color: #94a3b8; transition: 0.3s;">
                        <i class="fas fa-qrcode" style="font-size: 1.1rem;"></i>
                    </button>
                </div>
                <!-- Search dropdown -->
                <div id="searchDropdown" style="display: none; position: absolute; top: 55px; left: 0; right: 0; background: white; border-radius: 20px; box-shadow: 0 15px 35px rgba(0,0,0,0.1); z-index: 100; max-height: 400px; overflow-y: auto;">
                    <div id="searchResults"></div>
                </div>
            </div>
            
            <!-- Action buttons -->
            <div style="display: flex; align-items: center; gap: 16px; flex-shrink: 0;">
                <button onclick="openQRScanner()" style="background: #f5f7fb; border: none; width: 40px; height: 40px; border-radius: 50%; cursor: pointer; transition: 0.3s;">
                    <i class="fas fa-qrcode" style="color: #1a5c3e; font-size: 1.1rem;"></i>
                </button>
                <a href="${pageContext.request.contextPath}/book" style="padding: 10px 24px; background: linear-gradient(135deg, #1a5c3e, #2ecc71); border-radius: 40px; text-decoration: none; color: white; font-weight: 600; transition: 0.3s; box-shadow: 0 4px 12px rgba(26,92,62,0.2);">Đặt lịch</a>
                <% if(session.getAttribute("username") == null) { %>
                    <a href="${pageContext.request.contextPath}/login" style="padding: 10px 24px; border: 1px solid #2ecc71; border-radius: 40px; text-decoration: none; color: #2ecc71; font-weight: 500;">Đăng nhập</a>
                    <a href="${pageContext.request.contextPath}/register" style="padding: 10px 24px; background: #2ecc71; border-radius: 40px; text-decoration: none; color: white; font-weight: 500;">Đăng ký</a>
                <% } else { %>
                    <div style="position: relative;">
                        <div style="display: flex; align-items: center; gap: 10px; cursor: pointer;" onclick="toggleUserMenu()">
                            <div style="width: 40px; height: 40px; background: linear-gradient(135deg, #1a5c3e, #2ecc71); border-radius: 50%; display: flex; align-items: center; justify-content: center;">
                                <i class="fas fa-user" style="color: white;"></i>
                            </div>
                            <span style="color: #1a5c3e; font-weight: 500;">${sessionScope.fullName}</span>
                            <i class="fas fa-chevron-down" style="color: #94a3b8; font-size: 0.8rem;"></i>
                        </div>
                        <div id="userMenu" style="display: none; position: absolute; top: 50px; right: 0; background: white; border-radius: 16px; box-shadow: 0 15px 35px rgba(0,0,0,0.1); min-width: 200px; z-index: 100;">
                            <a href="${pageContext.request.contextPath}/profile" style="display: block; padding: 12px 20px; text-decoration: none; color: #1e293b; border-bottom: 1px solid #e2e8f0;"><i class="fas fa-user"></i> Hồ sơ của tôi</a>
                            <a href="${pageContext.request.contextPath}/appointments" style="display: block; padding: 12px 20px; text-decoration: none; color: #1e293b; border-bottom: 1px solid #e2e8f0;"><i class="fas fa-calendar-check"></i> Lịch hẹn</a>
                            <a href="${pageContext.request.contextPath}/logout" style="display: block; padding: 12px 20px; text-decoration: none; color: #dc3545;"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a>
                        </div>
                    </div>
                <% } %>
            </div>
        </div>
        
        <!-- Navigation Menu -->
        <div style="border-top: 1px solid #eef2f6; margin-top: 0;">
            <div style="display: flex; gap: 2rem; padding: 12px 0;">
                <div style="position: relative;" onmouseenter="showDropdown('servicesDropdown')" onmouseleave="hideDropdown('servicesDropdown')">
                    <a href="#" style="text-decoration: none; color: #2c3e50; font-weight: 500; padding: 8px 0; display: inline-block;">Dịch vụ <i class="fas fa-chevron-down" style="font-size: 0.7rem; margin-left: 5px;"></i></a>
                    <div id="servicesDropdown" style="display: none; position: absolute; top: 35px; left: 0; background: white; border-radius: 16px; box-shadow: 0 15px 35px rgba(0,0,0,0.1); min-width: 220px; z-index: 100;">
                        <a href="#" style="display: block; padding: 12px 20px; text-decoration: none; color: #1e293b;"><i class="fas fa-heartbeat"></i> Khám tim mạch</a>
                        <a href="#" style="display: block; padding: 12px 20px; text-decoration: none; color: #1e293b;"><i class="fas fa-baby"></i> Khám nhi khoa</a>
                        <a href="#" style="display: block; padding: 12px 20px; text-decoration: none; color: #1e293b;"><i class="fas fa-bone"></i> Cơ xương khớp</a>
                        <a href="#" style="display: block; padding: 12px 20px; text-decoration: none; color: #1e293b;"><i class="fas fa-eye"></i> Khám mắt</a>
                    </div>
                </div>
                <a href="${pageContext.request.contextPath}/doctors" style="text-decoration: none; color: #2c3e50; font-weight: 500;">Bác sĩ</a>
                <a href="${pageContext.request.contextPath}/#contact" style="text-decoration: none; color: #2c3e50; font-weight: 500;">Liên hệ</a>
                <a href="#" style="text-decoration: none; color: #2c3e50; font-weight: 500;">Tin tức</a>
                <a href="#" style="text-decoration: none; color: #2c3e50; font-weight: 500;">Hỏi đáp</a>
            </div>
        </div>
    </div>
</header>

<!-- QR Scanner Modal -->
<div id="qrModal" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0,0,0,0.8); z-index: 2000; align-items: center; justify-content: center;">
    <div style="background: white; border-radius: 24px; padding: 30px; text-align: center; max-width: 400px;">
        <i class="fas fa-qrcode" style="font-size: 4rem; color: #1a5c3e; margin-bottom: 20px;"></i>
        <h3>Quét mã QR</h3>
        <p style="color: #64748b; margin: 15px 0;">Đưa mã QR vào khung hình để quét</p>
        <div style="width: 250px; height: 250px; background: #f1f5f9; border-radius: 20px; margin: 0 auto; display: flex; align-items: center; justify-content: center;">
            <i class="fas fa-camera" style="font-size: 3rem; color: #94a3b8;"></i>
        </div>
        <button onclick="closeQRScanner()" style="margin-top: 20px; padding: 10px 30px; background: #1a5c3e; color: white; border: none; border-radius: 40px; cursor: pointer;">Đóng</button>
    </div>
</div>

<!-- Voice Search Modal -->
<div id="voiceModal" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0,0,0,0.8); z-index: 2000; align-items: center; justify-content: center;">
    <div style="background: white; border-radius: 24px; padding: 40px; text-align: center; max-width: 400px;">
        <i class="fas fa-microphone" id="voiceIcon" style="font-size: 4rem; color: #1a5c3e; margin-bottom: 20px; animation: pulse 1.5s infinite;"></i>
        <h3>Đang lắng nghe...</h3>
        <p id="voiceText" style="color: #64748b; margin: 15px 0;">Hãy nói tên bác sĩ hoặc dịch vụ bạn muốn tìm</p>
        <button onclick="stopVoiceSearch()" style="margin-top: 20px; padding: 10px 30px; background: #dc3545; color: white; border: none; border-radius: 40px; cursor: pointer;">Dừng</button>
    </div>
</div>

<style>
    @keyframes pulse {
        0%,100% { transform: scale(1); opacity: 1; }
        50% { transform: scale(1.1); opacity: 0.7; }
    }
    .search-box-focus { border-color: #2ecc71; box-shadow: 0 0 0 3px rgba(46,204,113,0.1); }
</style>

<script>
    // Search functionality
    const searchInput = document.getElementById('searchInput');
    const searchDropdown = document.getElementById('searchDropdown');
    const searchResults = document.getElementById('searchResults');
    
    let searchTimeout;
    searchInput.addEventListener('focus', () => {
        searchInput.parentElement.classList.add('search-box-focus');
    });
    searchInput.addEventListener('blur', () => {
        setTimeout(() => {
            searchDropdown.style.display = 'none';
            searchInput.parentElement.classList.remove('search-box-focus');
        }, 200);
    });
    
    searchInput.addEventListener('input', function() {
        clearTimeout(searchTimeout);
        const query = this.value.trim();
        if (query.length < 2) {
            searchDropdown.style.display = 'none';
            return;
        }
        searchTimeout = setTimeout(() => {
            // Simulate search results
            searchResults.innerHTML = `
                <div style="padding: 12px 16px; border-bottom: 1px solid #eef2f6;">
                    <strong>🔍 Tìm kiếm cho: "${query}"</strong>
                </div>
                <a href="#" style="display: block; padding: 12px 16px; text-decoration: none; color: #1e293b; border-bottom: 1px solid #eef2f6;">
                    <i class="fas fa-user-md"></i> BS. Nguyễn Thị Nghiêm - Tim mạch
                </a>
                <a href="#" style="display: block; padding: 12px 16px; text-decoration: none; color: #1e293b; border-bottom: 1px solid #eef2f6;">
                    <i class="fas fa-stethoscope"></i> Dịch vụ khám tim mạch
                </a>
                <a href="#" style="display: block; padding: 12px 16px; text-decoration: none; color: #1e293b;">
                    <i class="fas fa-pills"></i> Thuốc tim mạch
                </a>
            `;
            searchDropdown.style.display = 'block';
        }, 300);
    });
    
    // Voice search
    let recognition;
    function startVoiceSearch() {
        document.getElementById('voiceModal').style.display = 'flex';
        if ('webkitSpeechRecognition' in window) {
            recognition = new webkitSpeechRecognition();
            recognition.continuous = false;
            recognition.interimResults = false;
            recognition.lang = 'vi-VN';
            recognition.onresult = function(event) {
                const text = event.results[0][0].transcript;
                document.getElementById('voiceText').innerHTML = `"${text}"`;
                searchInput.value = text;
                setTimeout(() => {
                    closeVoiceSearch();
                    searchInput.dispatchEvent(new Event('input'));
                }, 1500);
            };
            recognition.start();
        } else {
            document.getElementById('voiceText').innerHTML = 'Trình duyệt của bạn không hỗ trợ ghi âm';
        }
    }
    
    function stopVoiceSearch() {
        if (recognition) recognition.stop();
        closeVoiceSearch();
    }
    
    function closeVoiceSearch() {
        document.getElementById('voiceModal').style.display = 'none';
    }
    
    // QR Scanner
    function openQRScanner() {
        document.getElementById('qrModal').style.display = 'flex';
    }
    
    function closeQRScanner() {
        document.getElementById('qrModal').style.display = 'none';
    }
    
    // User menu
    function toggleUserMenu() {
        const menu = document.getElementById('userMenu');
        menu.style.display = menu.style.display === 'block' ? 'none' : 'block';
    }
    
    // Dropdown menus
    function showDropdown(id) {
        document.getElementById(id).style.display = 'block';
    }
    function hideDropdown(id) {
        document.getElementById(id).style.display = 'none';
    }
    
    // Close dropdowns when clicking outside
    document.addEventListener('click', function(e) {
        const userMenu = document.getElementById('userMenu');
        if (userMenu && !e.target.closest('.user-menu-trigger')) {
            userMenu.style.display = 'none';
        }
    });
</script>