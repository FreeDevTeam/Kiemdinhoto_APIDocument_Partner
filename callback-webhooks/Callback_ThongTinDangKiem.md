# Callback / Webhooks - Thông tin đăng kiểm

Mô tả dữ liệu mà đối tác nhận được khi hệ thống gửi callback liên quan đến thông tin đăng kiểm của phương tiện.

## Phạm vi dữ liệu

Chỉ truy cập những dữ liệu thông tin đăng kiểm được ghi nhận cho phương tiện mà đối tác có liên quan.

## Cấu trúc payload callback

```json
{
  "callbackData": {
    "vehicleIdentity": "30A84812",
    "vehicleType": 1,
    "vehicleExpiryDate": "2026-12-31"
  }
}
```

## Dữ liệu callback

| Field | Type | Mô tả |
|---|---|---|
| vehicleIdentity | string | Biển số xe |
| vehicleType | number | Loại phương tiện |
| vehicleExpiryDate | string | Ngày hết hạn đăng kiểm (định dạng YYYY-MM-DD) |

## Bảng liệt kê trạng thái

### vehicleType - Loại phương tiện

| Giá trị | Mô tả |
|---|---|
| 1 | Ô tô |
| 10 | Xe khác |
| 20 | Rơ moóc |
| 30 | Xe máy |
| 40 | Xe điện |
