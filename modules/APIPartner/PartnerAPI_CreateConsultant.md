# Partner API - Create Consultant

Tài liệu API dành cho PartnerBooking.

[Về module API Partner](./index.html)

---

## Endpoint

|        |                                                        |
| ------ | ------------------------------------------------------ |
| URL    | /PartnerAPI/CustomerSchedule/user/userCreateConsultant |
| Method | POST                                                   |

---

## Headers schema

| Header                 | Required | Mô tả                         |
| ---------------------- | -------- | ----------------------------- |
| clientId hoặc clientid | Yes      | Mã định danh đối tác          |
| apiKey hoặc apikey     | Yes      | Khóa xác thực API của đối tác |

---

## Body schema

| Field               | Type          | Required | Rule        | Mô tả |
| ------------------- | ------------- | -------- | ----------- | ----- |
| phone               | string        | Yes      | required    | -     |
| fullnameSchedule    | string        | No       | default -   | -     |
| licensePlates       | string        | Yes      | max 15      | -     |
| licensePlateColor   | number        | Yes      | required    | -     |
| vehicleType         | number        | No       | default CAR | -     |
| stationsId          | number        | No       | -           | -     |
| dateSchedule        | string        | No       | -           | -     |
| time                | string        | No       | -           | -     |
| stationServicesList | array<number> | No       | -           | -     |

---

## Sample Request

```bash
curl --location '{HOST_NAME}/PartnerAPI/CustomerSchedule/user/userCreateConsultant' \
  --header 'Content-Type: application/json' \
  --header 'clientId: TESTCLIENT' \
  --header 'apiKey: 07e73e61-0dce-4b39-8ecf-06ef70b35c08' \
  --data '{
  "phone": "TEST_VALUE",
  "licensePlates": "TEST_VALUE",
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
  "data": [1870]
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
