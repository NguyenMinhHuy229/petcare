# Feature Analysis: Appointment Tracking

## Goal

Allow a pet owner to see appointment information and understand the current care status.

## Main flow

1. The owner opens My Appointments.
2. The system shows appointment code, pet, service, date, time and staff.
3. The system shows the current status.
4. If the appointment is unpaid, the owner can open Payment & Invoices.
5. If an invoice exists, the owner can open its detail.

## Use case diagram

```mermaid
flowchart LR
    Owner((Pet owner)) --> View[View appointment information]
    Owner --> Status[View current status]
    Owner --> Pay[Open payment for unpaid booking]
    Owner --> Invoice[Open invoice detail]
```

## Sequence diagram

```mermaid
sequenceDiagram
    actor Owner as Pet owner
    participant Screen as My Appointments screen
    participant System as PawCare system
    Owner->>Screen: Open My Appointments
    Screen->>System: Load appointment
    System-->>Screen: Return details and status
    Screen-->>Owner: Show current status
    alt Appointment is unpaid
        Owner->>Screen: Choose Payment
        Screen-->>Owner: Open Payment & Invoices
    else Invoice is available
        Owner->>Screen: Choose View invoice
        Screen-->>Owner: Open invoice detail
    end
```

## Data

The `bookings` table supplies the appointment details and `status`. Payment and invoice links use `payments` and `invoices`.

## Rules and validation

- Status must be one of the five allowed values.
- The status shown to the user must match the stored status.
- Payment is offered only for an unpaid appointment.
- Invoice detail is opened using the booking's invoice reference.

## Acceptance criteria

- Appointment information is readable.
- The current status is visible.
- Each status has a clear label.
- An unpaid appointment has a payment action.
- The invoice action opens invoice detail.
