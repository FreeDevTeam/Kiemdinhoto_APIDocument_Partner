# Partner API - Update Vehicle Info

Tài liệu API cập nhật thông tin phương tiện.

[Về module API Partner](./index.html)

---

## Endpoint

|        |                                                   |
| ------ | ------------------------------------------------- |
| URL    | /PartnerAPI/AppUserVehicle/user/updateVehicleInfo |
| Method | POST                                              |

---

## Headers schema

| Header                 | Required | Mô tả                                                        |
| ---------------------- | -------- | ------------------------------------------------------------ |
| clientId hoặc clientid | Yes*     | Mã định danh đối tác (bắt buộc khi dùng API Key)            |
| apiKey hoặc apikey     | Yes*     | Khóa xác thực API của đối tác (bắt buộc khi dùng API Key)   |
| authorization          | Optional | Bearer Token người dùng (nếu xác thực qua User Access Token) |

---

## Body schema

| Field           | Type   | Required | Rule         | Mô tả                                      |
| --------------- | ------ | -------- | ------------ | ------------------------------------------ |
| vehicleIdentity | string | Yes      | max 15 ký tự | Biển số xe cần cập nhật (ví dụ: 30A12345). |
| chassisNumber   | string | No       | string       | Số khung xe (chassis number).              |

---

## Sample Request

```bash
curl --location '{HOST_NAME}/PartnerAPI/AppUserVehicle/user/updateVehicleInfo' \
  --header 'Content-Type: application/json' \
  --header 'clientId: TESTCLIENT' \
  --header 'apiKey: 07e73e61-0dce-4b39-8ecf-06ef70b35c08' \
  --data '{
  "vehicleIdentity": "30A12345",
  "chassisNumber": "RL4AB1234EF567890"
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
    "vehicleIdentity": "30A12345",
    "vehiclePlateColor": 1,
    "vehicleType": 1,
    "certificateSeries": null,
    "violationCount": 0,
    "refreshDate": "2026-08-18T04:40:00.000Z",
    "vehicleExpiryDate": "31/12/2026",
    "vehicleRegistrationCode": "123456789",
    "vehicleBrandName": "TOYOTA",
    "vehicleBrandModel": "VIOS",
    "vehicleWeight": 1110,
    "vehicleTotalWeight": 1550,
    "vehicleSeatsLimit": 5,
    "vehicleFootholdLimit": 0,
    "vehicleBerthLimit": 0,
    "equipDashCam": 0,
    "vehicleGoodsWeight": 0,
    "vehicleCycle": 12,
    "vehicleForBusiness": 0,
    "vehicleCriminal": 0,
    "engineNumber": "2NR123456",
    "chassisNumber": "RL4AB1234EF567890",
    "manufacturedYear": 2022,
    "manufacturedCountry": "Việt Nam",
    "lifeTimeLimit": null,
    "wheelFormula": "4x2",
    "wheelTreat": "1460/1475",
    "overallDimension": "4425 x 1730 x 1475",
    "truckDimension": null,
    "wheelBase": "2550",
    "vehicleFuelType": "Xăng",
    "engineDisplacement": 1496,
    "maxCapacity": "79/6000",
    "revolutionsPerMinute": 6000,
    "vehicleTotalMass": 1550,
    "vehicleTires": "185/60R15"
  }
}
```

---

## Mã lỗi

| HTTP | Mã lỗi             | Mô tả                                                 |
| ---- | ------------------ | ----------------------------------------------------- |
| 400  | _Validation Error_ | Payload không đúng schema hoặc thiếu trường bắt buộc. |
| 400  | `UPDATE_FAILED`    | Cập nhật thông tin xe thất bại.                       |
| 429  | `QUOTA_EXCEEDED`   | apiKey không hợp lệ hoặc vượt quota giới hạn.         |
| 500  | `UNKNOWN_ERROR`    | Lỗi hệ thống không xác định.                          |

---

## Tham khảo

- [Quy chuẩn chung -> Common Error](../../Common.html#common-error)

---

## Data test cho developer

- clientId: TESTCLIENT
- apiKey: 07e73e61-0dce-4b39-8ecf-06ef70b35c08

Cần thay bằng dữ liệu môi trường thật khi tích hợp.
