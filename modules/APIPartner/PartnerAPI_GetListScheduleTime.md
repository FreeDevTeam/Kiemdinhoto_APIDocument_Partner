# Partner API - Get List Schedule Time

Tài liệu API dành cho PartnerBooking.

[Về module API Partner](./index.html)

---

## Endpoint

|        |                                               |
| ------ | --------------------------------------------- |
| URL    | /PartnerAPI/Stations/user/getListScheduleTime |
| Method | POST                                          |

---

## Headers schema

| Header                 | Required | Mô tả                         |
| ---------------------- | -------- | ----------------------------- |
| clientId hoặc clientid | Yes      | Mã định danh đối tác          |
| apiKey hoặc apikey     | Yes      | Khóa xác thực API của đối tác |

---

## Body schema

| Field       | Type   | Required | Rule     | Mô tả |
| ----------- | ------ | -------- | -------- | ----- |
| stationsId  | number | Yes      | required | -     |
| date        | string | Yes      | required | -     |
| vehicleType | number | Yes      | required | -     |

---

## Sample Request

```bash
curl --location '{HOST_NAME}/PartnerAPI/Stations/user/getListScheduleTime' \
  --header 'Content-Type: application/json' \
  --header 'clientId: TESTCLIENT' \
  --header 'apiKey: 07e73e61-0dce-4b39-8ecf-06ef70b35c08' \
  --data '{
  "stationsId": 1,
  "date": "TEST_VALUE",
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
      "scheduleTime": "08:00 - 08:30",
      "scheduleTimeStatus": 1,
      "totalSchedule": 10,
      "totalBookingSchedule": 3
    }
  ]
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
