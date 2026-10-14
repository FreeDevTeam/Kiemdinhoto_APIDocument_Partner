# Partner API - Request Login By OTP (EAgentTraffic)

Tài liệu API yêu cầu đăng nhập đối tác tra cứu thông tin vi phạm giao thông bằng mã OTP. Hệ thống sẽ tự động đồng bộ tài khoản nội bộ và gửi mã OTP về số điện thoại đăng ký của đối tác qua cổng dịch vụ CSGT.

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

| Field                   | Type   | Required | Rule                        | Mô tả                                                                    |
| ----------------------- | ------ | -------- | --------------------------- | ------------------------------------------------------------------------ |
| username                | string | Yes      | required, max 255, alphanum | **Dữ liệu thật** — Số CCCD / CMND thật của tài khoản đối tác tra cứu thông tin giao thông. |
| userDevice              | object | No       | -                           | Thông tin thiết bị di động của đối tác / ứng dụng.                        |
| userDevice.fingerprint  | string | No       | -                           | Chuỗi nhận dạng hệ điều hành / firmware thiết bị.                        |
| userDevice.hardware     | string | No       | -                           | Mã phần cứng thiết bị (ví dụ: `mt6878`).                                 |
| userDevice.brand        | string | No       | -                           | Hãng sản xuất thiết bị (ví dụ: `motorola`).                              |
| userDevice.device       | string | No       | -                           | Tên thiết bị (ví dụ: `aito`).                                            |
| userDevice.model        | string | No       | -                           | Tên model thiết bị (ví dụ: `XT2429-2`).                                  |
| userDevice.manufacturer | string | No       | -                           | Nhà sản xuất thiết bị (ví dụ: `motorola`).                               |
| userDevice.product      | string | No       | -                           | Tên sản phẩm thương mại của thiết bị (ví dụ: `aito_g`).                  |
| userDevice.bootloader   | string | No       | -                           | Thông tin bootloader (ví dụ: `unknown`).                                 |
| userDevice.sdkVersion   | number | No       | -                           | Phiên bản Android SDK (ví dụ: `35`).                                     |
| userDevice.gmsVersion   | string | No       | -                           | Phiên bản Google Mobile Services (ví dụ: `262033035`).                   |
| userDevice.latitude     | number | No       | -                           | Tọa độ vĩ độ GPS của thiết bị (ví dụ: `12.2702919`).                     |
| userDevice.longitude    | number | No       | -                           | Tọa độ kinh độ GPS của thiết bị (ví dụ: `109.2489062`).                  |

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
| 500  | `AGENTETRAFFIC_UNAUTHORIZED`      | Không có quyền truy cập hoặc đăng nhập đối tác thất bại.                  |
| 500  | `INVALID_USERNAME`                | Số CCCD / tài khoản đối tác không hợp lệ hoặc không tìm thấy.             |
| 500  | `AGENTETRAFFIC_OTP_REQUEST_ERROR` | Gặp lỗi trong quá trình gửi yêu cầu OTP tới cổng dịch vụ xác thực CSGT.  |
| 500  | `AGENT_QUOTA_EXCEEDED`            | Đã vượt quá hạn mức (quota) tra cứu của đối tác.                         |
| 500  | `UNKNOWN_ERROR`                   | Lỗi không xác định.                                                      |

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

| Username / CCCD | Kịch bản | Kết quả giả lập |
| :--- | :--- | :--- |
| `001200000001` | Gửi OTP thành công | Thành công – trả về token giả lập và thông báo mã OTP đã được gửi. |
| `999000000001` | Tên đăng nhập không hợp lệ | Thất bại – `INVALID_USERNAME`. |
| `999000000002` | Không được xác thực | Thất bại – `AGENTETRAFFIC_UNAUTHORIZED`. |
| `999000000003` | Lỗi gửi yêu cầu OTP | Thất bại – `AGENTETRAFFIC_OTP_REQUEST_ERROR`. |
| `999000000004` | Vượt hạn mức tra cứu | Thất bại – `AGENT_QUOTA_EXCEEDED`. |

> **Lưu ý phân biệt môi trường:**
> - **Môi trường Test / Sandbox (Mock):** Dùng các số CCCD giả lập trên để kiểm thử đầy đủ các kịch bản thành công và lỗi.
> - **Môi trường Thật (Production):** Bắt buộc sử dụng số CCCD thật của tài khoản đối tác để hệ thống gửi mã OTP thật về số điện thoại đăng ký qua cổng dịch vụ CSGT.


