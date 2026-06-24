# Callback / Webhooks - Gói dịch vụ thông báo

> **⚠️ QUAN TRỌNG:** Tất cả các callback POST từ hệ thống đến đối tác đều bắt buộc phải được xác thực. Vui lòng tham khảo hướng dẫn cấu hình và verify signature tại: [Hướng dẫn xác thực Webhook Callback](./Webhook_Authentication.md).

Mô tả dữ liệu đối tác nhận được khi hệ thống gửi callback liên quan đến gói dịch vụ thông báo mà đối tác đã bán hoặc khởi tạo.

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
    "serviceData": {
        "appUserVehicleNotifyInfoId": 1,
        "notifyStartDateTime": "2026-06-19T17:00:00.000Z",
        "notifyEndDateTime": "2026-07-20T16:59:59.000Z",
        "allowRenew": 1,
        "partnerRequestId": "1781585503732"
    },
    "callbackData": {
        "partnerRequestId": "1781585503732",
        "appUserVehicleNotifyInfoId": 1,
        "notifyStartDate": "20260619",
        "notifyEndDate": "20260720",
        "notifyStartDateTime": "2026-06-19T17:00:00.000Z",
        "notifyEndDateTime": "2026-07-20T16:59:59.000Z",
        "allowRenew": 1,
        "isAvailable": 1,
        "intervalViolation": 1,
        "intervalNoViolation": 7
    }
}
```

## Dữ liệu callback

### Cấu trúc các section

| Section | Mô tả |
|---|---|
| customerData | Thông tin định danh khách hàng |
| vehicleData | Thông tin phương tiện đăng ký dịch vụ |
| serviceData | Thông tin gói dịch vụ đang sử dụng |
| callbackData | Dữ liệu trạng thái gói dịch vụ hiện tại |

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

### serviceData

| Field | Type | Mô tả |
|---|---|---|
| appUserVehicleNotifyInfoId | number | ID gói dịch vụ thông báo vi phạm tự động |
| notifyStartDateTime | string (ISO 8601) | Ngày kích hoạt dịch vụ |
| notifyEndDateTime | string (ISO 8601) | Ngày kết thúc dịch vụ |
| allowRenew | number | Cho phép gia hạn tự động (1 = có, 0 = không) |
| partnerRequestId | string | ID do đối tác cung cấp khi đăng ký dịch vụ |

### callbackData

| Field | Type | Mô tả |
|---|---|---|
| partnerRequestId | string | ID do đối tác cung cấp khi đăng ký dịch vụ |
| appUserVehicleNotifyInfoId | number | ID gói dịch vụ thông báo vi phạm tự động |
| notifyStartDate | string (YYYYMMDD) | Ngày kích hoạt dịch vụ |
| notifyEndDate | string (YYYYMMDD) | Ngày kết thúc dịch vụ |
| notifyStartDateTime | string (ISO 8601) | Thời điểm kích hoạt dịch vụ |
| notifyEndDateTime | string (ISO 8601) | Thời điểm kết thúc dịch vụ |
| allowRenew | number | Cho phép gia hạn tự động (1 = có, 0 = không) |
| isAvailable | number | Trạng thái kích hoạt gói (1 = đang hoạt động, 0 = chưa kích hoạt) |
| intervalViolation | number | Tần suất thông báo khi phương tiện có vi phạm (số ngày) |
| intervalNoViolation | number | Tần suất thông báo khi phương tiện không có vi phạm (số ngày) |

## Bảng liệt kê trạng thái

### isAvailable - Trạng thái hiệu lực gói

| Giá trị | Mô tả |
|---|---|
| 1 | Còn hiệu lực |
| 0 | Hết hiệu lực |

### allowRenew - Trạng thái cho phép gia hạn

| Giá trị | Mô tả |
|---|---|
| 1 | Cho phép gia hạn |
| 0 | Không cho phép gia hạn |

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
