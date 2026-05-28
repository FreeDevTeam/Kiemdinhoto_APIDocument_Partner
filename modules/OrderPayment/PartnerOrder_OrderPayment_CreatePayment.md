# Partner API - Order Payment - Create Payment

T?o thông tin thanh toán cho l?ch h?n/don hàng ? trang thanh toán.

[V? module Order Payment](./index.html)

---

## Endpoint

| | |
|---|---|
| URL | /PartnerAPI/CustomerSchedule/user/createPayment |
| Method | POST |

---

## Headers schema

| Header | Required | Mô t? |
|---|---|---|
| apiKey ho?c apikey | Yes | Khóa xác th?c API c?a d?i tác |

---

## Body schema

| Field | Type | Required | Rule | Mô t? |
|---|---|---|---|---|
| customerScheduleId | number | Yes | > 0 | ID l?ch h?n |
| paymentMethodType | number | Yes | Giá tr? trong danh sách payment type | Lo?i phuong th?c thanh toán |
| paymentMethodId | number | No | > 0 n?u truy?n | ID phuong th?c thanh toán |
| paymentMethodSubType | string | No | Chu?i d?nh danh subtype | Sub-type thanh toán |
| stationServicesList | number[] | No | M?i ph?n t? > 0 | Danh sách d?ch v? tr?m |
| stationsId | number | No | > 0 n?u truy?n | ID tr?m |

---

## Sample Request

```bash
curl --location 'https://ttdk-develop-server.service.makefamousapp.com/PartnerAPI/CustomerSchedule/user/createPayment' \
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

## Mã l?i

| HTTP | Mã l?i | Mô t? |
|---|---|---|
| 400 | INVALID_REQUEST | D? li?u d?u vào không h?p l?. |
| 401 | UNAUTHORIZED | apiKey không h?p l? ho?c không có quy?n truy c?p. |
| 500 | UNKNOWN_ERROR | L?i h? th?ng n?i b?. |

---

## Tham kh?o

- [Danh sách mã l?i và quy u?c response chung](../../Common.html)

---

## Data test cho developer

- Host: `https://ttdk-develop-server.service.makefamousapp.com`
- apiKey test: `demo_partner_api_key`
- customerScheduleId: `1869`
