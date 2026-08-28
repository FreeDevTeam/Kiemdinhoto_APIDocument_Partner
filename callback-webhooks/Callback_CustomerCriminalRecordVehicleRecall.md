# Callback / Webhooks - Thông báo Triệu hồi xe cơ giới

> **⚠️ QUAN TRỌNG:** Tất cả các callback POST từ hệ thống đến đối tác đều bắt buộc phải được xác thực. Vui lòng tham khảo hướng dẫn cấu hình và verify signature tại: [Hướng dẫn xác thực Webhook Callback](./Webhook_Authentication.md).

Mô tả dữ liệu mà đối tác nhận được khi hệ thống gửi callback thông báo **triệu hồi xe cơ giới** (webhook type `301 - VEHICLE_RECALL_CALLBACK`).

## Phạm vi dữ liệu

Chỉ truy cập những dữ liệu triệu hồi/vi phạm được ghi nhận cho phương tiện mà đối tác có liên quan.

## Cấu trúc payload callback

```json
{
    "customerData": {
        "customerIdentifier": "0382716917"
    },
    "vehicleData": {
        "vehicleIdentity": "30A84812",
        "vehiclePlateColor": "WHITE",
        "vehicleType": 1,
        "chassisNumber": "RLHJC3608KY000123"
    },
    "serviceData": {
        "appUserVehicleNotifyInfoId": 1,
        "notifyStartDateTime": "2026-06-19T17:00:00.000Z",
        "notifyEndDateTime": "2026-07-20T16:59:59.000Z",
        "allowRenew": 1,
        "partnerRequestId": "1781585503732"
    },
    "callbackData": {
        "warningType": 2,
        "fineStatus": 1,
        "refreshDate": "16/06/2026",
        "criminalRecords": [
            {
                "customerCriminalRecordId": "0382716917100001",
                "customerRecordPlatenumber": "30A84812",
                "vehicleType": 1,
                "customerRecordPlateColor": "WHITE",
                "customerRecordPlateColorDesc": "Nền màu trắng, chữ và số màu đen",
                "crimeRecordContent": "Xe thuộc diện triệu hồi để khắc phục lỗi kỹ thuật theo thông báo của nhà sản xuất",
                "crimeRecordStatus": "Chưa xử phạt",
                "crimeRecordTime": "2026-06-10 08:15:00",
                "crimeRecordPIC": "Cục Đăng kiểm Việt Nam",
                "crimeRecordAddressPIC": "18 Phạm Hùng, Mỹ Đình 2, Nam Từ Liêm, Hà Nội",
                "crimeRecordLocation": "Toàn quốc",
                "crimeRecordContact": "024.37684715",
                "crimeRecordAgency": "Cục Đăng kiểm Việt Nam",
                "crimeRecordAmendmentDate": "10/06/2026",
                "violationPenalties": ["Bắt buộc đưa xe đến đại lý/xưởng dịch vụ ủy quyền để khắc phục lỗi"],
                "violationPenaltyDetail": "Khắc phục lỗi hệ thống phanh ABS theo chương trình triệu hồi của nhà sản xuất, không phát sinh chi phí cho chủ xe"
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
| callbackData | Dữ liệu kết quả tra cứu triệu hồi |

### customerData

| Field | Type | Mô tả |
|---|---|---|
| customerIdentifier | string | Định danh khách hàng (Số điện thoại hoặc userId, đã loại bỏ prefix riêng của đối tác) |

### vehicleData

| Field | Type | Mô tả |
|---|---|---|
| vehicleIdentity | string | Biển số xe |
| vehiclePlateColor | string | Màu biển số xe. Mặc định `WHITE` nếu không có dữ liệu (Xem bảng liệt kê trạng thái bên dưới) |
| vehicleType | number | Loại phương tiện. Mặc định `1` (Ô tô) nếu không có dữ liệu (Xem bảng liệt kê trạng thái bên dưới) |
| chassisNumber | string | Số khung xe bị triệu hồi |

### serviceData

| Field | Type | Mô tả |
|---|---|---|
| appUserVehicleNotifyInfoId | number | ID gói dịch vụ thông báo tự động |
| notifyStartDateTime | string (ISO 8601) | Ngày kích hoạt dịch vụ |
| notifyEndDateTime | string (ISO 8601) | Ngày kết thúc dịch vụ |
| allowRenew | number | Cho phép gia hạn tự động (1 = có, 0 = không) |
| partnerRequestId | string | ID do đối tác cung cấp khi đăng ký dịch vụ |

### callbackData

| Field | Type | Mô tả |
|---|---|---|
| warningType | number | Loại cảnh báo. Với webhook triệu hồi xe, giá trị luôn là `2` (Xem bảng liệt kê trạng thái bên dưới) |
| fineStatus | number | Trạng thái có bản ghi triệu hồi/vi phạm hay không (1 = có, 0 = không) |
| refreshDate | string | Ngày hệ thống tạo callback (định dạng DD/MM/YYYY) |
| criminalRecords | array | Danh sách các bản ghi triệu hồi/vi phạm liên quan (chi tiết bên dưới) |

### Chi tiết bản ghi (trong criminalRecords)

| Field | Type | Mô tả |
|---|---|---|
| customerCriminalRecordId | string/number | Mã bản ghi. Nếu đối tác không phải `MYF88APP`, giá trị được ghép thêm `customerIdentifier` ở đầu để đảm bảo tính duy nhất theo khách hàng |
| customerRecordPlatenumber | string | Biển số xe liên quan bản ghi |
| customerRecordPlateColor | string | Màu biển số xe (Xem bảng liệt kê trạng thái bên dưới) |
| customerRecordPlateColorDesc | string | Mô tả màu biển số |
| vehicleType | number | Loại phương tiện (Xem bảng liệt kê trạng thái bên dưới) |
| crimeRecordContent | string | Nội dung triệu hồi/vi phạm |
| crimeRecordStatus | string | Trạng thái xử lý bản ghi. Chỉ nhận giá trị `Chưa xử phạt` hoặc `Đã xử phạt` (Xem bảng liệt kê trạng thái bên dưới) |
| crimeRecordTime | datetime | Thời gian phát hiện/ghi nhận |
| crimeRecordPIC | string | Cơ quan/đơn vị phát hiện |
| crimeRecordLocation | string | Địa điểm phát hiện |
| crimeRecordContact | string | Số điện thoại liên hệ của cơ quan |
| crimeRecordAgency | string | Tên đơn vị xử lý |
| crimeRecordAddressPIC | string | Địa chỉ đơn vị phát hiện |
| crimeRecordAmendmentDate | string | Ngày sửa đổi bổ sung bản ghi (định dạng DD/MM/YYYY) |
| violationPenalties | array | Danh sách hình thức xử lý áp dụng cho bản ghi triệu hồi (ví dụ: yêu cầu mang xe đến xưởng khắc phục) |
| violationPenaltyDetail | string | Mô tả chi tiết nội dung khắc phục/xử lý |

> **Lưu ý:** Callback chỉ bao gồm những bản ghi có `crimeRecordStatus` hợp lệ (`Chưa xử phạt`/`Đã xử phạt`). Các bản ghi không thỏa điều kiện sẽ bị loại bỏ trước khi gửi cho đối tác. Các trường nội bộ (id nội bộ, appUserId, ghi chú nội bộ, ngày crawl, staffId, cờ xóa mềm...) không bao giờ được trả ra callback.

## Bảng liệt kê trạng thái

### warningType - Loại cảnh báo

| Giá trị | Mô tả |
|---|---|
| 2 | Cảnh báo triệu hồi xe cơ giới (Vehicle Recall) |

### crimeRecordStatus - Trạng thái xử lý bản ghi

| Giá trị | Mô tả |
|---|---|
| Chưa xử phạt | Bản ghi/triệu hồi chưa được xử lý |
| Đã xử phạt | Bản ghi/triệu hồi đã được xử lý |

### customerRecordPlateColor / vehiclePlateColor - Màu biển số

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
| 30 | Xe máy |
| 40 | Xe điện |