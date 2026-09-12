# Feature Analysis: Payment and Invoice

## Goal

Allow a pet owner to review appointment costs, choose a payment method, see payment status and open an invoice.

## Main flow

1. The owner opens Payment & Invoices.
2. The system shows the selected appointment and service costs.
3. The system shows the total amount in VND.
4. The owner chooses cash, bank transfer or card.
5. The owner confirms the payment request.
6. The system shows the payment status.
7. The owner can open an invoice detail from the invoice list.

## Use case diagram

```mermaid
flowchart LR
    Owner((Pet owner)) --> Cost[View service costs]
    Owner --> Total[View total amount]
    Owner --> Method[Choose payment method]
    Owner --> Confirm[Confirm payment]
    Owner --> Status[View payment status]
    Owner --> Invoice[View invoice]
```

## Sequence diagram

```mermaid
sequenceDiagram
    actor Owner as Pet owner
    participant Screen as Payment screen
    participant System as PawCare system
    Owner->>Screen: Open Payment & Invoices
    Screen->>System: Load booking cost and payment status
    System-->>Screen: Return cost, total and status
    Owner->>Screen: Choose payment method
    Owner->>Screen: Confirm payment request
    Screen->>System: Record selected method
    System-->>Screen: Return payment status
    Owner->>Screen: Open invoice
    Screen->>System: Load invoice details
    System-->>Screen: Return invoice
    Screen-->>Owner: Show invoice detail
```

## Data

- `bookings` identifies the appointment being paid.
- `booking_services` provides service lines and price snapshots.
- `payments` stores amount, method, status and paid time.
- `invoices` stores invoice code and total amount.

## Rules and validation

- Amount cannot be negative.
- The method must be cash, bank transfer or card.
- Payment status must be pending, paid, failed or refunded.
- The prototype allows one payment record and one invoice per booking.
- A real gateway is outside the current scope.

## Acceptance criteria

- Service costs and total are visible.
- The three supported payment methods can be selected.
- The payment confirmation shows a result status.
- Existing invoices can be opened in detail.
- All displayed amounts use VND.
