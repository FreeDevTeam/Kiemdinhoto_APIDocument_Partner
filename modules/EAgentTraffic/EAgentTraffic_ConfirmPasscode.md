# Partner API - Confirm Passcode (EAgentTraffic)

Tài liệu API xác nhận mã bảo mật Passcode / PIN của tài khoản đại lý tra cứu giao thông để lấy JWT Token truy cập cho các tác vụ tiếp theo (như tra cứu cảnh báo phạt nguội).

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
| username | string | Yes      | required, max 255, alphanum | Số CCCD / CMND của tài khoản đại lý tra cứu giao thông. |
| passcode | string | No       | alphanum, max 20            | Mã Passcode / mã PIN bảo mật của tài khoản đại lý.      |

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

| HTTP | Mã lỗi               | Mô tả                                                        |
| ---- | -------------------- | ------------------------------------------------------------ |
| 400  | _Validation Error_   | Payload không đúng schema (thiếu `username`, format sai).    |
| 429  | `QUOTA_EXCEEDED`     | apiKey không hợp lệ hoặc đã vượt quá hạn mức gọi API.        |
| 500  | `INCORRECT_PASSWORD` | Mã Passcode / PIN bảo mật không chính xác.                   |
| 500  | `INVALID_USERNAME`   | Số CCCD / tài khoản đại lý không hợp lệ hoặc không tìm thấy. |
| 500  | `UNKNOWN_ERROR`      | Lỗi không xác định.                                          |

---

## Tham khảo

- [Quy chuẩn chung -> Common Error](../../Common.html#common-error) — danh sách mã lỗi hệ thống trả về trong trường `error`.
- [Quy chuẩn chung -> EAgentTraffic Error Code](../../Common.html#eagent-traffic-error) — danh sách mã lỗi nghiệp vụ đại lý tra cứu giao thông.

---

## Data test cho developer

- clientId: TESTCLIENT
- apiKey: 07e73e61-0dce-4b39-8ecf-06ef70b35c08
- username (CCCD đại lý): 001201012345
- passcode test: 123456

Cần thay bằng dữ liệu môi trường thật khi tích hợp.
