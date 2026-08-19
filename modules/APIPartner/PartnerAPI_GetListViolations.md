# Partner API - Get List Violations

Tài liệu API dành cho Partner - Lấy danh sách các hành vi/lỗi vi phạm giao thông và khung xử phạt tương ứng.

[Về module API Partner](./index.html)

---

## Endpoint

|        |                                                           |
| ------ | --------------------------------------------------------- |
| URL    | /PartnerAPI/CustomerCriminalRecord/user/getListViolations |
| Method | POST                                                      |

---

## Headers schema

| Header                 | Required | Mô tả                         |
| ---------------------- | -------- | ----------------------------- |
| clientId hoặc clientid | Yes      | Mã định danh đối tác          |
| apiKey hoặc apikey     | Yes      | Khóa xác thực API của đối tác |

---

## Body schema

| Field              | Type   | Required | Rule                                                               | Mô tả                                                                                      |
| ------------------ | ------ | -------- | ------------------------------------------------------------------ | ------------------------------------------------------------------------------------------ |
| filter             | object | No       | allow null, default: `{}`                                          | Bộ điều kiện lọc danh sách lỗi vi phạm.                                                    |
| filter.vehicleType | number | No       | xem [Enum Loại phương tiện](#1-enum-loai-phuong-tien-filtervehicletype) | Phân loại phương tiện giao thông (1: Ô tô, 30: Xe máy, 40: Xe điện).                       |
| searchText         | string | No       | allow "", null                                                     | Từ khóa tìm kiếm theo nội dung lỗi vi phạm (`crimeRecordContent`).                         |
| skip               | number | No       | default 0, min 0                                                   | Số bản ghi bỏ qua (phân trang).                                                            |
| limit              | number | No       | default 20, max 100                                                | Số bản ghi tối đa trả về trên mỗi trang (phân trang).                                      |

---

## Danh sách Enum & Giá trị tham chiếu (Input / Output)

### 1. Enum Loại phương tiện (`filter.vehicleType`)

| Giá trị (`vehicleType`) | Phân loại phương tiện |
| ----------------------- | --------------------- |
| `1`                     | Ô tô                  |
| `30`                    | Xe máy                |
| `40`                    | Xe điện               |

---

## Sample Request

```bash
curl --location 'http://localhost:4001/PartnerAPI/CustomerCriminalRecord/user/getListViolations' \
  --header 'apiKey: 07e73e61-0dce-4b39-8ecf-06ef70b35c08' \
  --header 'clientId: TESTCLIENT' \
  --header 'Content-Type: application/json' \
  --data '{
  "filter": {
    "vehicleType": 1
  },
  "searchText": "quá tốc độ",
  "skip": 0,
  "limit": 20
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
        "crimeRecordContent": "Điều khiển xe chạy quá tốc độ quy định từ 05 km/h đến dưới 10 km/h",
        "vehicleType": 1,
        "violationPenalties": [
          "Khung phạt: 800.000–1.000.000 VNĐ",
          "Trừ điểm GPLX: 0"
        ],
        "violationPenaltyDetail": {
          "fineMin": 800000,
          "fineMax": 1000000,
          "pointDeduction": 0,
          "licenseSuspension": false,
          "suspensionMinMonth": null,
          "suspensionMaxMonth": null
        }
      },
      {
        "crimeRecordContent": "Điều khiển xe chạy quá tốc độ quy định trên 20 km/h đến 35 km/h",
        "vehicleType": 1,
        "violationPenalties": [
          "Khung phạt: 6.000.000–8.000.000 VNĐ",
          "Trừ điểm GPLX: 2",
          "Tước bằng: 2–4 tháng"
        ],
        "violationPenaltyDetail": {
          "fineMin": 6000000,
          "fineMax": 8000000,
          "pointDeduction": 2,
          "licenseSuspension": true,
          "suspensionMinMonth": 2,
          "suspensionMaxMonth": 4
        }
      }
    ],
    "total": 128
  }
}
```

### Chi tiết các trường dữ liệu trả về

| Field | Type | Mô tả |
| ----- | ---- | ----- |
| `data.data` | array | Danh sách các lỗi vi phạm giao thông |
| `data.data[].crimeRecordContent` | string | Nội dung hành vi vi phạm giao thông |
| `data.data[].vehicleType` | number | Loại phương tiện vi phạm (xem [Enum Loại phương tiện](#1-enum-loai-phuong-tien-filtervehicletype)) |
| `data.data[].violationPenalties` | array of string | Danh sách các mô tả tóm tắt về mức phạt và hình thức xử phạt bổ sung |
| `data.data[].violationPenaltyDetail` | object \| null | Chi tiết khung xử phạt theo quy định pháp luật (nếu map được) |
| `data.data[].violationPenaltyDetail.fineMin` | number | Mức phạt tiền tối thiểu (VNĐ) |
| `data.data[].violationPenaltyDetail.fineMax` | number | Mức phạt tiền tối đa (VNĐ) |
| `data.data[].violationPenaltyDetail.pointDeduction` | number | Số điểm giấy phép lái xe bị trừ |
| `data.data[].violationPenaltyDetail.licenseSuspension` | boolean | Có áp dụng hình thức tước quyền sử dụng GPLX hay không |
| `data.data[].violationPenaltyDetail.suspensionMinMonth` | number \| null | Thời gian tước giấy phép lái xe tối thiểu (tháng) |
| `data.data[].violationPenaltyDetail.suspensionMaxMonth` | number \| null | Thời gian tước giấy phép lái xe tối đa (tháng) |
| `data.total` | number | Tổng số bản ghi thỏa điều kiện lọc |

---

## Mã lỗi

| HTTP | Mã lỗi             | Mô tả                                                 |
| ---- | ------------------ | ----------------------------------------------------- |
| 400  | _Validation Error_ | Payload không đúng schema hoặc sai định dạng dữ liệu. |
| 429  | `QUOTA_EXCEEDED`   | apiKey không hợp lệ hoặc vượt quota.                  |
| 500  | `UNKNOWN_ERROR`    | Lỗi hệ thống không xác định.                          |

---

## Tham khảo

- [Quy chuẩn chung -> Common Error](../../Common.html#common-error)

---

## Data test cho developer

- clientId: TESTCLIENT
- apiKey: 07e73e61-0dce-4b39-8ecf-06ef70b35c08

Cần thay bằng dữ liệu môi trường thật khi tích hợp.
