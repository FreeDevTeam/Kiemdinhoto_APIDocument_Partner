# Partner API - Confirm OTP (EAgentTraffic)

Tài liệu API xác nhận mã OTP đăng nhập đại lý tra cứu giao thông. Sau khi gửi mã OTP qua API `requestLoginByOTP`, đối tác gọi API này kèm mã OTP người dùng nhận được để hoàn tất quy trình xác thực.

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

| Field    | Type   | Required | Rule                        | Mô tả                                                          |
| -------- | ------ | -------- | --------------------------- | -------------------------------------------------------------- |
| username | string | Yes      | required, max 255, alphanum | Số CCCD / CMND của tài khoản đại lý tra cứu giao thông.        |
| otp      | string | No       | alphanum, max 20            | Mã xác thực OTP nhận được qua SMS / ứng dụng dịch vụ CSGT.    |

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
| 500  | `INVALID_USERNAME` | Tài khoản đại lý không tồn tại trong hệ thống.             |
| 500  | `UNKNOWN_ERROR`    | Lỗi không xác định.                                        |

---

## Tham khảo

- [Quy chuẩn chung -> Common Error](../../Common.html#common-error) — danh sách mã lỗi hệ thống trả về trong trường `error`.
- [Quy chuẩn chung -> EAgentTraffic Error Code](../../Common.html#eagent-traffic-error) — danh sách mã lỗi nghiệp vụ đại lý tra cứu giao thông.

---

## Data test cho developer

- clientId: TESTCLIENT
- apiKey: 07e73e61-0dce-4b39-8ecf-06ef70b35c08
- username (CCCD đại lý): 001201012345
- otp test: 123456

Cần thay bằng dữ liệu môi trường thật khi tích hợp.
