# Partner API - Get List Criminal Record Hotspot

Tài liệu API dành cho Partner - Lấy danh sách điểm nóng vi phạm giao thông.

[Về module API Partner](./index.html)

---

## Endpoint

|        |                                          |
| ------ | ---------------------------------------- |
| URL    | /PartnerAPI/CriminalRecordHotspot/getList |
| Method | POST                                     |

---

## Headers schema

| Header                 | Required | Mô tả                         |
| ---------------------- | -------- | ----------------------------- |
| clientId hoặc clientid | Yes      | Mã định danh đối tác          |
| apiKey hoặc apikey     | Yes      | Khóa xác thực API của đối tác |

---

## Body schema

| Field           | Type   | Required | Rule                       | Mô tả                                                                   |
| --------------- | ------ | -------- | -------------------------- | ----------------------------------------------------------------------- |
| filter          | object | Yes      | Default: `{}`              | Bộ điều kiện lọc danh sách điểm nóng. Không được null, truyền `{}` nếu không lọc. |
| filter.city     | string | No       | xem [Enum Tỉnh/Thành phố](#1-enum-tinh--thanh-pho-filtercity) | Tỉnh / Thành phố cần lọc (ví dụ `"Hà Nội"`, `"Hồ Chí Minh"`, `"ALL"` hoặc bỏ trống cho toàn quốc). |
| filter.district | string | No       | -                          | Quận / Huyện cần lọc.                                                   |
| startDate       | string | No       | allow "", null             | Thời gian bắt đầu lọc vi phạm (ISO String / YYYY-MM-DD).                |
| endDate         | string | No       | allow "", null             | Thời gian kết thúc lọc vi phạm (ISO String / YYYY-MM-DD).               |
| searchText      | string | No       | allow "", null             | Từ khóa tìm kiếm theo tên địa điểm / tuyến đường.                      |
| skip            | number | No       | default 0, min 0           | Số bản ghi bỏ qua (phân trang).                                         |
| limit           | number | No       | default 20, max 9999999    | Số bản ghi tối đa trả về (phân trang).                                  |
| order           | object | No       | allow null                 | Cấu hình sắp xếp kết quả.                                              |
| order.key       | string | No       | xem [Enum Order Key](#2-enum-truong-sap-xep-orderkey) | Trường sắp xếp (`totalViolation`, `lastViolationTime`).                 |
| order.value     | string | No       | xem [Enum Order Value](#3-enum-huong-sap-xep-ordervalue) | Hướng sắp xếp (`desc` hoặc `asc`).                                      |

---

## Danh sách Enum & Giá trị tham chiếu (Input / Output)

### 1. Enum Tỉnh / Thành phố (`filter.city`)
Trường `filter.city` nhận Tên Tỉnh / Thành phố, hoặc `"ALL"` / bỏ trống để lấy danh sách toàn quốc (sắp xếp theo thứ tự bảng chữ cái):

| Giá trị (`filter.city`) | Tên Tỉnh / Thành phố |
| ----------------------- | -------------------- |
| `ALL` | Toàn quốc (Mặc định) |
| `An Giang` | An Giang |
| `Bà Rịa Vũng Tàu` | Bà Rịa - Vũng Tàu |
| `Bắc Giang` | Bắc Giang |
| `Bắc Kạn` | Bắc Kạn |
| `Bắc Ninh` | Bắc Ninh |
| `Bạc Liêu` | Bạc Liêu |
| `Bến Tre` | Bến Tre |
| `Bình Định` | Bình Định |
| `Bình Dương` | Bình Dương |
| `Bình Phước` | Bình Phước |
| `Bình Thuận` | Bình Thuận |
| `Cà Mau` | Cà Mau |
| `Cần Thơ` | Cần Thơ |
| `Cao Bằng` | Cao Bằng |
| `Đà Nẵng` | Đà Nẵng |
| `Đắk Lắk` | Đắk Lắk |
| `Đắk Nông` | Đắk Nông |
| `Điện Biên` | Điện Biên |
| `Đồng Nai` | Đồng Nai |
| `Đồng Tháp` | Đồng Tháp |
| `Gia Lai` | Gia Lai |
| `Hà Giang` | Hà Giang |
| `Hà Nam` | Hà Nam |
| `Hà Nội` | Hà Nội |
| `Hà Tĩnh` | Hà Tĩnh |
| `Hải Dương` | Hải Dương |
| `Hải Phòng` | Hải Phòng |
| `Hậu Giang` | Hậu Giang |
| `Hồ Chí Minh` | Thành phố Hồ Chí Minh |
| `Hòa Bình` | Hòa Bình |
| `Hưng Yên` | Hưng Yên |
| `Khánh Hòa` | Khánh Hòa |
| `Kiên Giang` | Kiên Giang |
| `Kon Tum` | Kon Tum |
| `Lai Châu` | Lai Châu |
| `Lâm Đồng` | Lâm Đồng |
| `Lạng Sơn` | Lạng Sơn |
| `Lào Cai` | Lào Cai |
| `Long An` | Long An |
| `Nam Định` | Nam Định |
| `Nghệ An` | Nghệ An |
| `Ninh Bình` | Ninh Bình |
| `Ninh Thuận` | Ninh Thuận |
| `Phú Thọ` | Phú Thọ |
| `Phú Yên` | Phú Yên |
| `Quảng Bình` | Quảng Bình |
| `Quảng Nam` | Quảng Nam |
| `Quảng Ngãi` | Quảng Ngãi |
| `Quảng Ninh` | Quảng Ninh |
| `Quảng Trị` | Quảng Trị |
| `Sóc Trăng` | Sóc Trăng |
| `Sơn La` | Sơn La |
| `Tây Ninh` | Tây Ninh |
| `Thái Bình` | Thái Bình |
| `Thái Nguyên` | Thái Nguyên |
| `Thanh Hóa` | Thanh Hóa |
| `Thừa Thiên - Huế` | Thừa Thiên Huế |
| `Tiền Giang` | Tiền Giang |
| `Trà Vinh` | Trà Vinh |
| `Tuyên Quang` | Tuyên Quang |
| `Vĩnh Long` | Vĩnh Long |
| `Vĩnh Phúc` | Vĩnh Phúc |
| `Yên Bái` | Yên Bái |

### 2. Enum Trường Sắp Xếp (`order.key`)

| Key | Mô tả |
| --- | ----- |
| `totalViolation` | Sắp xếp theo tổng số lượt vi phạm tại điểm nóng (Mặc định). |
| `lastViolationTime` | Sắp xếp theo thời gian vi phạm mới nhất được ghi nhận. |

### 3. Enum Hướng Sắp Xếp (`order.value`)

| Value | Mô tả |
| ----- | ----- |
| `desc` | Giảm dần (Mặc định). |
| `asc` | Tăng dần. |

### 4. Enum Mức Độ Nghiêm Trọng (`severityLevel` - Trả về trong Response)

| Severity Level | Điều kiện phân loại |
| -------------- | ------------------- |
| `High` | Nghiêm trọng cao (Tổng số lượt vi phạm ≥ 160). |
| `Medium` | Nghiêm trọng trung bình (Tổng số lượt vi phạm từ 80 đến 159). |
| `Low` | Nghiêm trọng thấp (Tổng số lượt vi phạm < 80). |

---

## Sample Request

```bash
curl --location 'http://localhost:4001/PartnerAPI/CriminalRecordHotspot/getList' \
  --header 'apiKey: 0177253f-b5a1-48c4-a3ae-1d9deec6dd26' \
  --header 'Content-Type: application/json' \
  --data '{
  "filter": {},
  "skip": 0,
  "limit": 2
}'
```

---

## Success response

```json
{
    "statusCode": 200,
    "error": null,
    "message": "Success",
    "data": {
        "data": [
            {
                "locationText": "Km1716+005, Quốc lộ 1A - Bình Thuận",
                "addressClean": "Quốc lộ 13, Phường 26, 72300, Binh Thanh, Thành phố Hồ Chí Minh, Việt Nam",
                "city": "Hồ Chí Minh",
                "district": "Binh Thanh",
                "latitude": 10.814479,
                "longitude": 106.712814,
                "totalViolation": 192,
                "severityLevel": "High",
                "commonViolations": "16824.6.3.a.01.Điều khiển xe chạy quá tốc độ quy định từ 05 km/h đến dưới 10 km/h\n16824.6.6.a.01.Điều khiển xe chạy quá tốc độ quy định trên 20 km/h đến 35 km/h\n16824.6.5.đ.01.Điều khiển xe chạy quá tốc độ quy định từ 10 km/h đến 20 km/h\n12321.5.3.a.01.Điều khiển xe chạy quá tốc độ quy định từ 05 km/h đến dưới 10 km/h\n12321.5.5.i.01.Điều khiển xe chạy quá tốc độ quy định từ 10 km/h đến 20 km/h\n10019.5.3.a.01.Điều khiển xe chạy quá tốc độ quy định từ 05 km/h đến dưới 10 km/h\n12321.5.6.a.01.Điều khiển xe chạy quá tốc độ quy định trên 20 km/h đến 35 km/h\n10019.5.5.i.01.Điều khiển xe chạy quá tốc độ quy định từ 10 km/h đến 20 km/h",
                "violationPlateNumbers": "[\"51H*****\",\"51H*****\",\"51G*****\",\"51H*****\",\"61K*****\",\"61K*****\",\"95A*****\",\"61K*****\",\"64A*****\",\"51K*****\",\"51G*****\",\"50H*****\",\"72H*****\",\"51A*****\",\"60A*****\",\"86A*****\",\"51K*****\",\"30E*****\",\"61A*****\",\"51H*****\",\"50H*****\",\"51H*****\",\"52Z****\",\"51K*****\",\"51K*****\",\"51F*****\",\"51H*****\",\"60A*****\",\"51H*****\",\"51K*****\",\"51H*****\",\"60K*****\",\"51K*****\",\"51H*****\",\"51H*****\",\"51G*****\",\"61A*****\",\"94A*****\",\"60A*****\",\"51G*****\",\"51A*****\",\"51L*****\",\"51H*****\",\"65A*****\",\"51K*****\",\"60A*****\",\"65A*****\",\"60K*****\",\"51G*****\",\"70A*****\",\"51A*****\",\"51L*****\",\"72A*****\",\"86C*****\",\"51H*****\",\"51K*****\",\"51H*****\",\"51K*****\",\"51H*****\",\"51H*****\",\"50H*****\",\"51G*****\",\"84A*****\",\"51K*****\",\"51A*****\",\"51D*****\",\"51K*****\",\"60K*****\",\"72A*****\",\"51G*****\",\"51K*****\",\"75A*****\",\"86C*****\",\"86C*****\",\"77A*****\",\"86H****\",\"51G*****\",\"51K*****\",\"51H*****\",\"51A*****\",\"51H*****\",\"51H*****\",\"60K*****\",\"51A*****\",\"51K*****\",\"51K*****\",\"86A*****\",\"51D*****\",\"51H*****\",\"64A*****\",\"29H*****\",\"60A*****\",\"61D*****\",\"61H*****\",\"66A*****\",\"51K*****\",\"86A*****\",\"29A*****\",\"51K*****\",\"51L*****\",\"51H*****\",\"51A*****\",\"50E*****\",\"51G*****\",\"51K*****\",\"51F*****\",\"60P****\",\"72A*****\",\"51F*****\",\"51H*****\",\"60V****\",\"51F*****\",\"51H*****\",\"60A*****\",\"51K*****\",\"51G*****\",\"51G*****\",\"51H*****\",\"51G*****\",\"51D*****\",\"51K*****\",\"51H*****\",\"49A*****\",\"51F*****\",\"51K*****\",\"51K*****\",\"51H*****\",\"51H*****\",\"51F*****\",\"60A*****\",\"51F*****\",\"61N****\",\"63A*****\",\"51A*****\",\"51H*****\",\"61A*****\",\"61K*****\",\"76E*****\",\"49A*****\",\"51H*****\",\"51C*****\",\"51K*****\",\"60K*****\",\"51K*****\",\"51F*****\",\"86C*****\",\"51F*****\",\"51A*****\",\"51D*****\",\"51G*****\",\"49A*****\",\"51H*****\",\"51K*****\",\"66A*****\",\"70A*****\",\"51H*****\",\"71A*****\",\"51F*****\",\"86C*****\",\"51A*****\",\"51F*****\",\"51H*****\",\"51G*****\",\"51F*****\",\"86A*****\",\"51K*****\",\"52Z****\",\"86A*****\",\"51A*****\",\"51K*****\",\"60A*****\",\"51G*****\",\"51G*****\",\"51H*****\",\"47A*****\",\"61A*****\",\"77A*****\",\"51G*****\",\"60C*****\",\"51K*****\"]",
                "lastViolationTime": "2025-09-12T22:07:00.000Z"
            },
            {
                "locationText": "Nguyễn Công Hoan - Hoa Hồng, Phường 2, Quận Phú Nhuận, Thành phố Hồ Chí Minh",
                "addressClean": "Nguyễn Công Hoan, Phường 7, 72200, Cau Kieu, Thành phố Hồ Chí Minh, Việt Nam",
                "city": "Hồ Chí Minh",
                "district": "Cau Kieu",
                "latitude": 10.79968,
                "longitude": 106.690338,
                "totalViolation": 120,
                "severityLevel": "Medium",
                "commonViolations": "12321.5.3.e.03.Đỗ xe không sát theo hè phố phía bên phải theo chiều đi\n12321.5.3.e.02.Đỗ xe không sát theo lề đường phía bên phải theo chiều đi\n12321.5.3.đ.04.Đỗ xe tại vị trí nơi đường bộ giao nhau",
                "violationPlateNumbers": "[\"51F*****\",\"49A*****\",\"51H*****\"]",
                "lastViolationTime": "2024-07-20T06:34:00.000Z"
            }
        ],
        "total": 1556
    }
}
```

### Chi tiết các trường dữ liệu trả về

| Field | Type | Mô tả |
| ----- | ---- | ----- |
| `data.data` | array | Danh sách các điểm nóng vi phạm |
| `data.data[].locationText` | string | Vị trí / tên địa điểm ghi nhận vi phạm ban đầu |
| `data.data[].addressClean` | string | Địa chỉ đầy đủ đã chuẩn hóa qua hệ thống Geocoding |
| `data.data[].city` | string | Tỉnh / Thành phố |
| `data.data[].district` | string | Quận / Huyện |
| `data.data[].latitude` | number | Vĩ độ tọa độ địa lý |
| `data.data[].longitude` | number | Kinh độ tọa độ địa lý |
| `data.data[].totalViolation` | number | Tổng số lượt vi phạm ghi nhận tại điểm nóng |
| `data.data[].severityLevel` | string | Mức độ nghiêm trọng của điểm nóng (xem [Enum Severity Level](#4-enum-muc-do-nghiem-trong-severitylevel---tra-ve-trong-response)) |
| `data.data[].commonViolations` | string | Danh sách các lỗi vi phạm phổ biến (phân cách bởi ký tự xuống dòng `\n`) |
| `data.data[].violationPlateNumbers` | string (JSON) | Chuỗi JSON chứa danh sách biển số xe vi phạm đã được che mờ thông tin |
| `data.data[].lastViolationTime` | string (ISO Date) | Thời gian vi phạm gần nhất được ghi nhận tại điểm nóng |
| `data.total` | number | Tổng số điểm nóng thỏa mãn điều kiện lọc |

---

## Mã lỗi

| HTTP | Mã lỗi             | Mô tả                                |
| ---- | ------------------ | ------------------------------------ |
| 400  | _Validation Error_ | Payload không đúng schema.           |
| 429  | `QUOTA_EXCEEDED`   | apiKey không hợp lệ hoặc vượt quota. |
| 500  | `UNKNOWN_ERROR`    | Lỗi không xác định.                  |

---

## Tham khảo

- [Quy chuẩn chung -> Common Error](../../Common.html#common-error)

---

## Data test cho developer

- clientId: TESTCLIENT
- apiKey: 07e73e61-0dce-4b39-8ecf-06ef70b35c08

Cần thay bằng dữ liệu môi trường thật khi tích hợp.
