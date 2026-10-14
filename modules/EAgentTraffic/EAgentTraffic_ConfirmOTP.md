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

| HTTP | Mã lỗi                            | Mô tả                                                      |
| ---- | --------------------------------- | ---------------------------------------------------------- |
| 400  | _Validation Error_                | Payload không đúng schema (thiếu `username`, format sai).  |
| 429  | `QUOTA_EXCEEDED`                  | apiKey không hợp lệ hoặc đã vượt quá hạn mức gọi API.      |
| 500  | `INCORRECT_OTP`                   | Mã OTP không chính xác hoặc đã hết thời gian hiệu lực.     |
| 500  | `AGENTETRAFFIC_CONFIRM_OTP_FAILED`| Gặp lỗi hoặc xác nhận mã OTP thất bại với cổng dịch vụ.   |
| 500  | `INVALID_USERNAME`                | Tài khoản đối tác không tồn tại trong hệ thống.             |
| 500  | `UNKNOWN_ERROR`                   | Lỗi không xác định.                                        |

---

## Tham khảo

- [Quy chuẩn chung -> Common Error](../../Common.html#common-error) — danh sách mã lỗi hệ thống trả về trong trường `error`.
- [Quy chuẩn chung -> EAgentTraffic Error Code](../../Common.html#eagent-traffic-error) — danh sách mã lỗi nghiệp vụ đối tác tra cứu giao thông.
- [Tài liệu Mock Data & Test Cases (Google Docs)](https://docs.google.com/document/d/1rH_bplN7X_u5w-9LmSPz6N0gxKE_PrBh/edit?usp=drive_link&ouid=107206561223621806562&rtpof=true&sd=true)

---

## Dữ liệu và Lưu ý quan trọng cho Developer

- clientId: TESTCLIENT
- apiKey: 07e73e61-0dce-4b39-8ecf-06ef70b35c08

### Dữ liệu giả lập kiểm thử (Mock Test Data):
Tham khảo kịch bản giả lập từ [Google Docs](https://docs.google.com/document/d/1rH_bplN7X_u5w-9LmSPz6N0gxKE_PrBh/edit?usp=drive_link&ouid=107206561223621806562&rtpof=true&sd=true):

| OTP | Kịch bản | Kết quả giả lập |
| :--- | :--- | :--- |
| `123456` | OTP hợp lệ | Thành công – `success = true`; trả về token giả lập và thông tin người dùng mẫu. |
| `000000` | OTP không chính xác | Thất bại – `INCORRECT_OTP`. |
| `999999` | Lỗi xác nhận OTP | Thất bại – `AGENTETRAFFIC_CONFIRM_OTP_FAILED`. |

> **Lưu ý phân biệt môi trường:**
> - **Môi trường Test / Sandbox (Mock):** Dùng các mã OTP giả lập ở bảng trên để kiểm thử đầy đủ luồng thành công và các trường hợp lỗi.
> - **Môi trường Thật (Production):** API kết nối trực tiếp đến cổng xác thực dịch vụ giao thông, `username` và `otp` bắt buộc phải là dữ liệu thật do hệ thống gửi về SMS.


