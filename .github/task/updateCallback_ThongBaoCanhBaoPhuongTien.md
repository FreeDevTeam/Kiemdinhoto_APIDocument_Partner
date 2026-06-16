Chỉnh sửa tài liệu Callback_ThongBaoCanhBaoPhuongTien.html

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

## 2. Bổ sung bảng mô tả các section trong payload

Thêm bảng mô tả 4 section cấp cao nhất vào phần "Dữ liệu callback", đặt phía trên bảng chi tiết field hiện có:

| Section | Mô tả |
|---|---|
| customerData | Thông tin định danh khách hàng |
| vehicleData | Thông tin phương tiện đăng ký dịch vụ |
| serviceData | Thông tin gói dịch vụ đang sử dụng |
| callbackData | Dữ liệu trạng thái gói dịch vụ hiện tại |

## 3. Bổ sung mô tả các field trong callbackData

Thêm bảng sau vào phần "Dữ liệu callback", sau bảng section ở trên:

**callbackData**

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