# C4: System Context

This view answers: who is around PawCare, and what does PawCare do for them?

```mermaid
flowchart LR
    Owner[Pet owner\nuses customer screens]
    Staff[Care staff\nrecords care work]
    Manager[Operations manager\norganises staff]
    PawCare[[PawCare\npet-care service prototype]]
    Browser[Web browser\nrenders static pages]
    Server[Local static web server\nserves repository files]
    Gateway[(Payment gateway\nnot connected)]

    Owner -->|manage pets, browse services, book, pay| PawCare
    Staff -->|intake, perform service, record notes, hand over| PawCare
    Manager -->|manage profiles, schedules, skills and assignments| PawCare
    PawCare -->|runs in| Browser
    Browser -->|loads files from| Server
    PawCare -.->|future integration only| Gateway
```

## Scope notes

- PawCare is the system being described.
- The browser and local server are how the current prototype is viewed.
- The payment gateway is shown only to make the boundary clear; no real gateway is implemented.
- Customer administration, authentication and notification systems are outside the current boundary.
