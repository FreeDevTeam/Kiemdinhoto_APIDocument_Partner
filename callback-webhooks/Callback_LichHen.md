# Callback / Webhooks - Lịch hẹn

> **⚠️ QUAN TRỌNG:** Tất cả các callback POST từ hệ thống đến đối tác đều bắt buộc phải được xác thực. Vui lòng tham khảo hướng dẫn cấu hình và verify signature tại: [Hướng dẫn xác thực Webhook Callback](./Webhook_Authentication.md).

Mô tả dữ liệu mà đối tác nhận được khi hệ thống gửi callback liên quan đến lịch hẹn do chính đối tác tạo.

## Phạm vi dữ liệu

Chỉ truy cập những dữ liệu mà đối tác tạo ra.

## Cấu trúc payload callback

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

## Dữ liệu callback

### Cấu trúc các section

| Section | Mô tả |
|---|---|
| customerData | Thông tin định danh khách hàng |
| vehicleData | Thông tin phương tiện |
| callbackData | Dữ liệu chi tiết lịch hẹn |

### customerData

| Field | Type | Mô tả |
|---|---|---|
| customerIdentifier | string | Định danh khách hàng (Số điện thoại hoặc userId) |

### vehicleData

| Field | Type | Mô tả |
|---|---|---|
| vehicleIdentity | string | Biển số xe |
| vehiclePlateColor | string | Màu biển số xe (Xem bảng liệt kê trạng thái bên dưới) |
| vehicleType | number | Loại phương tiện (Xem bảng liệt kê trạng thái bên dưới) |

### callbackData

| Field | Type | Mô tả |
|---|---|---|
| customerScheduleId | number | ID lịch hẹn |
| licensePlates | string | Biển số xe |
| licensePlateColor | number | Màu biển số xe (Xem bảng liệt kê trạng thái bên dưới) |
| vehicleType | number | Loại phương tiện (Xem bảng liệt kê trạng thái bên dưới) |
| phone | string | Số điện thoại khách hàng |
| fullnameSchedule | string | Họ tên khách hàng |
| email | string | Email khách hàng |
| dateSchedule | string (DD/MM/YYYY) | Ngày hẹn |
| time | string | Khung giờ hẹn |
| scheduleSerial | number | Số thứ tự trong khung giờ |
| scheduleCode | string | Mã lịch hẹn |
| customerScheduleStatus | number | Trạng thái lịch hẹn (Xem bảng liệt kê trạng thái bên dưới) |
| scheduleNote | string | Ghi chú lịch hẹn |
| scheduleType | number | Loại lịch hẹn (Xem bảng liệt kê trạng thái bên dưới) |
| scheduleHash | string | Mã hash định danh lịch hẹn |
| confirmStatus | number | Trạng thái xác nhận (Xem bảng liệt kê trạng thái bên dưới) |
| scheduleTracking | string | Mã tracking lịch hẹn |
| createdAt | string (ISO 8601) | Thời điểm tạo lịch hẹn |
| updatedAt | string (ISO 8601) | Thời điểm cập nhật lịch hẹn |

## Bảng liệt kê trạng thái

### customerScheduleStatus - Trạng thái lịch hẹn

| Giá trị | Mô tả |
|---|---|
| 0 | Chưa xác nhận |
| 10 | Đã xác nhận |
| 20 | Đã hủy |
| 30 | Đã đóng |

### scheduleType - Loại lịch hẹn

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

### licensePlateColor - Màu biển số

| Giá trị | Mô tả |
|---|---|
| 1 | Trắng |
| 2 | Xanh |
| 3 | Vàng |
| 4 | Đỏ |

### vehiclePlateColor - Màu biển số xe

| Giá trị | Mô tả |
|---|---|
| WHITE | Trắng |
| YELLOW | Vàng |
| BLUE | Xanh |
| RED | Đỏ |

### vehicleType - Loại phương tiện

| Giá trị | Mô tả |
|---|---|
| 1 | Ô tô |
| 10 | Xe khác |
| 20 | Rơ moóc |
| 30 | Xe máy |
| 40 | Xe điện |

### confirmStatus - Trạng thái xác nhận

| Giá trị | Mô tả |
|---|---|
| 0 | Chưa xác nhận |
| 1 | Đã xác nhận |
| 2 | Đã hủy |
