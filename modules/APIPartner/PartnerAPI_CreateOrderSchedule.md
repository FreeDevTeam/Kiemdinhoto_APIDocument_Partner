# Partner API - Create Order Schedule

Tài liệu API dành cho PartnerBooking.

[Về module API Partner](./index.html)

---

## Endpoint

|        |                                            |
| ------ | ------------------------------------------ |
| URL    | /PartnerAPI/Order/user/createOrderSchedule |
| Method | POST                                       |

---

## Headers schema

| Header                 | Required | Mô tả                         |
| ---------------------- | -------- | ----------------------------- |
| clientId hoặc clientid | Yes      | Mã định danh đối tác          |
| apiKey hoặc apikey     | Yes      | Khóa xác thực API của đối tác |

---

## Body schema

| Field               | Type          | Required | Rule      | Mô tả |
| ------------------- | ------------- | -------- | --------- | ----- |
| licensePlates | string | Yes | max 15 | Biển số xe cần tạo lịch. |
| phone | string | Yes | required | Số điện thoại khách hàng. |
| fullnameSchedule | string | No | default - | Họ tên người đặt lịch. |
| vehicleType | number | Yes | required, default CAR | Loại phương tiện theo enum hệ thống. |
| licensePlateColor | number | Yes | required | Màu biển số theo enum hệ thống. |
| stationsId | number | No | - | ID trạm đăng kiểm. |
| dateSchedule | string | No | - | Ngày hẹn dự kiến (dd/MM/yyyy). |
| time | string | No | - | Khung giờ hẹn. |
| stationServicesList | array<number> | No | - | Danh sách ID dịch vụ trạm đã chọn. |
| isImmediate | number | No | valid 0|1 | 1: tạo lịch ngay cùng đơn, 0: chỉ tạo đơn trước. |
| attachmentList | array<object> | No | - | Danh sách tệp đính kèm hồ sơ. |

---

## Sample Request

```bash
curl --location '{HOST_NAME}/PartnerAPI/Order/user/createOrderSchedule' \
  --header 'Content-Type: application/json' \
  --header 'clientId: TESTCLIENT' \
  --header 'apiKey: 07e73e61-0dce-4b39-8ecf-06ef70b35c08' \
  --data '{
  "licensePlates": "TEST_VALUE",
  "phone": "TEST_VALUE",
  "vehicleType": 1,
  "licensePlateColor": 1
}'
```

---

## Success response

```json
{
  "statusCode": 200,
  "error": null,
  "message": "Success",
  "data": [99999]
}
```

---

## Mã lỗi

| HTTP | Mã lỗi             | Mô tả                                |
| ---- | ------------------ | ------------------------------------ |
| 400  | _Validation Error_ | Payload không đúng schema.           |
| 429  | `QUOTA_EXCEEDED`   | apiKey không hợp lệ hoặc vượt quota. |
| 500  | `UNKNOWN_ERROR`    | Lỗi không xác định.                  |

---

## Tham khảo

- [Quy chuẩn chung -> Common Error](../../Common.html#common-error)

---

## Data test cho developer

- clientId: TESTCLIENT
- apiKey: 07e73e61-0dce-4b39-8ecf-06ef70b35c08

Cần thay bằng dữ liệu môi trường thật khi tích hợp.
