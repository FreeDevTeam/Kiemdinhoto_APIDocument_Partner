# Partner API - Order Payment Confirm

API do TAMOVE cung cấp cho phép đối tác gọi vào để thực hiện gạch nợ (xác nhận thanh toán) đơn hàng sau khi khách hàng thanh toán thành công qua luồng thanh toán tích hợp.

[Về module Order Payment Confirm](./index.html)

---

## Endpoint

| | |
|---|---|
| URL Production | POST {HOST}/PartnerAPI/Order/paymentConfirm |
| URL Sandbox | POST {HOST_SANDBOX}/PartnerAPI/Order/paymentConfirm |
| Method | POST |
| Content-Type | application/json |
| Encoding | UTF-8 |

---

## Headers schema

| Header | Required | Mô tả |
|---|---|---|
| clientId | Yes | Định danh đối tác do TAMOVE cấp |
| apiKey | Yes | Khóa xác thực API do TAMOVE cấp. Giữ bí mật tuyệt đối |

*Lưu ý: TAMOVE sẽ từ chối toàn bộ request thiếu hoặc sai thông tin xác thực với HTTP 400 (code "01").*

---

## Body schema (JSON)

| Field | Type | Required | Mô tả |
|---|---|---|---|
| requestId | string | Yes | Mã giao dịch phía đối tác – dùng để đối soát và ghi nhận nguồn thanh toán |
| orderId | string | Yes | Mã đơn hàng trong hệ thống TAMOVE cần gạch nợ |
| amount | number | Yes | Số tiền thanh toán (đơn vị: VNĐ, kiểu số nguyên dương). Ví dụ: 150000 |
| paymentStatus | string | Yes | Trạng thái thanh toán (Thường là `Success`). |

---

## Sample Request

```bash
curl --location '{HOST_NAME}/PartnerAPI/Order/paymentConfirm' \
  --header 'Content-Type: application/json' \
  --header 'clientId: YOUR_CLIENT_ID' \
  --header 'apiKey: YOUR_API_KEY' \
  --data '{
    "requestId": "YOUR_REQUEST_ID",
    "orderId": "TEST_ORDER_PARTNER_PENDING_001",
    "amount": 91000,
    "paymentStatus": "Success"
  }'
```

---

## Logic Xử Lý Phía TAMOVE

TAMOVE thực hiện kiểm tra tuần tự theo thứ tự sau. Bước nào thất bại sẽ dừng và trả lỗi ngay lập tức:

| Bước | Kiểm tra | Mô tả | Lỗi nếu thất bại |
|---|---|---|---|
| 1 | Xác thực clientId & apiKey | Kiểm tra header clientId và apiKey hợp lệ và được cấp quyền gạch nợ | 01 |
| 2 | Kiểm tra input | orderId không rỗng; amount là số nguyên dương | 02 |
| 3 | Kiểm tra đơn tồn tại | Tra cứu orderId trong hệ thống TAMOVE | 03 |
| 4 | Kiểm tra trạng thái đơn | Đơn phải ở trạng thái chờ thanh toán. Đơn đã thanh toán trả idempotent | 04 / 06 |
| 5 | Kiểm tra số tiền | amount trong request phải khớp chính xác với số tiền đơn hàng | 05 |
| 6 | Gạch nợ đơn hàng | Cập nhật trạng thái đơn thành đã thanh toán, ghi nhận requestId để đối soát | 00 |

---

## Success Response

```json
{
  "code": "00",
  "message": "Thanh toan thanh cong",
  "data": {
    "orderId": "TEST_ORDER_PARTNER_PENDING_001"
  }
}
```

---

## Mã lỗi & Ví dụ Response

### Cấu Trúc Response Body Chung
- `code` (String): Mã kết quả xử lý (xem bảng mã bên dưới).
- `message` (String): Mô tả kết quả.
- `data` (Object | null): Dữ liệu bổ sung (tuỳ từng trường hợp, có thể null).

### Bảng Mã Kết Quả:
| Code | HTTP | Ý nghĩa | Mô tả & Hướng xử lý cho đối tác |
|---|---|---|---|
| `00` | 200 | Thành công | Gạch nợ thành công, đơn hàng đã được cập nhật trạng thái đã thanh toán |
| `01` | 400 | Xác thực thất bại | clientId hoặc apiKey không hợp lệ hoặc không được cấp quyền |
| `02` | 400 | Thiếu hoặc sai tham số | Một hoặc nhiều trường bắt buộc bị thiếu, sai kiểu hoặc không hợp lệ |
| `03` | 400 | Không tìm thấy đơn hàng | orderId không tồn tại trong hệ thống TAMOVE |
| `04` | 400 | Đơn hàng đã thanh toán | Đơn hàng đã được gạch nợ trước đó – không xử lý lại (idempotent) |
| `05` | 500 | Số tiền không khớp | amount trong request khác số tiền thực tế của đơn hàng. data trả về amount đúng |
| `06` | 400 | Đơn hàng không hợp lệ | Đơn hàng tồn tại nhưng ở trạng thái không cho phép gạch nợ (đã huỷ, hết hạn...) |
| `99` | 500 | Lỗi hệ thống | Lỗi nội bộ TAMOVE – liên hệ hỗ trợ nếu lặp lại |

