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

## Thông tin giả lập (Mock Data & Test Cases)

Tài liệu mô tả dữ liệu giả lập phục vụ kiểm thử tích hợp API (sandbox / test environment). Các dữ liệu đầu vào mẫu và kết quả phản hồi giả lập dưới đây giúp đối tác thử nghiệm tích hợp các luồng thành công và lỗi mà không cần tài khoản thực tế.

> 📄 **Tài liệu Google Docs gốc**: [EAgentTraffic – Mock Data & Test Cases](https://docs.google.com/document/d/1rH_bplN7X_u5w-9LmSPz6N0gxKE_PrBh/edit?usp=drive_link&ouid=107206561223621806562&rtpof=true&sd=true)

### 1. Yêu cầu đăng nhập bằng OTP (`requestLoginByOTP`)

| Username / CCCD | Kịch bản | Kết quả giả lập |
| :--- | :--- | :--- |
| `001200000001` | Gửi OTP thành công | Thành công – trả về token giả lập và thông báo mã OTP đã được gửi. |
| `999000000001` | Tên đăng nhập không hợp lệ | Thất bại – `INVALID_USERNAME`. |
| `999000000002` | Không được xác thực | Thất bại – `AGENTETRAFFIC_UNAUTHORIZED`. |
| `999000000003` | Lỗi gửi yêu cầu OTP | Thất bại – `AGENTETRAFFIC_OTP_REQUEST_ERROR`. |
| `999000000004` | Vượt hạn mức tra cứu | Thất bại – `AGENT_QUOTA_EXCEEDED`. |

### 2. Yêu cầu đăng nhập bằng 2FA (`requestLoginBy2FA`)

| Username / CCCD | Kịch bản | Kết quả giả lập |
| :--- | :--- | :--- |
| `001200000001` | Yêu cầu 2FA thành công | Thành công – `success = true`, `requireOtp = true`, có session giả lập. |
| `999000000005` | Xác thực thất bại | Thất bại – `AGENTETRAFFIC_AUTHENTICATION_FAILED`. |

### 3. Xác nhận OTP (`confirmOTP`)

| OTP | Kịch bản | Kết quả giả lập |
| :--- | :--- | :--- |
| `123456` | OTP hợp lệ | Thành công – `success = true`; trả về token giả lập và thông tin người dùng mẫu. |
| `000000` | OTP không chính xác | Thất bại – `INCORRECT_OTP`. |
| `999999` | Lỗi xác nhận OTP | Thất bại – `AGENTETRAFFIC_CONFIRM_OTP_FAILED`. |

### 4. Xác nhận Passcode (`confirmPasscode`)

| Passcode | Kịch bản | Kết quả giả lập |
| :--- | :--- | :--- |
| `123456` | Passcode hợp lệ | Thành công – `success = true`; trả về token giả lập và thông tin người dùng mẫu. |
| `000000` | Passcode không chính xác | Thất bại – `INCORRECT_PASSWORD`. |
| `999999` | Lỗi xác nhận Passcode | Thất bại – `AGENTETRAFFIC_CONFIRM_PASSCODE_FAILED`. |

---

## Data test và Lưu ý quan trọng cho Developer

- clientId: TESTCLIENT
- apiKey: 07e73e61-0dce-4b39-8ecf-06ef70b35c08

> **Lưu ý phân biệt môi trường:**
> - **Môi trường Test / Sandbox (Mock)**: Có thể sử dụng các bộ dữ liệu mẫu (CCCD/Username, OTP, Passcode) được mô tả trong mục [Thông tin giả lập (Mock Data & Test Cases)](#thông-tin-giả-lập-mock-data--test-cases) hoặc xem trực tiếp tại [Google Docs](https://docs.google.com/document/d/1rH_bplN7X_u5w-9LmSPz6N0gxKE_PrBh/edit?usp=drive_link&ouid=107206561223621806562&rtpof=true&sd=true) để mô phỏng đầy đủ các kịch bản thành công và lỗi.
> - **Môi trường Thật (Production)**: Hệ thống kết nối trực tiếp đến cổng dịch vụ xác thực giao thông bên thứ ba, do đó trường `username` (số CCCD/CMND) và `otp` (mã OTP qua SMS) / `passcode` **bắt buộc phải là dữ liệu thật** của tài khoản đối tác.
> - Sau khi xác thực thành công (qua OTP hoặc Passcode), API sẽ trả về `token` (JWT Token) của phiên làm việc.

