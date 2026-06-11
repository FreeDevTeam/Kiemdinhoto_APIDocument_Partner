# Partner API - Order Query Transaction

API do TAMOVE cung cấp, cho phép đối tác gọi vào để truy vấn trạng thái giao dịch. API này được sử dụng trong trường hợp kết quả gạch nợ trả về timeout hoặc không rõ ràng, nhằm xác định chính xác trạng thái cuối cùng của giao dịch để xử lý tiếp theo.

[Về module Order Payment Confirm](./index.html)

---

## Endpoint

| | |
|---|---|
| URL Production | POST {HOST}/PartnerAPI/Order/queryTransaction |
| URL Sandbox | POST {HOST_SANDBOX}/PartnerAPI/Order/queryTransaction |
| Method | POST |
| Content-Type | application/json |
| Encoding | UTF-8 |

---

## Headers schema

| Header | Required | Mô tả |
|---|---|---|
| clientId | Yes | Định danh đối tác do TAMOVE cấp |
| apiKey | Yes | Khóa xác thực API do TAMOVE cấp. Giữ bí mật tuyệt đối |

*Lưu ý: TAMOVE sẽ từ chối toàn bộ request thiếu hoặc sai thông tin xác thực với HTTP 401 (code "01").*

---

## Body schema (JSON)

| Field | Type | Required | Mô tả |
|---|---|---|---|
| requestId | string | Yes | Mã giao dịch phía đối tác – dùng để đối soát và ghi nhận nguồn thanh toán |
| transactionId | string | Yes | Mã định danh giao dịch cần truy vấn (requestId khi gọi API gạch nợ bị timeout/lỗi) |
| orderId | string | Yes | Mã đơn hàng trong hệ thống TAMOVE cần truy vấn |
| amount | number | Yes | Số tiền cần xác nhận khớp với đơn hàng (đơn vị: VNĐ, kiểu số nguyên dương). Ví dụ: 150000 |

---

## Sample Request

```bash
curl --location '{HOST_NAME}/PartnerAPI/Order/queryTransaction' \
  --header 'Content-Type: application/json' \
  --header 'clientId: YOUR_CLIENT_ID' \
  --header 'apiKey: YOUR_API_KEY' \
  --data '{
    "requestId": "YOUR_REQUEST_ID",
    "transactionId": "YOUR_TRANSACTION_ID",
    "orderId": "YOUR_ORDER_ID",
    "amount": 150000
  }'
```

---

## Logic Xử Lý Phía TAMOVE

TAMOVE thực hiện kiểm tra tuần tự theo thứ tự sau. Bước nào thất bại sẽ dừng và trả lỗi ngay lập tức:

| Bước | Kiểm tra | Mô tả | Lỗi nếu thất bại |
|---|---|---|---|
| 1 | Xác thực clientId & apiKey | Kiểm tra header clientId và apiKey hợp lệ và được cấp quyền truy vấn | 01 |
| 2 | Kiểm tra input | transactionId, orderId không rỗng; amount là số nguyên dương | 02 |
| 3 | Kiểm tra đơn tồn tại | Tra cứu transactionId, orderId trong hệ thống TAMOVE | 03 |
| 4 | Kiểm tra số tiền | amount trong request phải khớp chính xác với số tiền đơn hàng | 05 |
| 5 | Trả kết quả | Trả về trạng thái hiện tại của giao dịch cùng các thông tin liên quan | 00 |

---

## Success Response

Khi thành công (code = "00"), trường `data` chứa thông tin trạng thái giao dịch:

```json
{
  "code": "00",
  "message": "Thanh cong",
  "data": {
    "orderId":        "YOUR_ORDER_ID",
    "amount":         150000,
    "transactionStatus": "Success",
    "updatedAt":      "2026-04-02T14:00:00.000Z"
  }
}
```

### Chi tiết cấu trúc data response:
| Trường | Kiểu | Mô tả |
|---|---|---|
| orderId | string | Mã đơn hàng |
| amount | number | Tổng tiền thanh toán |
| transactionStatus | string | Trạng thái thanh toán (xem bảng trạng thái bên dưới) |
| updatedAt | string | Thời điểm cập nhật mới nhất, định dạng ISO 8601 |

---

## Mã lỗi & Ví dụ Response

### Cấu Trúc Response Body Chung
- `code` (String): Mã kết quả xử lý (xem bảng mã bên dưới).
- `message` (String): Mô tả kết quả.
- `data` (Object | null): Dữ liệu bổ sung hoặc thông tin lỗi (tuỳ từng trường hợp, có thể null).

