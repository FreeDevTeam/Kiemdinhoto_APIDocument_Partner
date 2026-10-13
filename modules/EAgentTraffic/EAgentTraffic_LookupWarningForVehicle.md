# Partner API - Lookup Warning For Vehicle (EAgentTraffic)

Tài liệu API tra cứu thông tin cảnh báo vi phạm giao thông / phạt nguội của phương tiện cơ giới thông qua tài khoản đại lý. Hệ thống tự động theo dõi hạn mức (quota) theo chu kỳ ngày/tuần/tháng, tích hợp cơ chế tự động chuyển đổi sang tài khoản đại lý dự phòng khi đại lý hiện tại hết quota và chuẩn hóa kết quả đầu ra theo chuẩn `CustomerCriminalRecord`.

[Về module EAgentTraffic](./index.html)

---

## Endpoint

|        |                                                         |
| ------ | ------------------------------------------------------- |
| URL    | /ThirdParty/EAgentTraffic/user/lookupWarningForVehicle  |
| Method | POST                                                    |

---

## Headers schema

| Header        | Required | Mô tả                                                                                                        |
| ------------- | -------- | ------------------------------------------------------------------------------------------------------------ |
| Authorization | Yes      | Chuỗi xác thực dạng `Bearer <JWT_TOKEN>`. Token nhận được sau khi đăng nhập thành công qua OTP hoặc Passcode. |

---

## Body schema

