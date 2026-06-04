# Partner API - Get List Station

Tài liệu API dành cho PartnerBooking.

[Về module API Partner](./index.html)

---

## Endpoint

|        |                                   |
| ------ | --------------------------------- |
| URL    | /PartnerAPI/Stations/user/getList |
| Method | POST                              |

---

## Headers schema

| Header                 | Required | Mô tả                         |
| ---------------------- | -------- | ----------------------------- |
| clientId hoặc clientid | Yes      | Mã định danh đối tác          |
| apiKey hoặc apikey     | Yes      | Khóa xác thực API của đối tác |

---

## Body schema

| Field      | Type   | Required | Rule        | Mô tả |
| ---------- | ------ | -------- | ----------- | ----- |
| filter | object | No | - | Bộ điều kiện lọc danh sách. |
| searchText | string | No | allow "", null | Từ khóa tìm kiếm. |
| skip | number | No | default 0, min 0 | Số bản ghi bỏ qua (phân trang). |
| limit | number | No | max 350 | Số bản ghi tối đa trả về (phân trang). |
| order | object | No | object(default key/value) | Cấu hình sắp xếp kết quả. |

---

## Sample Request

```bash
curl --location '{HOST_NAME}/PartnerAPI/Stations/user/getList' \
  --header 'Content-Type: application/json' \
  --header 'clientId: TESTCLIENT' \
  --header 'apiKey: 07e73e61-0dce-4b39-8ecf-06ef70b35c08' \
  --data '{}'
```

---

## Success response

```json
{
  "statusCode": 200,
  "error": null,
  "message": "Success",
  "data": {
    "data": [
      {
        "stationsId": 57,
        "stationCode": "29-03S",
        "stationsName": "Trung tâm đăng kiểm 29-03S",
        "stationsAddress": "Hà Nội",
        "stationStatus": 1,
        "enablePriorityMode": 1
      }
    ],
    "total": 1
  }
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
