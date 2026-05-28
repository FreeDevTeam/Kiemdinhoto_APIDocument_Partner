# Partner API - Order Payment - Get Public Payment Method

L?y danh sách phuong th?c thanh toán công khai cho trang thanh toán.

[V? module Order Payment](./index.html)

---

## Endpoint

| | |
|---|---|
| URL | /PartnerAPI/PaymentQR/user/getPublicPaymentMethod |
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
| (empty) | object | No | Body r?ng | API không yêu c?u tham s? trong body |

---

## Sample Request

```bash
curl --location 'https://ttdk-develop-server.service.makefamousapp.com/PartnerAPI/PaymentQR/user/getPublicPaymentMethod' \
  --header 'Content-Type: application/json' \
  --header 'apiKey: demo_partner_api_key' \
  --data '{}'
```

---

## Success response

```json
{
  "statusCode": 200,
  "data": [
    {
      "paymentMethodId": 1,
      "paymentMethodType": 2,
      "paymentMethodName": "VNPay",
      "paymentMethodEnable": 1
    }
  ]
}
```

---

## Mã l?i

| HTTP | Mã l?i | Mô t? |
|---|---|---|
| 401 | UNAUTHORIZED | apiKey không h?p l? ho?c không có quy?n truy c?p. |
| 429 | APIKEY_QUOTA_EXCEEDED | Vu?t quota cho apiKey. |
| 500 | UNKNOWN_ERROR | L?i h? th?ng n?i b?. |

---

## Tham kh?o

- [Danh sách mã l?i và quy u?c response chung](../../Common.html)

---

## Data test cho developer

- Host: `https://ttdk-develop-server.service.makefamousapp.com`
- apiKey test: `demo_partner_api_key`
