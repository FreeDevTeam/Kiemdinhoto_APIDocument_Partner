# Partner API Documentation Home

Tài liệu này là trang chủ cho toàn bộ API dành cho đối tác.

## Danh sách module

1. Order
- Module index HTML: ./modules/Order/index.html
- Module index MD: ./modules/Order/index.md

2. TaxCDS
- Module index HTML: ./modules/TaxCDS/index.html
- Module index MD: ./modules/TaxCDS/index.md

## Callback / Webhooks

1. Lịch hẹn
- HTML: ./callback-webhooks/Callback_LichHen.html
- MD: ./callback-webhooks/Callback_LichHen.md

2. Đơn hàng
- HTML: ./callback-webhooks/Callback_DonHang.html
- MD: ./callback-webhooks/Callback_DonHang.md

3. Gói dịch vụ thông báo
- HTML: ./callback-webhooks/Callback_ThongBaoCanhBaoPhuongTien.html
- MD: ./callback-webhooks/Callback_ThongBaoCanhBaoPhuongTien.md

4. Dữ liệu vi phạm
- HTML: ./callback-webhooks/Callback_CustomerCriminalRecord.html
- MD: ./callback-webhooks/Callback_CustomerCriminalRecord.md

## Quy ước tài liệu

- Mỗi API có 2 file tương ứng: 1 file Markdown và 1 file HTML.
- Trang chủ có 2 file tương ứng: index.md và index.html.
- Mỗi module có 2 file tương ứng: index.md và index.html.
- cURL mẫu chỉ giữ trường hợp Happy case để tránh nhiễu khi tích hợp.

## Data test đang dùng cho Partner Order

- clientId: TESTCLIENT
- apiKey: 07e73e61-0dce-4b39-8ecf-06ef70b35c08

## Data test đang dùng cho TaxCDS

- apikey: 911abff6-137a-4aa3-a836-555a1d30359b
- taxCode: 8173748371
- citizenIdentityNumber: 079183000002
- taxpayerName: Nguyễn Văn A

Developer cần thay lại credential và dữ liệu theo môi trường thật trước khi UAT/production.