# C4: Component View

The repository is small and does not contain a backend class structure. This view therefore groups related behaviour inside the static UI and shared browser script. These are logical groups, not separately running programs.

```mermaid
flowchart LR
    UI[Static HTML UI]
    Pets[Pet profile group\npages/pets.html]
    Services[Service catalog group\npages/services.html]
    Booking[Booking group\npages/booking.html]
    Care[Care process group\npages/care-process.html]
    Appointment[Appointment tracking group\npages/appointments.html]
    Staff[Staff management group\npages/staff-management.html]
    Payment[Payment and invoice group\npages/payments.html]
    Navigation[Navigation group\nscripts/navigation.js]

    UI --> Pets
    UI --> Services
    UI --> Booking
    UI --> Care
    UI --> Appointment
    UI --> Staff
    UI --> Payment
    Pets --> Navigation
    Services --> Navigation
    Booking --> Navigation
    Care --> Navigation
    Appointment --> Navigation
    Staff --> Navigation
    Payment --> Navigation
    Pets --> Services
    Services --> Booking
    Booking --> Appointment
    Appointment --> Payment
    Appointment --> Care
```

## Main responsibilities

- **Pet profile group:** lists, adds, views and edits pet information.
- **Service catalog group:** shows available service names, prices and durations.
- **Booking group:** collects pet, service, staff, time and note information.
- **Care process group:** shows intake, check, service execution, notes and handover.
- **Appointment tracking group:** shows the booking and its current status.
- **Staff management group:** shows profiles, schedules, skills and assignment work.
- **Payment and invoice group:** shows cost, payment status and invoice detail.
- **Navigation group:** turns shared actions and route markers into links between pages.
