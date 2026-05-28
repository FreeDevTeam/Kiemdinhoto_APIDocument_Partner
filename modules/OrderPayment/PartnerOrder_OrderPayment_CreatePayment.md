# Partner API - Order Payment - Create Payment

Tạo thông tin thanh toán cho lịch hẹn/đơn hàng ở trang thanh toán.

[Về module Order Payment](./index.html)

---

## Endpoint

| | |
|---|---|
| URL | /PartnerAPI/CustomerSchedule/user/createPayment |
| Method | POST |

---

## Headers schema

| Header | Required | Mô tả |
|---|---|---|
| apiKey hoặc apikey | Yes | Khóa xác thực API của đối tác |

---

## Body schema

| Field | Type | Required | Rule | Mô tả |
|---|---|---|---|---|
| customerScheduleId | number | Yes | > 0 | ID lịch hẹn |
| paymentMethodType | number | Yes | Giá trị trong danh sách payment type | Loại phương thức thanh toán |
| paymentMethodId | number | No | > 0 nếu truyền | ID phương thức thanh toán |
| paymentMethodSubType | string | No | Chuỗi định danh subtype | Sub-type thanh toán |
| stationServicesList | number[] | No | Mỗi phần tử > 0 | Danh sách dịch vụ trạm |
| stationsId | number | No | > 0 nếu truyền | ID trạm |

---

## Sample Request

```bash
curl --location 'https://partner.ttdk.com.vn/PartnerAPI/CustomerSchedule/user/createPayment' \
  --header 'Content-Type: application/json' \
  --header 'apiKey: demo_partner_api_key' \
  --data '{
    "customerScheduleId": 1869,
    "paymentMethodType": 2,
    "paymentMethodId": 1,
    "stationServicesList": [101]
  }'
```

---

## Success response

```json
{
  "statusCode": 200,
  "data": {
    "orderId": 99999,
    "paymentQR": {
      "paymentContent": "TTDH 99999"
    }
  }
}
```

---

## Mã lỗi

| HTTP | Mã lỗi | Mô tả |
|---|---|---|
| 400 | INVALID_REQUEST | Dữ liệu đầu vào không hợp lệ. |
| 401 | UNAUTHORIZED | apiKey không hợp lệ hoặc không có quyền truy cập. |
| 500 | UNKNOWN_ERROR | Lỗi hệ thống nội bộ. |

---

## Tham khảo

- [Danh sách mã lỗi và quy ước response chung](../../Common.html)

---

## Data test cho developer

- Host: `https://partner.ttdk.com.vn`
- apiKey test: `demo_partner_api_key`
- customerScheduleId: `1869`
