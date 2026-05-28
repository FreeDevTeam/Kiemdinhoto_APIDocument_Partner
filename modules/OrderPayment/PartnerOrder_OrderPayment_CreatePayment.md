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

| Field | Type | Required | Mô tả |
|---|---|---|---|
| customerScheduleId | number | Yes | ID lịch hẹn |
| paymentMethodType | number | Yes | Loại phương thức thanh toán |
| paymentMethodId | number | No | ID phương thức thanh toán |
| paymentMethodSubType | string | No | Sub-type thanh toán |
| stationServicesList | number[] | No | Danh sách dịch vụ trạm |
| stationsId | number | No | ID trạm |

---

## Sample Request

```bash
curl --location '{HOST_NAME}/PartnerAPI/CustomerSchedule/user/createPayment' \
  --header 'Content-Type: application/json' \
  --header 'apiKey: {PARTNER_API_KEY}' \
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