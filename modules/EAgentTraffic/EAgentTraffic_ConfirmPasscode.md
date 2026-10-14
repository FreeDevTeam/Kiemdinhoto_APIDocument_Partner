# Partner API - Confirm Passcode (EAgentTraffic)

Tài liệu API xác nhận mã bảo mật Passcode / PIN của tài khoản đối tác tra cứu thông tin giao thông để lấy JWT Token truy cập cho các phiên làm việc tiếp theo.

[Về module EAgentTraffic](./index.html)

---

## Endpoint

|        |                                                |
| ------ | ---------------------------------------------- |
| URL    | /ThirdParty/EAgentTraffic/user/confirmPasscode |
| Method | POST                                           |

---

## Headers schema

| Header                 | Required | Mô tả                         |
| ---------------------- | -------- | ----------------------------- |
| clientId hoặc clientid | Yes      | Mã định danh đối tác          |
| apiKey hoặc apikey     | Yes      | Khóa xác thực API của đối tác |

---

## Body schema

| Field    | Type   | Required | Rule                        | Mô tả                                                   |
| -------- | ------ | -------- | --------------------------- | ------------------------------------------------------- |
| username | string | Yes      | required, max 255, alphanum | **Dữ liệu thật** — Số CCCD / CMND thật của tài khoản đối tác tra cứu thông tin giao thông. |
| passcode | string | No       | alphanum, max 20            | **Dữ liệu thật** — Mã Passcode / mã PIN bảo mật thật của tài khoản đối tác.               |

---

## Sample Request

```bash
curl --location '{HOST_NAME}/ThirdParty/EAgentTraffic/user/confirmPasscode' \
  --header 'Content-Type: application/json' \
  --header 'clientId: TESTCLIENT' \
  --header 'apiKey: 07e73e61-0dce-4b39-8ecf-06ef70b35c08' \
  --data '{
    "username": "001201012345",
    "passcode": "123456"
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
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
  }
}
```

---

## Mã lỗi

| HTTP | Mã lỗi                               | Mô tả                                                        |
| ---- | ------------------------------------ | ------------------------------------------------------------ |
| 400  | _Validation Error_                   | Payload không đúng schema (thiếu `username`, format sai).    |
| 429  | `QUOTA_EXCEEDED`                     | apiKey không hợp lệ hoặc đã vượt quá hạn mức gọi API.        |
| 500  | `INCORRECT_PASSWORD`                 | Mã Passcode / PIN bảo mật không chính xác.                   |
| 500  | `AGENTETRAFFIC_CONFIRM_PASSCODE_FAILED` | Gặp lỗi hoặc xác nhận mã Passcode/PIN thất bại với cổng dịch vụ. |
| 500  | `INVALID_USERNAME`                   | Số CCCD / tài khoản đối tác không hợp lệ hoặc không tìm thấy. |
| 500  | `UNKNOWN_ERROR`                      | Lỗi không xác định.                                          |

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

| Passcode | Kịch bản | Kết quả giả lập |
| :--- | :--- | :--- |
| `123456` | Passcode hợp lệ | Thành công – `success = true`; trả về token giả lập và thông tin người dùng mẫu. |
| `000000` | Passcode không chính xác | Thất bại – `INCORRECT_PASSWORD`. |
| `999999` | Lỗi xác nhận Passcode | Thất bại – `AGENTETRAFFIC_CONFIRM_PASSCODE_FAILED`. |

> **Lưu ý phân biệt môi trường:**
> - **Môi trường Test / Sandbox (Mock):** Dùng các mã Passcode giả lập ở bảng trên để kiểm thử đầy đủ luồng thành công và các kịch bản lỗi.
> - **Môi trường Thật (Production):** Bắt buộc sử dụng số CCCD và mã Passcode thật của tài khoản đối tác đã thiết lập trên hệ thống dịch vụ giao thông.

