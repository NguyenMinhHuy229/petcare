# PawCare ERD

ERD này chỉ mô tả phần prototype đã chốt: hồ sơ thú cưng, dịch vụ, đặt lịch, theo dõi trạng thái, thanh toán và hóa đơn.

```mermaid
erDiagram
    CUSTOMERS ||--o{ PETS : owns
    CUSTOMERS ||--o{ BOOKINGS : creates
    PETS ||--o{ BOOKINGS : has
    STAFF ||--o{ BOOKINGS : handles
    BOOKINGS ||--o{ BOOKING_SERVICES : includes
    SERVICES ||--o{ BOOKING_SERVICES : selected_in
    BOOKINGS ||--o| PAYMENTS : has
    BOOKINGS ||--o| INVOICES : generates

    CUSTOMERS {
        int customer_id PK
        string full_name
        string phone
        string email
        datetime created_at
    }

    PETS {
        int pet_id PK
        int customer_id FK
        string name
        string species
        string breed
        string gender
        date birth_date
        decimal weight_kg
        text care_notes
    }

    SERVICES {
        int service_id PK
        string service_name
        text description
        int duration_minutes
        int price_vnd
        boolean is_active
    }

    STAFF {
        int staff_id PK
        string full_name
        string role_name
        string phone
        boolean is_active
    }

    BOOKINGS {
        int booking_id PK
        string booking_code UK
        int customer_id FK
        int pet_id FK
        int staff_id FK
        datetime scheduled_start
        text note
        string status
        datetime created_at
    }

    BOOKING_SERVICES {
        int booking_id PK, FK
        int service_id PK, FK
        int quantity
        int unit_price_vnd
    }

    PAYMENTS {
        int payment_id PK
        int booking_id FK, UK
        int amount_vnd
        string method
        string status
        datetime paid_at
    }

    INVOICES {
        int invoice_id PK
        string invoice_code UK
        int booking_id FK, UK
        int total_amount_vnd
        datetime issued_at
    }
```

## Booking status

`bookings.status` phục vụ màn hình theo dõi lịch hẹn:

- `pending`: Chờ xác nhận
- `confirmed`: Đã xác nhận
- `in_progress`: Đang chăm sóc
- `completed`: Hoàn thành
- `cancelled`: Đã hủy

Database runtime và backend API chưa nằm trong prototype hiện tại.