### Bảng Mã Kết Quả:
| Code | HTTP | Ý nghĩa | Mô tả & Hướng xử lý cho đối tác |
|---|---|---|---|
| `00` | 200 | Thành công | Tìm thấy giao dịch, trả về thông tin trạng thái giao dịch đầy đủ trong data |
| `01` | 400 / 401 | Xác thực thất bại | clientId hoặc apiKey không hợp lệ hoặc không được cấp quyền |
| `02` | 400 | Thiếu hoặc sai tham số | Một hoặc nhiều trường bắt buộc bị thiếu, sai kiểu hoặc không hợp lệ |
| `03` | 400 | Không tìm thấy đơn hàng | orderId không tồn tại trong hệ thống TAMOVE |
| `05` | 500 | Số tiền không khớp | amount trong request khác số tiền thực tế của đơn. data trả về amount đúng |
| `99` | 500 | Lỗi hệ thống | Lỗi nội bộ TAMOVE – liên hệ hỗ trợ nếu lặp lại |

### Ví dụ Response lỗi:

**1. Sai clientId hoặc apiKey (HTTP 400/401 Unauthorized):**
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
  "message": "Thieu tham so bat buoc: orderId",
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

**4. Số tiền không khớp (HTTP 500 Unprocessable Entity):**
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

## Bảng Trạng Thái Giao Dịch (transactionStatus)

| Giá trị | Ý nghĩa | Mô tả & Hướng xử lý cho đối tác |
|---|---|---|
| `New` | Mới ghi nhận giao dịch | Mới ghi nhận giao dịch, đối tác gọi lại truy vấn giao dịch sau X thời gian |
| `Processing` | Đang xử lý giao dịch | Đang xử lý giao dịch gạch nợ, đối tác gọi lại truy vấn giao dịch sau X thời gian |
| `Pending` | Đang chờ xử lý | Đang chờ xử lý, đối tác gọi lại truy vấn giao dịch sau X thời gian |
| `Failed` | Xử lý thất bại | Giao dịch thất bại, đối tác cập nhật trạng thái mới & hoàn tiền (nếu cần) |
| `Success` | Xử lý thành công | Yêu cầu gạch nợ đã được xử lý thành công, đối tác cập nhật trạng thái mới & xác nhận |
| `Canceled` | Huỷ thanh toán | Thanh toán thất bại, đối tác cập nhật trạng thái mới & hoàn tiền (nếu cần) |

---

## Quy Tắc Quan Trọng

- **Kiểm tra số tiền:** `amount` phải là số nguyên dương tính bằng VNĐ. TAMOVE so sánh chính xác (exact match) với số tiền đơn hàng. Trường hợp không khớp, TAMOVE trả code `"05"` kèm amount đúng trong `data` để đối tác đối chiếu.
- **Trạng thái giao dịch và luồng tiếp theo:** Đối tác nên kiểm tra `transactionStatus` trong response trước khi tiến hành các bước tiếp theo:
  - `New`, `Processing`, `Pending` → Giao dịch hợp lệ, đang trong quá trình xử lý gạch nợ.
  - `Success` → Giao dịch đã được xử lý thành công, cập nhật trạng thái mới, ghi nhận hoàn tất.
  - `Canceled`, `Failed` → Giao dịch thất bại, cập nhật trạng thái mới, thực hiện hoàn tiền nếu cần.
  - Trường hợp đối tác retry nhiều lần nhưng trạng thái vẫn không đổi, có thể liên hệ với chúng tôi để xử lý.
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
- [Quy chuẩn chung → Order Payment Status](../../Common.html#payment-status) — danh sách giá trị hợp lệ của trường `transactionStatus`.

---

## Thông Tin Liên Hệ

| Thông tin | Giá trị |
|---|---|
| Endpoint Sandbox | https://tamove-develop-server.service.makefamousapp.com |
| Endpoint Production | (Liên hệ sau) |
| API Gạch Nợ liên quan | [PartnerOrder_PaymentConfirm.html](./PartnerOrder_PaymentConfirm.html) |
| Email kỹ thuật | tech@tamove.vn |
| Hotline hỗ trợ | 1800 xxxx (8:00 – 17:30, Thứ 2 – Thứ 6) |
| Đầu mối liên hệ | Team TAMOVE |
