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

| Field | Type | Required | Rule | Mô tả |
|---|---|---|---|---|
| orderId | number | No | > 0 nếu truyền | ID đơn hàng |
| licensePlatesList | string[] | No | Mảng biển số hợp lệ | Danh sách biển số |
| productIds | number[] \| object[] | No | object[] theo dạng `{ productId, quantity }` | Danh sách sản phẩm |
| promotionCode | string | No | Mã khuyến mãi hợp lệ | Mã giảm giá |

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
  "error": null,
  "message": "Success",
  "data": {
    "subTotalAmount": 100000,
    "payment": 100000,
    "taxAmount": 8000,
    "discountAmount": 10000,
    "totalPayment": 98000,
    "totalAmount": 98000,
    "paidAmount": 0,
    "unpaidAmount": 98000,
    "refundAmount": 0,
    "debtStatus": 0,
    "promotionData": null,
    "salesChannel": "PARTNER"
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

- Host: `https://ttdk-develop-server.service.makefamousapp.com`
- apiKey test: `demo_partner_api_key`
- orderId: `12345`
