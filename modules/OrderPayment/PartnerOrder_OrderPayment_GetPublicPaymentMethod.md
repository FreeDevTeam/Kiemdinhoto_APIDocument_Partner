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

API không yêu cầu body. Có thể gửi body rỗng `{}` hoặc không gửi body.

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
  "error": null,
  "message": "Success",
  "data": {
    "bank": {
      "paymentMethodId": 1,
      "paymentMethodName": "Techcombank",
      "paymentMethodType": 2,
      "paymentMethodIdentityNumber": "19038779892016",
      "paymentMethodOwnerName": "CONG TY TNHH ...",
      "paymentMethodImageUrl": "https://...",
      "paymentMethodEnable": 1,
      "paymentMethodNote": "VietQR",
      "stationsId": 57
    },
    "momo": null,
    "gtelPay": null,
    "zaloPay": null,
    "taMove": null,
    "vnPay": null,
    "shopeePay": null,
    "baoKim": null,
    "kimNgan": null,
    "vnpayAppInApp": null
  }
}
```

Ghi chú:
- Mỗi key trong `data` (`bank`, `momo`, `gtelPay`, ...) trả về **1 bản ghi PaymentMethod** hoặc `null`.
- Tùy cấu hình từng trạm, thường chỉ một số phương thức có dữ liệu, các phương thức còn lại là `null`.

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

- Host: `https://ttdk-develop-server.service.makefamousapp.com`
- apiKey test: `demo_partner_api_key`
