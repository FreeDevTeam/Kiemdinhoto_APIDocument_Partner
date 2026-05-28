# Partner API Module: Order Payment (CustomerOrder)

## Danh sách API

1. Get Public Payment Method
- HTML: ./PartnerOrder_OrderPayment_GetPublicPaymentMethod.html
- MD: ./PartnerOrder_OrderPayment_GetPublicPaymentMethod.md

2. Calculate Payment Info
- HTML: ./PartnerOrder_OrderPayment_CalculatePaymentInfo.html
- MD: ./PartnerOrder_OrderPayment_CalculatePaymentInfo.md

3. Create Payment
- HTML: ./PartnerOrder_OrderPayment_CreatePayment.html
- MD: ./PartnerOrder_OrderPayment_CreatePayment.md

## Data test tham chiếu

Nguồn: API/Order/test/OrderTest_Partner_Data.js trong server codebase.

- orderId pending: TEST_ORDER_PARTNER_PENDING_001
- orderId paid: TEST_ORDER_PARTNER_PAID_001
- orderId canceled: TEST_ORDER_PARTNER_CANCELED_001

Lưu ý cho developer:
- Đây là dữ liệu cố định phục vụ test e2e và viết tài liệu.
- Trước khi tích hợp môi trường thật, thay toàn bộ TEST_* bằng dữ liệu theo tenant/đối tác thực tế.
