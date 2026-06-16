Chỉnh sửa tài liệu Callback_ThongTinDangKiem.html

Chỉnh sửa payload callback sang format sau:
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

appUserVehicleNotifyInfoId là ID dịch vụ (ID gói dịch vụ thông báo vi phạm tự động,...)
notifyStartDateTime: ngày kích hoạt dịch vụ
notifyEndDateTime: ngày kết thúc dịch vụ
partnerRequestId: ID đối tác yêu cầu đăng ký dịch vụ lúc đầu