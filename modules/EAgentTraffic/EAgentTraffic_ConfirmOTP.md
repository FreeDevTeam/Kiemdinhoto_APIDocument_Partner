# Partner API - Confirm OTP (EAgentTraffic)

Tài liệu API xác nhận mã OTP đăng nhập đối tác tra cứu thông tin giao thông. Sau khi gửi mã OTP qua API `requestLoginByOTP`, đối tác gọi API này kèm mã OTP người dùng nhận được để hoàn tất quy trình xác thực.

[Về module EAgentTraffic](./index.html)

---

## Endpoint

|        |                                           |
| ------ | ----------------------------------------- |
| URL    | /ThirdParty/EAgentTraffic/user/confirmOTP |
| Method | POST                                      |

---

## Headers schema

| Header                 | Required | Mô tả                         |
| ---------------------- | -------- | ----------------------------- |
| clientId hoặc clientid | Yes      | Mã định danh đối tác          |
| apiKey hoặc apikey     | Yes      | Khóa xác thực API của đối tác |

---

## Body schema

| Field    | Type   | Required | Rule                        | Mô tả                                                                    |
| -------- | ------ | -------- | --------------------------- | ------------------------------------------------------------------------ |
| username | string | Yes      | required, max 255, alphanum | **Dữ liệu thật** — Số CCCD / CMND thật của tài khoản đối tác tra cứu thông tin giao thông. |
| otp      | string | No       | alphanum, max 20            | **Dữ liệu thật** — Mã xác thực OTP thật nhận được qua SMS của đối tác. |

---

## Sample Request

```bash
curl --location '{HOST_NAME}/ThirdParty/EAgentTraffic/user/confirmOTP' \
  --header 'Content-Type: application/json' \
  --header 'clientId: TESTCLIENT' \
  --header 'apiKey: 07e73e61-0dce-4b39-8ecf-06ef70b35c08' \
  --data '{
    "username": "001201012345",
    "otp": "123456"
  }'
```

---

## Success response

```json
{
  "statusCode": 200,
  "error": null,
  "message": "Success",
  "data": {
    "success": true,
    "message": "OTP verified successfully"
  }
}
```

---

## Mã lỗi

| HTTP | Mã lỗi             | Mô tả                                                      |
| ---- | ------------------ | ---------------------------------------------------------- |
| 400  | _Validation Error_ | Payload không đúng schema (thiếu `username`, format sai).  |
| 429  | `QUOTA_EXCEEDED`   | apiKey không hợp lệ hoặc đã vượt quá hạn mức gọi API.      |
| 500  | `INCORRECT_OTP`    | Mã OTP không chính xác hoặc đã hết thời gian hiệu lực.     |
| 500  | `INVALID_USERNAME` | Tài khoản đối tác không tồn tại trong hệ thống.             |
| 500  | `UNKNOWN_ERROR`    | Lỗi không xác định.                                        |

---

## Tham khảo

- [Quy chuẩn chung -> Common Error](../../Common.html#common-error) — danh sách mã lỗi hệ thống trả về trong trường `error`.
- [Quy chuẩn chung -> EAgentTraffic Error Code](../../Common.html#eagent-traffic-error) — danh sách mã lỗi nghiệp vụ đối tác tra cứu giao thông.

---

## Dữ liệu và Lưu ý quan trọng cho Developer

- clientId: TESTCLIENT
- apiKey: 07e73e61-0dce-4b39-8ecf-06ef70b35c08
- **username**: **Dữ liệu thật** — Số CCCD / CMND thật của tài khoản đối tác.
- **otp**: **Dữ liệu thật** — Mã OTP thật do hệ thống dịch vụ giao thông gửi về SMS khi gọi API `requestLoginByOTP`.

> **Lưu ý:** API kết nối trực tiếp đến cổng xác thực dịch vụ giao thông, `username` và `otp` bắt buộc phải là dữ liệu thật, không sử dụng mã OTP giả lập.

