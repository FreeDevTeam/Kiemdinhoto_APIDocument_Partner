# Partner API Module: Order (Single)

Các API xác nhận thanh toán, truy vấn đơn hàng và truy vấn giao dịch dành cho đối tác (xử lý đơn lẻ, không theo lô).

[Quay về trang chủ](../../index.html)

---

## Danh sách API

1. Payment Confirm (Xác nhận thanh toán)
- HTML: ./PartnerOrder_PaymentConfirm.html
- MD: ./PartnerOrder_PaymentConfirm.md

2. Query Order (Truy vấn đơn hàng)
- HTML: ./PartnerOrder_QueryOrder.html
- MD: ./PartnerOrder_QueryOrder.md

3. Query Transaction (Truy vấn giao dịch)
- HTML: ./PartnerOrder_QueryTransaction.html
- MD: ./PartnerOrder_QueryTransaction.md

---

## Lưu ý cho developer

- Các tham số xác thực `clientId` và `apiKey` cần được truyền qua HTTP Header của mỗi request.
- Dữ liệu kiểm thử mẫu trong tài liệu chỉ mang tính chất tham khảo. Developer cần thay bằng dữ liệu thực tế do hệ thống cấp riêng cho từng đối tác.
