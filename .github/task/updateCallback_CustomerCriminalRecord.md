Chỉnh sửa tài liệu Callback_CustomerCriminalRecord.html

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

## 2. Bổ sung bảng mô tả các section trong payload

Thêm bảng mô tả 4 section cấp cao nhất vào phần "Dữ liệu callback", đặt phía trên bảng chi tiết field hiện có:

| Section | Mô tả |
|---|---|
| customerData | Thông tin định danh khách hàng |
| vehicleData | Thông tin phương tiện đăng ký dịch vụ |
| serviceData | Thông tin gói dịch vụ đang sử dụng |
| callbackData | Dữ liệu kết quả tra cứu vi phạm |

## 3. Bổ sung mô tả các field trong serviceData

Thêm bảng sau vào phần "Dữ liệu callback", sau bảng section ở trên:

**serviceData**

| Field | Type | Mô tả |
|---|---|---|
| appUserVehicleNotifyInfoId | number | ID gói dịch vụ thông báo vi phạm tự động |
| notifyStartDateTime | string (ISO 8601) | Ngày kích hoạt dịch vụ |
| notifyEndDateTime | string (ISO 8601) | Ngày kết thúc dịch vụ |
| allowRenew | number | Cho phép gia hạn tự động (1 = có, 0 = không) |
| partnerRequestId | string | ID do đối tác cung cấp khi đăng ký dịch vụ |