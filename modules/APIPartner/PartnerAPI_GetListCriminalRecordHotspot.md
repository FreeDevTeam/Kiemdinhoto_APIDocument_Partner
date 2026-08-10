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
| authorization          | No       | Token xác thực JWT (nếu có)   |

---

## Body schema

| Field           | Type   | Required | Rule                       | Mô tả                                                                   |
| --------------- | ------ | -------- | -------------------------- | ----------------------------------------------------------------------- |
| filter          | object | No       | allow null                 | Bộ điều kiện lọc danh sách điểm nóng.                                   |
| filter.city     | string | No       | -                          | Tỉnh / Thành phố cần lọc (ví dụ `"Hà Nội"`, `"ALL"` hoặc bỏ trống cho toàn quốc). |
| filter.district | string | No       | -                          | Quận / Huyện cần lọc.                                                   |
| startDate       | string | No       | allow "", null             | Thời gian bắt đầu lọc vi phạm.                                          |
| endDate         | string | No       | allow "", null             | Thời gian kết thúc lọc vi phạm.                                         |
| searchText      | string | No       | allow "", null             | Từ khóa tìm kiếm theo tên địa điểm / tuyến đường.                      |
| skip            | number | No       | default 0, min 0           | Số bản ghi bỏ qua (phân trang).                                         |
| limit           | number | No       | default 20, max 9999999    | Số bản ghi tối đa trả về (phân trang).                                  |
| order           | object | No       | allow null                 | Cấu hình sắp xếp kết quả.                                              |
| order.key       | string | No       | example `lastViolationTime`| Trường sắp xếp (vd: `lastViolationTime`, `totalViolation`).             |
| order.value     | string | No       | example `desc`             | Hướng sắp xếp (`asc` hoặc `desc`).                                      |

---

## Sample Request

```bash
curl --location '{HOST_NAME}/PartnerAPI/CriminalRecordHotspot/getList' \
  --header 'Content-Type: application/json' \
  --header 'clientId: TESTCLIENT' \
  --header 'apiKey: 07e73e61-0dce-4b39-8ecf-06ef70b35c08' \
  --data '{
    "filter": {
      "city": "Hà Nội"
    },
    "skip": 0,
    "limit": 20,
    "order": {
      "key": "totalViolation",
      "value": "desc"
    }
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
        "locationText": "Ngã tư Hàng Bài - Lý Thường Kiệt, Hoàn Kiếm, Hà Nội",
        "addressClean": "Ngã tư Hàng Bài - Lý Thường Kiệt, Hoàn Kiếm, Hà Nội, Việt Nam",
        "city": "Hà Nội",
        "district": "Quận Hoàn Kiếm",
        "latitude": 21.0254,
        "longitude": 105.8523,
        "totalViolation": 125,
        "severityLevel": "High",
        "commonViolations": "Không chấp hành hiệu lệnh của đèn tín hiệu giao thông\nĐi sai làn đường",
        "violationPlateNumbers": "[\"29A***\",\"30F***\"]",
        "lastViolationTime": "2024-05-20T10:30:00.000Z"
      }
    ],
    "total": 1
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
| `data.data[].severityLevel` | string | Mức độ nghiêm trọng của điểm nóng (`High`, `Medium`, `Low`) |
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
