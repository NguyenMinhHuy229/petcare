# PawCare Pet Care Prototype

Prototype giao diện cho hệ thống quản lý dịch vụ chăm sóc thú cưng PawCare. Giao diện được chuẩn hóa từ Google Stitch export và chạy dưới dạng static HTML.

## Scope

### User flow

Prototype tập trung vào một user flow xuyên suốt:

```text
Quản lý thú cưng → Xem dịch vụ → Tạo lịch hẹn → Theo dõi lịch hẹn → Thanh toán & hóa đơn
```

Các màn hình chính:

- `pages/pets.html`: xem, thêm, xem chi tiết và chỉnh sửa hồ sơ thú cưng.
- `pages/services.html`: xem danh sách, chi tiết, giá và thời gian dịch vụ.
- `pages/booking.html`: chọn thú cưng, dịch vụ, nhân viên, ngày giờ và ghi chú.
- `pages/appointments.html`: theo dõi thông tin và trạng thái lịch hẹn.
- `pages/payments.html`: xem chi phí, chọn phương thức thanh toán và xem hóa đơn.

## Ngoài scope

Prototype chưa triển khai backend, authentication, payment gateway thật, realtime tracking, quản lý khách hàng chuyên sâu, quản lý nhân viên, chi nhánh, khuyến mãi, hồ sơ y tế, tiêm chủng, live chat, GPS hoặc analytics.

## Run locally

Từ thư mục gốc project:

```powershell
python -m http.server 8000
```

Mở màn hình bắt đầu:

```text
http://localhost:8000/pages/pets.html
```

Không nên mở trực tiếp bằng `file://` vì prototype sử dụng các đường dẫn tương đối giữa nhiều trang HTML.

## Cấu trúc thư mục

```text
pages/       Các màn hình HTML
scripts/     Navigation và script kiểm tra
assets/      Logo, ảnh và screenshot tham chiếu
docs/        Design system, XMind và ERD Mermaid
database/    Database schema SQL
```

## Database

Schema nằm tại [`database/schema.sql`](database/schema.sql). ERD Mermaid nằm tại [`docs/ERD.md`](docs/ERD.md).

Entity chính:

```text
Customer, Pet, Service, Staff, Booking,
BookingService, Payment, Invoice
```

`Booking.status` dùng để mô phỏng trạng thái lịch hẹn, không cần một hệ thống realtime riêng.

## Kiểm tra

Kiểm tra navigation:

```powershell
powershell -NoProfile -File .\scripts\verify-navigation.ps1
```

Kiểm tra scope, schema, ERD và README:

```powershell
powershell -NoProfile -File .\scripts\verify-project.ps1
```