### Ví dụ Response lỗi:

**1. Sai clientId hoặc apiKey (HTTP 400 Unauthorized):**
```json
{
  "code": "01",
  "message": "Xac thuc that bai",
  "data": null
}
```

**2. Thiếu hoặc sai tham số đầu vào (HTTP 400 Bad Request):**
```json
{
  "code": "02",
  "message": "Thieu tham so bat buoc: amount",
  "data": null
}
```

**3. Không tìm thấy đơn hàng (HTTP 400 Not Found):**
```json
{
  "code": "03",
  "message": "Khong tim thay don hang",
  "data": null
}
```

**4. Đơn hàng đã thanh toán trước đó (HTTP 400 Conflict):**
```json
{
  "code": "04",
  "message": "Don hang da thanh toan",
  "data": {
    "orderId": "ORDER_ID"
  }
}
```

**5. Số tiền không khớp (HTTP 500 Unprocessable Entity):**
```json
{
  "code": "05",
  "message": "So tien khong khop",
  "data": {
    "amount": 150000
  }
}
```

---

## Bảng Trạng Thái Đơn Hàng (paymentStatus)

| Giá trị | Ý nghĩa | Mô tả & Hướng xử lý cho đối tác |
|---|---|---|
| `Processing` | Đang thanh toán | Đang xử lý thanh toán |
| `Pending` | Chờ thanh toán | Chờ thanh toán |
| `Failed` | Thanh toán thất bại | Thanh toán thất bại |
| `Success` | Thanh toán thành công | Thanh toán thành công |
| `Canceled` | Huỷ thanh toán | Huỷ thanh toán |

---

## Quy Tắc Quan Trọng

- **Idempotency:** Nếu đối tác gọi lại cùng một `orderId` đã được gạch nợ thành công, TAMOVE trả code `"04"` thay vì xử lý lại. Đối tác không cần retry khi nhận code `"04"`.
- **Kiểm tra số tiền:** `amount` phải là số nguyên dương tính bằng VNĐ. TAMOVE so sánh chính xác (exact match) với số tiền đơn hàng. Trường hợp không khớp, TAMOVE trả code `"05"` kèm amount đúng trong `data` để đối tác đối chiếu.
- **Retry Policy:** Đối tác có thể retry khi gặp lỗi HTTP 5xx hoặc timeout. TAMOVE xử lý idempotent nên gọi lại cùng orderId là an toàn. Khuyến nghị retry tối đa 3 lần với exponential backoff (1s, 3s, 9s).
- **requestId:** TAMOVE lưu lại `requestId` từ đối tác để phục vụ đối soát giao dịch. Đây là mã giao dịch bên đối tác, không phải mã để tra cứu đơn hàng phía TAMOVE.

---

## Bảo Mật

- apiKey do TAMOVE cấp riêng cho đối tác qua kênh bảo mật ngoài băng tần. Không lưu trong source code hay log.
- Toàn bộ giao tiếp bắt buộc qua HTTPS. HTTP thuần không được hỗ trợ.
- TAMOVE giới hạn tần suất gọi (rate limit). Vượt ngưỡng sẽ trả HTTP 429.
- Mọi request và response được ghi log đầy đủ phục vụ đối soát và xử lý tranh chấp.
- Đối tác nên cấu hình IP cố định để gọi API. TAMOVE có thể bổ sung IP whitelist theo yêu cầu.

---

## Tham khảo

- [Quy chuẩn chung → Common Error](../../Common.html#common-error) — danh sách mã lỗi hệ thống trả về trong trường `error`.
- [Quy chuẩn chung → Partner Order Error Code](../../Common.html#order-error-code) — bảng mã số `errorCode` đi kèm response lỗi.
- [Quy chuẩn chung → Order Payment Status](../../Common.html#payment-status) — danh sách giá trị hợp lệ của trường `paymentStatus`.

---

## Thông Tin Liên Hệ

| Thông tin | Giá trị |
|---|---|
| Endpoint Sandbox | https://tamove-develop-server.service.makefamousapp.com |
| Endpoint Production | (Liên hệ sau) |
| Email kỹ thuật | tech@tamove.vn |
| Hotline hỗ trợ | 1800 xxxx (8:00 – 17:30, Thứ 2 – Thứ 6) |
| Đầu mối liên hệ | Team TAMOVE |
