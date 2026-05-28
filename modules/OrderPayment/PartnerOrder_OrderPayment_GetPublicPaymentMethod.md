# Partner API - Order Payment - Get Public Payment Method

Lấy danh sách phương thức thanh toán công khai cho trang thanh toán.

[Về module Order Payment](./index.html)

---

## Endpoint

| | |
|---|---|
| URL | /PartnerAPI/PaymentQR/user/getPublicPaymentMethod |
| Method | POST |

---

## Headers schema

| Header | Required | Mô tả |
|---|---|---|
| apiKey hoặc apikey | Yes | Khóa xác thực API của đối tác |

---

## Body schema

```json
{}
```

---

## Sample Request

```bash
curl --location '{HOST_NAME}/PartnerAPI/PaymentQR/user/getPublicPaymentMethod' \
  --header 'Content-Type: application/json' \
  --header 'apiKey: {PARTNER_API_KEY}' \
  --data '{}'
```

---

## Success response (rút gọn)

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