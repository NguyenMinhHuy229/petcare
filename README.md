# PawCare Pet Care Prototype

UI prototype for the PawCare pet care service management system. The interface was standardized from a Google Stitch export and runs as static HTML.

## Scope

### User flow

The prototype focuses on one end-to-end user flow:

```text
Manage pets → Browse services → Create booking → Track appointment → Payment & invoice
```

Main screens:

- `pages/pets.html`: browse, add, view and edit pet profiles.
- `pages/services.html`: browse services, details, prices and durations.
- `pages/booking.html`: choose a pet, service, staff member, date, time and note.
- `pages/appointments.html`: track appointment details and status.
- `pages/payments.html`: review costs, choose a payment method and view invoices.

## Out of scope

The prototype does not include a backend, authentication, real payment gateway, realtime tracking, advanced customer or staff management, branches, promotions, medical records, vaccination, live chat, GPS or analytics.

## Run locally

From the project root:

```powershell
python -m http.server 8000
```

Open the starting screen:

```text
http://localhost:8000/pages/pets.html
```

Do not open the files directly with `file://`; the prototype uses relative links between multiple HTML pages.

## Directory structure

```text
pages/       HTML screens
scripts/     Navigation and verification scripts
assets/      Logo, images and reference screenshots
docs/        Design system, XMind and Mermaid ERD
database/    SQL database schema
```

## Database

The schema is in [`database/schema.sql`](database/schema.sql). The Mermaid ERD is in [`docs/ERD.md`](docs/ERD.md).

Main entities:

```text
Customer, Pet, Service, Staff, Booking,
BookingService, Payment, Invoice
```

`Booking.status` models the appointment status; a separate realtime system is not required for this prototype.

## Verification

Verify navigation:

```powershell
powershell -NoProfile -File .\scripts\verify-navigation.ps1
```

Verify scope, schema, ERD and README:

```powershell
powershell -NoProfile -File .\scripts\verify-project.ps1
```
