# UI, Data and Requirement Mapping

This table connects each approved requirement to the screen, database tables and analysis document that describe it.

| Requirement | Screen | Tables | Detailed analysis |
|---|---|---|---|
| View, add, detail and edit pet | `pages/pets.html` | `customers`, `pets` | `features/pet-profile.md` |
| View service name, detail, price and duration | `pages/services.html` | `services` | `features/service-catalog.md` |
| Select pet, service, staff, date, time and note | `pages/booking.html` | `pets`, `services`, `staff`, `bookings`, `booking_services` | `features/create-booking.md` |
| Review booking information and confirm | `pages/booking.html` | `bookings`, `booking_services` | `features/create-booking.md` |
| View current booking and status | `pages/appointments.html` | `bookings` | `features/appointment-tracking.md` |
| Review cost and choose payment method | `pages/payments.html` | `bookings`, `booking_services`, `payments` | `features/payment-and-invoice.md` |
| View payment status and invoice | `pages/payments.html` | `payments`, `invoices` | `features/payment-and-invoice.md` |

## Status mapping

| Database value | User-facing meaning | Appointment screen |
|---|---|---|
| `pending` | Awaiting confirmation | Pending |
| `confirmed` | Confirmed | Confirmed |
| `in_progress` | In service | In progress |
| `completed` | Completed | Completed |
| `cancelled` | Cancelled | Cancelled |

## Prototype-to-database note

The current HTML is static. The table mapping is a design contract: it identifies which database records would be read or written if a backend were added. It does not claim that the current browser prototype performs database operations.
