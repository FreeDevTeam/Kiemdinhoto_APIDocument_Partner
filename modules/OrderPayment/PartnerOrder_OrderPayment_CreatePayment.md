# Partner API - Order Payment - Create Payment

Tạo thông tin thanh toán cho lịch hẹn/đơn hàng ở trang thanh toán.

[Về module Order Payment](./index.html)

---

## Endpoint

| | |
|---|---|
| URL | /PartnerAPI/CustomerSchedule/user/createPayment |
| Method | POST |

---

## Headers schema

| Header | Required | Mô tả |
|---|---|---|
| apiKey hoặc apikey | Yes | Khóa xác thực API của đối tác |

---

## Body schema

| Field | Type | Required | Rule | Mô tả |
|---|---|---|---|---|
| customerScheduleId | number | Yes | > 0 | ID lịch hẹn |
| paymentMethodType | number | Yes | Giá trị trong danh sách payment type | Loại phương thức thanh toán |
| paymentMethodId | number | No | > 0 nếu truyền | ID phương thức thanh toán |
| paymentMethodSubType | string | No | Chuỗi định danh subtype | Sub-type thanh toán |
| stationServicesList | number[] | No | Mỗi phần tử > 0 | Danh sách dịch vụ trạm |
| stationsId | number | No | > 0 nếu truyền | ID trạm |

---

## Sample Request

```bash
curl --location 'https://ttdk-develop-server.service.makefamousapp.com/PartnerAPI/CustomerSchedule/user/createPayment' \
  --header 'Content-Type: application/json' \
  --header 'apiKey: demo_partner_api_key' \
  --data '{
    "customerScheduleId": 1869,
    "paymentMethodType": 2,
    "paymentMethodId": 1,
    "stationServicesList": [101]
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
    "customerScheduleId": 1869,
    "isSuccess": 1,
    "paymentStatus": "New",
    "totalPayment": 120000,
    "orderData": { "orderId": 99999 },
    "errorMessage": null,
    "errorCode": null,
    "inAppGtelOrderId": null,
    "paymentMethodId": 1,
    "paymentMethodType": 2,
    "paymentMethodSubType": null,
    "metaData": null,
    "bankQR": {
      "qrData": "https://.../qr.png",
      "qrCode": "000201...",
      "paymentContent": "ORDER99999"
    },
    "momoQR": null,
    "paymentLinkUrl": null,
    "paymentDeepLink": null,
    "paymentGatewayData": null
  }
}
```

---

## Mã lỗi

| HTTP | Mã lỗi | Mô tả |
|---|---|---|
| 400 | INVALID_REQUEST | Dữ liệu đầu vào không hợp lệ. |
| 401 | UNAUTHORIZED | apiKey không hợp lệ hoặc không có quyền truy cập. |
| 500 | UNKNOWN_ERROR | Lỗi hệ thống nội bộ. |

---

## Tham khảo

- [Danh sách mã lỗi và quy ước response chung](../../Common.html)

---

## Data test cho developer

- Host: `https://ttdk-develop-server.service.makefamousapp.com`
- apiKey test: `demo_partner_api_key`
- customerScheduleId: `1869`
