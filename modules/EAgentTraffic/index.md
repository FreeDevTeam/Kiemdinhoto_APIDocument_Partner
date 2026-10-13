# Partner API Module: EAgentTraffic

Module cung cấp các API tích hợp đại lý tra cứu thông tin giao thông và phạt nguội phương tiện (`EAgentTraffic`). Hệ thống hỗ trợ quy trình xác thực tài khoản đại lý (qua OTP, Passcode, 2FA) và tra cứu cảnh báo vi phạm của phương tiện giao thông với cơ chế phân phối và xoay vòng Quota tự động.

## Danh sách API

1. Request Login By OTP (Yêu cầu đăng nhập đại lý qua OTP)
- HTML: ./EAgentTraffic_RequestLoginByOTP.html
- MD: ./EAgentTraffic_RequestLoginByOTP.md

2. Confirm OTP (Xác nhận mã OTP)
- HTML: ./EAgentTraffic_ConfirmOTP.html
- MD: ./EAgentTraffic_ConfirmOTP.md

3. Request Login By 2FA (Yêu cầu đăng nhập đại lý qua 2FA)
- HTML: ./EAgentTraffic_RequestLoginBy2FA.html
- MD: ./EAgentTraffic_RequestLoginBy2FA.md

4. Confirm Passcode (Xác nhận mã Passcode đại lý)
- HTML: ./EAgentTraffic_ConfirmPasscode.html
- MD: ./EAgentTraffic_ConfirmPasscode.md

5. Lookup Warning For Vehicle (Tra cứu phạt nguội phương tiện)
- HTML: ./EAgentTraffic_LookupWarningForVehicle.html
- MD: ./EAgentTraffic_LookupWarningForVehicle.md

## Data test tham chiếu

- clientId: TESTCLIENT
- apiKey: 07e73e61-0dce-4b39-8ecf-06ef70b35c08
- username test (CCCD đại lý): 001201012345
- OTP test: 123456
- plateNumber test: 30L-408.53 (hoặc 30L40853)
- vehicleType test: 1 (Ô tô con)
- phoneNumber test: 0987654321

Lưu ý cho developer:
- Các API xác thực yêu cầu header `clientId` và `apiKey` của đối tác.
- Sau khi xác thực đăng nhập thành công, hệ thống cấp JWT Token. API tra cứu phạt nguội (`lookupWarningForVehicle`) yêu cầu truyền header `Authorization: Bearer <TOKEN>`.
- Trước khi triển khai UAT/Production, cần thay thế dữ liệu mẫu bằng tài khoản đại lý và thông tin phương tiện thực tế.
