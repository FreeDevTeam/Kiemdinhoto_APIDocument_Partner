# Callback / Webhooks - Dữ liệu vi phạm

Mô tả dữ liệu mà đối tác nhận được khi hệ thống gửi callback liên quan đến bản ghi vi phạm của phương tiện.

## Phạm vi dữ liệu

Chỉ truy cập những dữ liệu vi phạm được ghi nhận cho phương tiện mà đối tác có liên quan.

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
        "notifyType": 1,
        "fineStatus": 1,
        "refreshDate": "16/06/2026",
        "criminalRecords": [
            {
                "customerCriminalRecordId": 100001,
                "customerRecordPlatenumber": "30A84812",
                "vehicleType": 1,
                "customerRecordPlateColor": "WHITE",
                "customerRecordPlateColorDesc": "Nền màu trắng, chữ và số màu đen",
                "crimeRecordContent": "Điều khiển xe chạy quá tốc độ quy định từ 05 km/h đến dưới 10 km/h",
                "crimeRecordStatus": "Chưa xử phạt",
                "crimeRecordTime": "2026-06-10 08:15:00",
                "crimeRecordPIC": "Đội Cảnh sát giao thông số 1 - Công an TP. Hà Nội",
                "crimeRecordAddressPIC": "Số 2 Thiền Quang, Nguyễn Du, Hai Bà Trưng, Hà Nội",
                "crimeRecordLocation": "Đường Nguyễn Trãi, Phường Thanh Xuân Trung, Quận Thanh Xuân, TP. Hà Nội",
                "crimeRecordContact": "024.38521234",
                "crimeRecordAgency": "Cục Cảnh sát giao thông - Bộ Công an",
                "crimeRecordAmendmentDate": "10/06/2026"
            },
            {
                "customerCriminalRecordId": 100002,
                "customerRecordPlatenumber": "30A84812",
                "vehicleType": 1,
                "customerRecordPlateColor": "WHITE",
                "customerRecordPlateColorDesc": "Nền màu trắng, chữ và số màu đen",
                "crimeRecordContent": "Không chấp hành hiệu lệnh của đèn tín hiệu giao thông",
                "crimeRecordStatus": "Chưa xử phạt",
                "crimeRecordTime": "2026-06-12 17:45:00",
                "crimeRecordPIC": "Đội Cảnh sát giao thông số 3 - Công an TP. Hà Nội",
                "crimeRecordAddressPIC": "Số 89 Trần Hưng Đạo, Hoàn Kiếm, Hà Nội",
                "crimeRecordLocation": "Ngã tư Đinh Tiên Hoàng - Tràng Thi, Quận Hoàn Kiếm, TP. Hà Nội",
                "crimeRecordContact": "024.39431234",
                "crimeRecordAgency": "Cục Cảnh sát giao thông - Bộ Công an",
                "crimeRecordAmendmentDate": "12/06/2026"
            }
        ]
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
| callbackData | Dữ liệu kết quả tra cứu vi phạm |

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
| notifyType | number | Loại thông báo vi phạm (Xem bảng liệt kê trạng thái bên dưới) |
| fineStatus | number | Trạng thái vi phạm phạt nguội (1 = có vi phạm, 0 = không vi phạm) |
| refreshDate | string | Ngày cập nhật dữ liệu (định dạng DD/MM/YYYY) |
| criminalRecords | array | Danh sách các bản ghi vi phạm (chi tiết bên dưới) |

### Chi tiết bản ghi vi phạm (trong criminalRecords)

| Field | Type | Mô tả |
|---|---|---|
| customerCriminalRecordId | number | Mã bản ghi vi phạm (primary key) |
| customerRecordPlatenumber | string | Biển số xe vi phạm |
| customerRecordPlateColor | string | Màu biển số xe (Xem bảng liệt kê trạng thái bên dưới) |
| customerRecordPlateColorDesc | string | Mô tả màu biển số |
| vehicleType | number | Loại phương tiện vi phạm (Xem bảng liệt kê trạng thái bên dưới) |
| crimeRecordContent | string | Nội dung vi phạm |
| crimeRecordStatus | string | Trạng thái xử lý vi phạm (Xem bảng liệt kê trạng thái bên dưới) |
| crimeRecordTime | datetime | Thời gian phát hiện vi phạm |
| crimeRecordPIC | string | Cơ quan phát hiện vi phạm |
| crimeRecordLocation | string | Địa điểm phát hiện vi phạm |
| crimeRecordContact | string | Số điện thoại liên hệ của cơ quan |
| crimeRecordAgency | string | Tên đơn vị xử lý vi phạm |
| crimeRecordAddressPIC | string | Địa chỉ đơn vị phát hiện vi phạm |
| crimeRecordAmendmentDate | string | Ngày sửa đổi bổ sung bản ghi (định dạng DD/MM/YYYY) |

## Bảng liệt kê trạng thái

### notifyType - Loại thông báo vi phạm

| Giá trị | Mô tả |
|---|---|
| 1 | Phát hiện xe có lỗi phạt nguội |
| 2 | Xe hiện không có lỗi vi phạm |
| 3 | Xe phát sinh lỗi phạt nguội mới |
| 4 | Xe có cập nhật mới - lỗi đã xử lý xong |

### crimeRecordStatus - Trạng thái xử lý vi phạm

| Giá trị | Mô tả |
|---|---|
| Chưa xử phạt | Vi phạm chưa được xử phạt |
| Đã xử phạt | Vi phạm đã được xử phạt |
| Không vi phạm | Dữ liệu không phải vi phạm thực tế |
| Lỗi tra cứu | Có lỗi xảy ra khi tra cứu vi phạm |

### customerRecordPlateColor - Màu biển số

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
