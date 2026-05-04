# Partner API - Order Payment Confirm Batch

API xác nhận thanh toán hàng loạt đơn hàng của đối tác. Hỗ trợ tối đa 100 đơn hàng trong một yêu cầu.

[Về module Order](./index.html)

---

## Endpoint

| | |
|---|---|
| URL | /PartnerAPI/Order/paymentConfirmBatch |
| Method | POST |

---

## Headers schema

| Header | Required | Mô tả |
|---|---|---|
| clientId hoặc clientid | Yes | Mã định danh đối tác |
| apiKey hoặc apikey | Yes | Khóa xác thực API của đối tác |

---

## Body schema

| Field | Type | Required | Rule | Mô tả |
|---|---|---|---|---|
| items | array | Yes | min 1, max 100 | Danh sách đơn hàng cần xác nhận thanh toán |
| items[].requestId | string | Yes | bắt buộc | Mã định danh duy nhất cho yêu cầu (idempotency key) |
| items[].orderId | string | Yes | bắt buộc | Mã đơn hàng cần xác nhận |
| items[].amount | integer | Yes | >= 1 | Số tiền thanh toán (đơn vị: VNĐ) |
| items[].paymentStatus | string | Yes | bắt buộc | Trạng thái thanh toán. Xem danh sách hợp lệ tại [Quy chuẩn chung → Order Payment Status](../../Common.html#payment-status). |

---

## Sample Request

```bash
curl --location '{HOST_NAME}/PartnerAPI/Order/paymentConfirmBatch' \
  --header 'Content-Type: application/json' \
  --header 'clientId: TESTCLIENT' \
  --header 'apiKey: 07e73e61-0dce-4b39-8ecf-06ef70b35c08' \
  --data '{
    "items": [
      {
        "requestId": "TEST_REQ_CONFIRM_PAYMENT_001",
        "orderId": "TEST_ORDER_PARTNER_PENDING_001",
        "amount": 91000,
        "paymentStatus": "Success"
      }
    ]
  }'
```

---

## Success response

```json
{
  "statusCode": 200,
  "error": null,
  "message": "Success",
  "data": [
    {
      "index": 0,
      "orderId": "TEST_ORDER_PARTNER_PENDING_001",
      "requestId": "TEST_REQ_CONFIRM_PAYMENT_001"
    }
  ]
}
```

---

## Mã lỗi

| HTTP | Mã lỗi | errorCode | Mô tả |
|---|---|---|---|
| 400 | _Validation Error_ | — | Payload không đúng schema (thiếu field bắt buộc, sai kiểu, vượt giới hạn). |
| 429 | `QUOTA_EXCEEDED` | — | apiKey không hợp lệ, không tồn tại, hoặc vượt quota. |
| 500 | `ORDER_NOT_FOUND` | `03` | Không tìm thấy đơn hàng theo `orderId` đã cung cấp. |
| 500 | `ALREADY_PAID` | `04` | Đơn hàng đã xử lý, không thể xác nhận lại. |
| 500 | `INVALID_ORDER` | `06` | Đơn hàng đã bị hủy. |
| 500 | `AMOUNT_MISMATCH` | `05` | Số tiền trong request không khớp với tổng tiền của đơn hàng. |
| 500 | `INVALID_BATCH_PAYLOAD` | `02` | Cấu trúc batch không hợp lệ. |
| 500 | `UNKNOWN_ERROR` | `99` | Lỗi không xác định. |

Cấu trúc response lỗi (ví dụ `ORDER_NOT_FOUND`):

```json
{
  "statusCode": 500,
  "error": "ORDER_NOT_FOUND",
  "message": "An internal server error occurred",
  "errorCode": "03"
}
```

---

## Tham khảo

- [Quy chuẩn chung → Common Error](../../Common.html#common-error) — danh sách mã lỗi hệ thống trả về trong trường `error`.
- [Quy chuẩn chung → Partner Order Error Code](../../Common.html#order-error-code) — bảng mã số `errorCode` đi kèm response lỗi.
- [Quy chuẩn chung → Order Payment Status](../../Common.html#payment-status) — danh sách giá trị hợp lệ của trường `paymentStatus`.

---

## Data test cho developer

- clientId: TESTCLIENT
- apiKey: 07e73e61-0dce-4b39-8ecf-06ef70b35c08
- requestId: TEST_REQ_CONFIRM_PAYMENT_001
- orderId hợp lệ: TEST_ORDER_PARTNER_PENDING_001
- amount hợp lệ: 91000

Cần thay bằng dữ liệu môi trường thật khi tích hợp.
