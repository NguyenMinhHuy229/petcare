# Business Rules

These rules describe the decisions the PawCare system must follow within the current scope.

## Pet profiles

1. A pet must belong to one customer.
2. A pet must have a name and species.
3. Breed, gender, birth date, weight and care notes are optional.
4. A pet can be used in many bookings.

## Services

1. An active service can be shown to the user.
2. A service must have a name, duration and non-negative VND price.
3. A booking can contain one or more services.
4. The booking stores the selected price as `unit_price_vnd` so a future price change does not rewrite old booking history.

## Booking

1. A booking must identify a customer, pet, start time and at least one service.
2. Staff selection is optional because assignment can happen after the booking request.
3. A new booking starts with `pending` status.
4. Allowed statuses are `pending`, `confirmed`, `in_progress`, `completed` and `cancelled`.
5. A booking code is unique and is shown to the user as a human-readable reference.
6. The total cost is the sum of `quantity * unit_price_vnd` for all selected services.

## Payment

1. A payment belongs to one booking.
2. The prototype supports cash, bank transfer and card as payment methods.
3. Payment status can be `pending`, `paid`, `failed` or `refunded`.
4. A booking has at most one payment record in the current prototype schema.
5. A real system that needs repeated payment attempts should use a separate transaction table with many records per booking.

## Care process

1. A booking can have one care record in the current prototype.
2. Each care service record must refer to a service selected for that booking.
3. A service moves from pending to in progress and then completed.
4. Staff must record the initial condition before starting service.
5. Staff must record the care result and aftercare notes before handover.
6. Confirmed handover changes the booking status to `completed`.

## Invoice

1. An invoice belongs to one booking.
2. An invoice code is unique.
3. The invoice stores the total amount shown to the customer.
4. A booking has at most one invoice in the current prototype schema.

## Out-of-scope rules

Authentication, customer administration, staff administration, medical records, vaccination, live tracking, real payment processing and analytics are not part of this prototype.
