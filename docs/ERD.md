# PawCare ERD

This ERD covers the approved prototype scope: pet profiles, services, bookings, care process records, staff operations, status tracking, payments and invoices.

```mermaid
erDiagram
    CUSTOMERS ||--o{ PETS : owns
    CUSTOMERS ||--o{ BOOKINGS : creates
    PETS ||--o{ BOOKINGS : has
    STAFF ||--o{ BOOKINGS : handles
    STAFF ||--o{ STAFF_SHIFTS : works
    STAFF ||--o{ STAFF_SERVICE_SKILLS : has
    SERVICES ||--o{ STAFF_SERVICE_SKILLS : qualified_for
    BOOKINGS ||--o{ BOOKING_SERVICES : includes
    SERVICES ||--o{ BOOKING_SERVICES : selected_in
    BOOKINGS ||--o| CARE_RECORDS : has
    CARE_RECORDS ||--o{ CARE_SERVICE_RECORDS : tracks
    BOOKING_SERVICES ||--o{ CARE_SERVICE_RECORDS : performed_as
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

    STAFF_SHIFTS {
        int shift_id PK
        int staff_id FK
        date shift_date
        time start_time
        time end_time
        string status
        text note
    }

    STAFF_SKILLS {
        int skill_id PK
        string skill_name UK
        text description
        boolean is_active
    }

    STAFF_SERVICE_SKILLS {
        int staff_id PK, FK
        int service_id PK, FK
        string skill_level
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

    CARE_RECORDS {
        int care_record_id PK
        int booking_id FK, UK
        datetime intake_confirmed_at
        text initial_condition
        text abnormal_issue
        datetime initial_check_confirmed_at
        text care_notes
        text arising_issue
        text care_result
        datetime completed_at
        text aftercare_notes
        datetime handed_over_at
        datetime created_at
        datetime updated_at
    }

    CARE_SERVICE_RECORDS {
        int care_record_id PK, FK
        int booking_id FK
        int service_id PK, FK
        string status
        datetime started_at
        datetime completed_at
        text service_result
        text issue_notes
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

`bookings.status` supports the appointment tracking screen:

- `pending`: Awaiting confirmation
- `confirmed`: Confirmed
- `in_progress`: In progress
- `completed`: Completed
- `cancelled`: Cancelled

Runtime database and backend API are not included in the current prototype.
