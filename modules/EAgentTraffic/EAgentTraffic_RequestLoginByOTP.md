# Partner API - Request Login By OTP (EAgentTraffic)

Tài liệu API yêu cầu đăng nhập đại lý tra cứu thông tin vi phạm giao thông bằng mã OTP. Hệ thống sẽ tự động đồng bộ tài khoản nội bộ và gửi mã OTP về số điện thoại đăng ký của đại lý qua cổng dịch vụ CSGT.

[Về module EAgentTraffic](./index.html)

---

## Endpoint

|        |                                                   |
| ------ | ------------------------------------------------- |
| URL    | /ThirdParty/EAgentTraffic/user/requestLoginByOTP  |
| Method | POST                                              |

---

## Headers schema

| Header                 | Required | Mô tả                         |
| ---------------------- | -------- | ----------------------------- |
| clientId hoặc clientid | Yes      | Mã định danh đối tác          |
| apiKey hoặc apikey     | Yes      | Khóa xác thực API của đối tác |

---

## Body schema

| Field                   | Type   | Required | Rule                        | Mô tả                                                      |
| ----------------------- | ------ | -------- | --------------------------- | ---------------------------------------------------------- |
| username                | string | Yes      | required, max 255, alphanum | Số CCCD / CMND của tài khoản đại lý tra cứu giao thông.    |
| userDevice              | object | No       | -                           | Thông tin thiết bị di động của đại lý / ứng dụng.          |
| userDevice.fingerprint  | string | No       | -                           | Chuỗi nhận dạng hệ điều hành / firmware thiết bị.          |
| userDevice.hardware     | string | No       | -                           | Mã phần cứng thiết bị (ví dụ: `mt6878`).                   |
| userDevice.brand        | string | No       | -                           | Hãng sản xuất thiết bị (ví dụ: `motorola`).                |
| userDevice.device       | string | No       | -                           | Tên thiết bị (ví dụ: `aito`).                              |
| userDevice.model        | string | No       | -                           | Tên model thiết bị (ví dụ: `XT2429-2`).                    |
| userDevice.manufacturer | string | No       | -                           | Nhà sản xuất thiết bị (ví dụ: `motorola`).                 |
| userDevice.product      | string | No       | -                           | Tên sản phẩm thương mại của thiết bị (ví dụ: `aito_g`).    |
| userDevice.bootloader   | string | No       | -                           | Thông tin bootloader (ví dụ: `unknown`).                   |
| userDevice.sdkVersion   | number | No       | -                           | Phiên bản Android SDK (ví dụ: `35`).                       |
| userDevice.gmsVersion   | string | No       | -                           | Phiên bản Google Mobile Services (ví dụ: `262033035`).     |
| userDevice.latitude     | number | No       | -                           | Tọa độ vĩ độ GPS của thiết bị (ví dụ: `12.2702919`).       |
| userDevice.longitude    | number | No       | -                           | Tọa độ kinh độ GPS của thiết bị (ví dụ: `109.2489062`).    |

---

## Sample Request

```bash
curl --location '{HOST_NAME}/ThirdParty/EAgentTraffic/user/requestLoginByOTP' \
  --header 'Content-Type: application/json' \
  --header 'clientId: TESTCLIENT' \
  --header 'apiKey: 07e73e61-0dce-4b39-8ecf-06ef70b35c08' \
  --data '{
    "username": "001201012345",
    "userDevice": {
      "fingerprint": "motorola/aito_g/aito:15/AP3A.240905.015.A2/1746894222:user/release-keys",
      "hardware": "mt6878",
      "brand": "motorola",
      "device": "aito",
      "model": "XT2429-2",
      "manufacturer": "motorola",
      "product": "aito_g",
      "bootloader": "unknown",
      "sdkVersion": 35,
      "gmsVersion": "262033035",
      "latitude": 12.2702919,
      "longitude": 109.2489062
    }
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

| HTTP | Mã lỗi                            | Mô tả                                                                    |
| ---- | --------------------------------- | ------------------------------------------------------------------------ |
| 400  | _Validation Error_                | Payload không đúng schema (thiếu `username`, sai kiểu dữ liệu).          |
| 429  | `QUOTA_EXCEEDED`                  | apiKey không hợp lệ hoặc đã vượt quá hạn mức gọi API.                    |
| 500  | `AGENTETRAFFIC_UNAUTHORIZED`      | Không có quyền truy cập hoặc đăng nhập đại lý thất bại.                  |
| 500  | `INVALID_USERNAME`                | Số CCCD / tài khoản đại lý không hợp lệ hoặc không tìm thấy.             |
| 500  | `AGENTETRAFFIC_OTP_REQUEST_ERROR` | Gặp lỗi trong quá trình gửi yêu cầu OTP tới cổng dịch vụ xác thực CSGT.  |
| 500  | `UNKNOWN_ERROR`                   | Lỗi không xác định.                                                      |

---

## Tham khảo

- [Quy chuẩn chung -> Common Error](../../Common.html#common-error) — danh sách mã lỗi hệ thống trả về trong trường `error`.
- [Quy chuẩn chung -> EAgentTraffic Error Code](../../Common.html#eagent-traffic-error) — danh sách mã lỗi nghiệp vụ đại lý tra cứu giao thông.

---

## Data test cho developer

- clientId: TESTCLIENT
- apiKey: 07e73e61-0dce-4b39-8ecf-06ef70b35c08
- username (CCCD đại lý): 001201012345

Cần thay bằng dữ liệu môi trường thật khi tích hợp.