| Field       | Type           | Required | Rule                                          | Mô tả                                                                                      |
| ----------- | -------------- | -------- | --------------------------------------------- | ------------------------------------------------------------------------------------------ |
| plateNumber | string         | Yes      | required, max 20                              | Biển số xe cần tra cứu phạt nguội (ví dụ: `30L-408.53`, `51A-123.45`).                     |
| phoneNumber | string         | Yes      | required, max 20                              | Số điện thoại khách hàng thực hiện tra cứu.                                                |
| vehicleType | number\|string | Yes      | required, valid: `1`, `10`, `20`, `30`, `40`  | Phân loại loại phương tiện theo [Enum Loại phương tiện](#1-enum-loai-phuong-tien-vehicletype). |

---

## Danh sách Enum & Giá trị tham chiếu (Input / Output)

### 1. Enum Loại phương tiện (`vehicleType`)

| Giá trị | Tên loại phương tiện          | Mô tả                            |
| ------- | ----------------------------- | -------------------------------- |
| `1`     | Ô tô con (CAR)                | Xe ô tô du lịch, xe con          |
| `10`    | Khác (OTHER)                  | Xe bán tải, ô tô tải, khách      |
| `20`    | Rơ moóc (RO_MOOC)             | Rơ moóc và sơ mi rơ moóc         |
| `30`    | Xe máy (MOTOBIKE)             | Xe mô tô, xe gắn máy             |
| `40`    | Xe điện (ELECTRIC_MOTORBIKE)  | Xe máy điện                      |

### 2. Enum Màu biển số (`customerRecordPlateColor`)

| Giá trị | Màu sắc | Mô tả                              |
| ------- | ------- | ---------------------------------- |
| `1`     | Trắng   | Biển trắng chữ đen (xe cá nhân/DN) |
| `2`     | Xanh    | Biển xanh chữ trắng (cơ quan NN)   |
| `3`     | Vàng    | Biển vàng chữ đen (xe kinh doanh)  |
| `4`     | Đỏ      | Biển đỏ chữ trắng (quân đội)       |

---

## Cấu trúc dữ liệu kết quả (`data`)

Mỗi phần tử trong danh sách kết quả `data` chứa các trường chi tiết sau:

| Trường                        | Kiểu dữ liệu | Mô tả                                                                                      |
| ----------------------------- | ------------ | ------------------------------------------------------------------------------------------ |
| `customerRecordPlatenumber`   | string       | Biển số xe vi phạm.                                                                        |
| `customerRecordPlateColor`    | number       | Mã màu biển số chuẩn hóa (1: Trắng, 2: Xanh, 3: Vàng, 4: Đỏ).                              |
| `customerRecordPlateColorDesc`| string       | Mô tả hiển thị màu biển số (ví dụ: `Nền màu trắng, chữ và số màu đen`).                    |
| `crimeRecordContent`          | string       | Hành vi vi phạm giao thông ghi nhận được.                                                  |
| `crimeRecordTime`             | string       | Thời gian phát hiện vi phạm (ví dụ: `19:38 24/07/2026`).                                   |
| `crimeRecordLocation`         | string       | Địa điểm xảy ra hành vi vi phạm.                                                           |
| `crimeRecordAddressAgency`    | string       | Địa chỉ cơ quan/đơn vị tiếp nhận và xử lý vụ việc.                                         |
| `crimeRecordPIC`              | string       | Đơn vị phát hiện hành vi vi phạm (ví dụ: Đội CSGT đường bộ cao tốc số 3).                   |
| `crimeRecordStatus`           | string       | Trạng thái giải quyết vụ việc (ví dụ: `Chưa xử phạt`, `Đã xử phạt`).                       |
| `crimeRecordAgency`           | string       | Đơn vị công an phụ trách xử phạt.                                                          |
| `crimeRecordContact`          | string       | Số điện thoại liên hệ của cơ quan xử lý vi phạm.                                           |
| `criminalRecordNote`          | string       | Ghi chú hướng dẫn hoặc danh sách địa điểm xử lý.                                           |
| `vehicleTypeText`             | string       | Mô tả phân loại phương tiện (ví dụ: `Ô tô con`).                                           |

---

## Sample Request

```bash
curl --location '{HOST_NAME}/ThirdParty/EAgentTraffic/user/lookupWarningForVehicle' \
  --header 'Content-Type: application/json' \
  --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...' \
  --data '{
    "plateNumber": "30L-408.53",
    "phoneNumber": "0987654321",
    "vehicleType": 1
  }'
```

---

## Success response

```json
{
  "statusCode": 200,
  "error": null,
  "message": "Success",
  "data": [
    {
      "customerRecordPlatenumber": "30L-408.53",
      "customerRecordPlateColor": 1,
      "customerRecordPlateColorDesc": "Nền màu trắng, chữ và số màu đen",
      "crimeRecordContent": "16824.6.5.đ.01 Điều khiển xe chạy quá tốc độ quy định từ 10 km/h đến 20 km/h",
      "crimeRecordTime": "19:38 24/07/2026",
      "crimeRecordLocation": "Km278+400, cao tốc Pháp Vân - Cao Bồ - Mai Sơn - QL45 - Nghi Sơn",
      "crimeRecordAddressAgency": "Số 20 Phố Trần Bình, Phường Từ Liêm,Thành phố Hà Nội",
      "crimeRecordPIC": "Đội Cảnh sát giao thông đường bộ cao tốc số 3 - Phòng Hướng dẫn Tuần tra kiểm soát giao thông đường bộ đường sắt - Cục Cảnh sát giao thông",
      "crimeRecordStatus": "Đã xử phạt",
      "crimeRecordAgency": "Đội Cảnh sát giao thông đường bộ cao tốc số 3 - Cục Cảnh sát giao thông",
      "crimeRecordContact": "0243.xxx.xxx",
      "criminalRecordNote": "1. Đội Cảnh sát giao thông đường bộ cao tốc số 3 - Cục CSGT<br>Địa chỉ: Thôn Hoàng Nê, Xã Ý Yên, Ninh Bình<br><br>2. Đội CSGT ĐB số 6 - CATP Hà Nội<br>Địa chỉ: Số 20 Phố Trần Bình, Phường Từ Liêm,Thành phố Hà Nội<br>",
      "vehicleTypeText": "Ô tô con"
    }
  ]
}
```

---

## Mã lỗi

| HTTP | Mã lỗi                       | Mô tả                                                                                                        |
| ---- | ---------------------------- | ------------------------------------------------------------------------------------------------------------ |
| 400  | _Validation Error_           | Payload không đúng schema (thiếu `plateNumber`, `phoneNumber` hoặc `vehicleType` không hợp lệ).              |
| 401  | `UNAUTHORIZED`               | Token JWT không hợp lệ hoặc đã hết hạn phiên làm việc.                                                       |
| 500  | `VEHICLE_WARNING_NOT_FOUND`  | Không tìm thấy cảnh báo vi phạm của phương tiện hoặc cổng dữ liệu CSGT không phản hồi.                       |
| 500  | `AGENT_QUOTA_EXCEEDED`       | Hạn mức (quota) tra cứu của tất cả tài khoản đại lý đã vượt quá giới hạn trong ngày.                         |
| 500  | `INVALID_USERNAME`           | Thông tin tài khoản đại lý gắn với phiên làm việc không hợp lệ.                                              |
| 500  | `UNKNOWN_ERROR`              | Lỗi không xác định.                                                                                          |

---

## Tham khảo

- [Quy chuẩn chung -> Common Error](../../Common.html#common-error) — danh sách mã lỗi hệ thống trả về trong trường `error`.
- [Quy chuẩn chung -> EAgentTraffic Error Code](../../Common.html#eagent-traffic-error) — danh sách mã lỗi nghiệp vụ đại lý tra cứu giao thông.

---

## Data test cho developer

- Header Authorization: `Bearer <JWT_TOKEN>` (Lấy từ kết quả của API `requestLoginByOTP` hoặc `confirmPasscode`)
- plateNumber: `30L-408.53`
- phoneNumber: `0987654321`
- vehicleType: `1`

Cần thay bằng dữ liệu môi trường thật khi tích hợp.
