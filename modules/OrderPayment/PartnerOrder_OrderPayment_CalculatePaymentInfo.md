# Partner API - Order Payment - Calculate Payment Info

Tính thông tin thanh toán (tổng tiền, giảm giá...) cho trang thanh toán.

[Về module Order Payment](./index.html)

---

## Endpoint

| | |
|---|---|
| URL | /PartnerAPI/Order/user/calculatePaymentInfo |
| Method | POST |

---

## Headers schema

| Header | Required | Mô tả |
|---|---|---|
| apiKey hoặc apikey | Yes | Khóa xác thực API của đối tác |

---

## Body schema

Theo `orderPayloadSchema`:

| Field | Type | Required | Mô tả |
|---|---|---|---|
| orderId | number | No | ID đơn hàng |
| licensePlatesList | string[] | No | Danh sách biển số |
| productIds | number[] hoặc object[] | No | Danh sách sản phẩm hoặc `{ productId, quantity }` |
| promotionCode | string | No | Mã giảm giá |

---

## Sample Request

```bash
curl --location '{HOST_NAME}/PartnerAPI/Order/user/calculatePaymentInfo' \
  --header 'Content-Type: application/json' \
  --header 'apiKey: {PARTNER_API_KEY}' \
  --data '{
    "orderId": 12345,
    "promotionCode": "SALE10"
  }'
```

---

## Success response (rút gọn)

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