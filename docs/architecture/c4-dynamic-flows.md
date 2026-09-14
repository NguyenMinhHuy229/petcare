# C4: Dynamic Flows

These diagrams show the order of actions in the two most important journeys. They describe the current static prototype and mark database work as planned rather than live.

## Booking to payment

```mermaid
sequenceDiagram
    actor Owner as Pet owner
    participant UI as Static HTML pages
    participant Nav as navigation.js
    participant Data as Planned SQL schema

    Owner->>UI: Open My Pets
    Owner->>UI: Open Services
    Owner->>UI: Choose a service and start booking
    UI->>Nav: Resolve booking route
    Nav-->>UI: Open booking.html
    Owner->>UI: Select pet, staff, date, time and note
    Owner->>UI: Confirm booking
    UI->>Data: Planned booking and service data
    Note over Data: No live database call in current prototype
    UI->>Nav: Resolve appointments route
    Nav-->>Owner: Show My Appointments
    Owner->>UI: Open payment for an unpaid appointment
    UI->>Nav: Resolve payments route
    Nav-->>Owner: Show Payment and Invoices
    Owner->>UI: Confirm simulated payment and open invoice
```

## Staff assignment and care process

```mermaid
sequenceDiagram
    actor Manager as Operations manager
    actor Staff as Care staff
    participant UI as Staff and care pages
    participant Nav as navigation.js
    participant Data as Planned SQL schema

    Manager->>UI: Review staff profiles, schedules and skills
    Manager->>UI: Assign a suitable staff member to a booking
    UI->>Data: Planned booking staff assignment
    Staff->>UI: Open Care Process
    Staff->>UI: Confirm intake and initial check
    Staff->>UI: Start and complete selected services
    Staff->>UI: Record care notes and result
    Staff->>UI: Confirm handover
    UI->>Nav: Resolve appointment status route
    Nav-->>UI: Show completed appointment state
```

The order is visible in the prototype, but the actions do not persist to a live database until a backend is added in a future scope.
