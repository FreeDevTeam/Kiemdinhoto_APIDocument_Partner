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

| Field | Type | Required | Rule | Mô tả |
|---|---|---|---|---|
| (empty) | object | No | Body rỗng | API không yêu cầu tham số trong body |

---

## Sample Request

```bash
curl --location 'https://partner.ttdk.com.vn/PartnerAPI/PaymentQR/user/getPublicPaymentMethod' \
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

## Mã lỗi

| HTTP | Mã lỗi | Mô tả |
|---|---|---|
| 401 | UNAUTHORIZED | apiKey không hợp lệ hoặc không có quyền truy cập. |
| 429 | APIKEY_QUOTA_EXCEEDED | Vượt quota cho apiKey. |
| 500 | UNKNOWN_ERROR | Lỗi hệ thống nội bộ. |

---

## Tham khảo

- [Danh sách mã lỗi và quy ước response chung](../../Common.html)

---

## Data test cho developer

- Host: `https://partner.ttdk.com.vn`
- apiKey test: `demo_partner_api_key`
