Chỉnh sửa tài liệu Callback_LichHen.html

## 1. Cập nhật payload callback

Thay thế toàn bộ phần "Cấu trúc payload callback" bằng format mới sau:

```json
{
    "customerData": {
        "customerIdentifier": "0382716917"
    },
    "vehicleData": {
        "vehicleIdentity": "30A84812",
        "vehiclePlateColor": "WHITE",
        "vehicleType": 1
    },
    "callbackData": {
        "customerScheduleId": 100001,
        "licensePlates": "30A84812",
        "licensePlateColor": 1,
        "vehicleType": 1,
        "phone": "0382716917",
        "fullnameSchedule": "Nguyễn Văn An",
        "email": "nguyenvanan@example.com",
        "dateSchedule": "19/06/2026",
        "time": "7h30-8h00",
        "scheduleSerial": 1,
        "scheduleCode": "SCH-20260619-0001",
        "customerScheduleStatus": 3,
        "scheduleNote": "Xe đến đúng hẹn, kiểm định lần đầu",
        "scheduleType": 1,
        "scheduleHash": "d4f8a2b1c9e3f7a0b5d6e2c8f1a3b9d7",
        "confirmStatus": 1,
        "scheduleTracking": "TRK-20260619-100001",
        "createdAt": "2026-06-16T08:30:00.000Z",
        "updatedAt": "2026-06-16T08:30:15.000Z"
    }
}
```

## 2. Bổ sung bảng mô tả các section trong payload

Thêm bảng mô tả 3 section cấp cao nhất vào phần "Dữ liệu callback", đặt phía trên bảng chi tiết field hiện có:

| Section | Mô tả |
|---|---|
| customerData | Thông tin định danh khách hàng |
| vehicleData | Thông tin phương tiện |
| callbackData | Dữ liệu chi tiết lịch hẹn |

## 3. Bổ sung mô tả các field trong callbackData

Thêm bảng sau vào phần "Dữ liệu callback", sau bảng section ở trên:

**callbackData**

| Field | Type | Mô tả |
|---|---|---|
| customerScheduleId | number | ID lịch hẹn |
| licensePlates | string | Biển số xe |
| licensePlateColor | number | Màu biển số xe |
| vehicleType | number | Loại phương tiện |
| phone | string | Số điện thoại khách hàng |
| fullnameSchedule | string | Họ tên khách hàng |
| email | string | Email khách hàng |
| dateSchedule | string (DD/MM/YYYY) | Ngày hẹn |
| time | string | Khung giờ hẹn |
| scheduleSerial | number | Số thứ tự trong khung giờ |
| scheduleCode | string | Mã lịch hẹn |
| customerScheduleStatus | number | Trạng thái lịch hẹn |
| scheduleNote | string | Ghi chú lịch hẹn |
| scheduleType | number | Loại lịch hẹn |
| scheduleHash | string | Mã hash định danh lịch hẹn |
| confirmStatus | number | Trạng thái xác nhận (1 = đã xác nhận, 0 = chưa xác nhận) |
| scheduleTracking | string | Mã tracking lịch hẹn |
| createdAt | string (ISO 8601) | Thời điểm tạo lịch hẹn |
| updatedAt | string (ISO 8601) | Thời điểm cập nhật lịch hẹn |

## 4. Bổ sung bảng liệt kê trạng thái

**customerScheduleStatus — Trạng thái lịch hẹn**

| Giá trị | Mô tả |
|---|---|
| 0 | Chưa xác nhận |
| 10 | Đã xác nhận |
| 20 | Đã hủy |
| 30 | Đã đóng |

**licensePlateColor — Màu biển số**

| Giá trị | Mô tả |
|---|---|
| 1 | Trắng |
| 2 | Xanh |
| 3 | Vàng |
| 4 | Đỏ |

**scheduleType — Loại lịch hẹn**

| Giá trị | Mô tả |
|---|---|
| 1 | Đăng kiểm xe cũ |
| 2 | Đăng ký dán thẻ EPASS |
| 3 | Nộp hồ sơ xe mới |
| 4 | Đổi mục đích sử dụng, đổi chủ, đổi thông tin hồ sơ |
| 5 | Thanh toán phí đường bộ |
| 7 | Đặt lịch tư vấn bảo dưỡng |
| 8 | Đặt lịch tư vấn bảo hiểm |
| 9 | Đặt lịch tư vấn hoán cải |
| 10 | Mất giấy đăng kiểm |
| 11 | Cấp lại tem đăng kiểm |
| 12 | Tư vấn đăng kiểm xe |
| 13 | Tư vấn xử lý phạt nguội |
| 14 | Tư vấn bảo hiểm TNDS xe ô tô |
| 15 | Tra cứu cảnh báo đăng kiểm |
| 16 | Hỗ trợ xử lý phạt nguội |
| 17 | Gia hạn định vị |
| 18 | Gia hạn phù hiệu xe kinh doanh |
| 19 | Gia hạn giấy tập huấn |
| 20 | Gia hạn camera hành trình |
| 21 | Đăng ký dán thẻ VETC |
| 22 | Gia hạn BH TNDS |
| 23 | Nộp hồ sơ xe mới (ngoài giờ hành chính) |
| 24 | Đăng kiểm xe (ngoài giờ hành chính) |
| 25 | Tư vấn bồi thường bảo hiểm |
| 26 | Tư vấn sức khỏe lái xe |
| 27 | Bán vé điện tử |