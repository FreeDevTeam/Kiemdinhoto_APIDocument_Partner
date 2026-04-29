# Partner API - Order Query Transaction Batch

## 1. Tổng quan

API truy vấn trạng thái giao dịch thanh toán theo lô.

- Endpoint: /PartnerAPI/Order/queryTransactionBatch
- Method: POST
- Auth: header clientId/clientid + apiKey/apikey
- Batch size: 1..100 item

## 2. Request

### 2.1 Header

| Field | Type | Required | Note |
|---|---|---|---|
| clientId | string | Yes | Hỗ trợ cả clientid |
| apiKey | string | Yes | Hỗ trợ cả apikey |

### 2.2 Body schema

| Field | Type | Required | Rule |
|---|---|---|---|
| items | array | Yes | min 1, max 100 |
| items[].requestId | string | No | optional |
| items[].transactionId | string | No | optional |
| items[].orderId | string | Yes | bắt buộc |
| items[].amount | integer | Yes | >= 1 |

### 2.3 cURL Happy case

```bash
curl --location '{HOST_NAME}/PartnerAPI/Order/queryTransactionBatch' \
  --header 'Content-Type: application/json' \
  --header 'clientId: TESTCLIENT' \
  --header 'apiKey: 07e73e61-0dce-4b39-8ecf-06ef70b35c08' \
  --data '{
    "items": [
      {
        "requestId": "TEST_REQ_QUERY_TRANSACTION_001",
        "transactionId": "TEST_TXN_QUERY_OK_001",
        "orderId": "TEST_ORDER_PARTNER_PENDING_001",
        "amount": 91000
      }
    ]
  }'
```

## 3. Response

### 3.1 Success response

```json
{
  "statusCode": 200,
  "error": null,
  "message": "Success",
  "data": [
    {
      "index": 0,
      "orderId": "TEST_ORDER_PARTNER_PENDING_001",
      "amount": 91000,
      "transactionStatus": "New",
      "updatedAt": "2026-04-29T08:00:00.000Z"
    }
  ]
}
```

### 3.2 Business errors thường gặp

| Error | Ý nghĩa |
|---|---|
| ORDER_NOT_FOUND | Không tìm thấy order theo orderId hoặc paymentQRRef |
| AMOUNT_MISMATCH | amount request không khớp totalAmount của order |
| INVALID_BATCH_PAYLOAD | payload items không hợp lệ |
| UNKNOWN_ERROR | lỗi nội bộ không xác định |

## 4. Data test cho developer

Nguồn data đang cố định trong test e2e tại API/Order/test/OrderTest_Partner_Data.js:

- clientId: TESTCLIENT
- apiKey: 07e73e61-0dce-4b39-8ecf-06ef70b35c08
- requestId: TEST_REQ_QUERY_TRANSACTION_001
- transactionId: TEST_TXN_QUERY_OK_001
- orderId happy: TEST_ORDER_PARTNER_PENDING_001
- amount happy: 91000

Cần thay bằng dữ liệu riêng theo môi trường khi tích hợp thật.

## 5. Tham chiếu code

- Route: API/Order/route/OrderRoute_Partner.js
- Route mount: API/PartnerAPI/route/index.js
- Manager: API/Order/manager/OrderManager_Partner.js
- Error constants: API/Order/OrderConstant_Partner.js
