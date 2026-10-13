# Partner API Module: EAgentTraffic

Module cung cấp các API tích hợp xác thực tài khoản đối tác tra cứu thông tin giao thông (`EAgentTraffic`). Hệ thống hỗ trợ quy trình đăng nhập và xác thực tài khoản đối tác thông qua mã OTP thật gửi về SMS, mã bảo mật Passcode/PIN hoặc phương thức xác thực hai yếu tố (2FA).

## Danh sách API

1. Request Login By OTP (Yêu cầu đăng nhập đối tác qua OTP)
- HTML: ./EAgentTraffic_RequestLoginByOTP.html
- MD: ./EAgentTraffic_RequestLoginByOTP.md

2. Confirm OTP (Xác nhận mã OTP)
- HTML: ./EAgentTraffic_ConfirmOTP.html
- MD: ./EAgentTraffic_ConfirmOTP.md

3. Request Login By 2FA (Yêu cầu đăng nhập đối tác qua 2FA)
- HTML: ./EAgentTraffic_RequestLoginBy2FA.html
- MD: ./EAgentTraffic_RequestLoginBy2FA.md

4. Confirm Passcode (Xác nhận mã Passcode đối tác)
- HTML: ./EAgentTraffic_ConfirmPasscode.html
- MD: ./EAgentTraffic_ConfirmPasscode.md

## Data test và Lưu ý quan trọng cho Developer

- clientId: TESTCLIENT
- apiKey: 07e73e61-0dce-4b39-8ecf-06ef70b35c08
- **username**: **Dữ liệu thật** — Số CCCD / CMND thật của tài khoản đối tác (ví dụ: `001201012345` hoặc số CCCD thật của đối tác).
- **otp**: **Dữ liệu thật** — Mã OTP thật do hệ thống dịch vụ giao thông gửi về số điện thoại đăng ký qua SMS khi gọi API `requestLoginByOTP`.
- **passcode**: **Dữ liệu thật** — Mã Passcode / PIN thật của tài khoản đối tác.

> **Lưu ý quan trọng**:
> - Hệ thống kết nối trực tiếp đến cổng dịch vụ xác thực giao thông bên thứ ba, do đó trường `username` (số CCCD/CMND) và `otp` (mã OTP qua SMS) **bắt buộc phải là dữ liệu thật**, không dùng dữ liệu mock/giả lập.
> - Sau khi xác thực thành công (qua OTP hoặc Passcode), API sẽ trả về `token` (JWT Token) của phiên làm việc.
