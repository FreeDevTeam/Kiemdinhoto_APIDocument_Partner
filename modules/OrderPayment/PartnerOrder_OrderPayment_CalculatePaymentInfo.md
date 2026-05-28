# Partner API - Order Payment - Calculate Payment Info

Tính thông tin thanh toán (t?ng ti?n, gi?m giá...) cho trang thanh toán.

[V? module Order Payment](./index.html)

---

## Endpoint

| | |
|---|---|
| URL | /PartnerAPI/Order/user/calculatePaymentInfo |
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
| orderId | number | No | > 0 n?u truy?n | ID don hàng |
| licensePlatesList | string[] | No | M?ng bi?n s? h?p l? | Danh sách bi?n s? |
| productIds | number[] \| object[] | No | object[] theo d?ng `{ productId, quantity }` | Danh sách s?n ph?m |
| promotionCode | string | No | Mã khuy?n mãi h?p l? | Mã gi?m giá |

---

## Sample Request

```bash
curl --location 'https://ttdk-develop-server.service.makefamousapp.com/PartnerAPI/Order/user/calculatePaymentInfo' \
  --header 'Content-Type: application/json' \
  --header 'apiKey: demo_partner_api_key' \
  --data '{
    "orderId": 12345,
    "promotionCode": "SALE10"
  }'
```

---

## Success response

```json
{
  "statusCode": 200,
  "data": {
    "totalAmount": 120000,
    "discountAmount": 10000,
    "finalAmount": 110000
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
- orderId: `12345`