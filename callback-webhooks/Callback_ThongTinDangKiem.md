# Callback / Webhooks - Thông tin đăng kiểm

Mô tả dữ liệu mà đối tác nhận được khi hệ thống gửi callback liên quan đến thông tin đăng kiểm của phương tiện.

## Phạm vi dữ liệu

Chỉ truy cập những dữ liệu thông tin đăng kiểm được ghi nhận cho phương tiện mà đối tác có liên quan.

## Cấu trúc payload callback

```json
{
  "customerData": {
    "customerIdentifier": "0382716917"
  },
  "serviceData": {
    "appUserVehicleNotifyInfoId": 1,
    "notifyStartDateTime": "2026-06-19T17:00:00.000Z",
    "notifyEndDateTime": "2026-07-20T16:59:59.000Z",
    "vehicleIdentity": "30A84812",
    "vehiclePlateColor": "WHITE",
    "vehicleType": "",
    "allowRenew": 1,
    "partnerRequestId": "1781585503732"
  },
  "callbackData": {
    "customerIdentifier": "0382716917",
    "vehicleIdentity": "30A84812",
    "vehicleType": 1,
    "vehiclePlateColor": "WHITE",
    "vehicleExpiryDate": "01/01/2027"
  }
}
```

## Dữ liệu callback

### customerData

| Field | Type | Mô tả |
|---|---|---|
| customerIdentifier | string | Định danh khách hàng (Số điện thoại hoặc userId) |

### serviceData

| Field | Type | Mô tả |
|---|---|---|
| appUserVehicleNotifyInfoId | number | ID dịch vụ (ID gói dịch vụ thông báo vi phạm tự động,...) |
| notifyStartDateTime | string | Ngày kích hoạt dịch vụ (định dạng ISO 8601) |
| notifyEndDateTime | string | Ngày kết thúc dịch vụ (định dạng ISO 8601) |
| vehicleIdentity | string | Biển số xe |
| vehiclePlateColor | string | Màu biển số xe |
| vehicleType | string | Loại phương tiện |
| allowRenew | number | Trạng thái cho phép gia hạn (1: Cho phép gia hạn, 0: Không cho phép gia hạn) |
| partnerRequestId | string | ID đối tác yêu cầu đăng ký dịch vụ lúc đầu |

### callbackData

| Field | Type | Mô tả |
|---|---|---|
| customerIdentifier | string | Định danh khách hàng (Số điện thoại hoặc userId) |
| vehicleIdentity | string | Biển số xe |
| vehicleType | number | Loại phương tiện (Xem bảng liệt kê trạng thái bên dưới) |
| vehiclePlateColor | string | Màu biển số xe (Xem bảng liệt kê trạng thái bên dưới) |
| vehicleExpiryDate | string | Ngày hết hạn đăng kiểm (định dạng DD/MM/YYYY) |

## Bảng liệt kê trạng thái

### vehicleType - Loại phương tiện

| Giá trị | Mô tả |
|---|---|
| 1 | Ô tô |
| 10 | Xe khác |
| 20 | Rơ moóc |
| 30 | Xe máy |
| 40 | Xe điện |

### vehiclePlateColor - Màu biển số xe

| Giá trị | Mô tả |
|---|---|
| WHITE | Trắng |
| YELLOW | Vàng |
| BLUE | Xanh |
| RED | Đỏ |
