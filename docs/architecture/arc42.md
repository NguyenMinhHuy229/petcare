# Arc42 Architecture Description

This is a concise Arc42 description of the PawCare static prototype. It documents the current design, not a production system.

## 1. Introduction and goals

PawCare helps a pet owner move through one clear journey: manage a pet, understand services, request a booking, follow its status and review payment or invoice information. Staff can record the care process, while an operations manager can maintain staff information and assignment data.

The main goals are:

- Show one complete user journey in a static prototype.
- Keep the UI, feature analysis, database design and diagrams consistent.
- Make the next implementation step easy to understand.

## 2. Constraints

- The prototype is static HTML with vanilla JavaScript and Tailwind CDN styling.
- No backend API, authentication or live database is included.
- Payment is simulated and displayed in VND.
- Mermaid is the diagram format used in the repository.
- The scope follows the approved XMind; medical care, GPS, chat and analytics are excluded.

## 3. Context and scope

The system boundary is the PawCare prototype. Pet owners use the customer screens. Care staff use the care-process screen. Operations managers use the staff-management screen. A local browser and static web server display the pages. The payment gateway and notification services are not connected; they are only future boundaries.

See [C4 system context](c4-system-context.md) and [system overview](../analysis/system-overview.md).

## 4. Solution strategy

The solution keeps each main screen as a separate HTML page and shares navigation through `scripts/navigation.js`. The database design is kept as a separate SQLite-compatible SQL file so relationships and rules can be reviewed without requiring a running backend. Mermaid diagrams provide a readable link between business flow and technical files.

## 5. Building block view

At the first level, the prototype contains the web pages, shared browser scripts, the planned database schema and reference assets. At the next level, the pages are grouped by feature: pets, services, booking, care, appointments, staff and payment. See [C4 containers](c4-container.md) and [C4 components](c4-component.md).

## 6. Runtime view

The browser loads a page from a local static server. The page loads its markup, styling and shared navigation script. Clicking a real link or an in-page action moves the user to the next screen. In the current prototype, data shown on screen is static; no request is sent to a server. See [dynamic flows](c4-dynamic-flows.md).

## 7. Deployment view

For local review, the repository is served by `python -m http.server 8000` and opened in a browser. In a future deployment, the same static files could be hosted by a static web server or CDN. The SQL file is a design artefact in the current version and is not deployed as a live database.

## 8. Cross-cutting concepts

- **Navigation:** shared route mapping in `scripts/navigation.js`.
- **Visual language:** colours, spacing, typography and controls in `docs/DESIGN.md`.
- **Currency:** all displayed prices use VND.
- **Statuses:** booking statuses are `pending`, `confirmed`, `in_progress`, `completed` and `cancelled`.
- **Data rules:** SQL checks, foreign keys and unique keys are defined in `database/schema.sql`.
- **Verification:** PowerShell scripts check required files, labels, links and schema structure.

## 9. Architecture decisions

| Decision | Reason |
|---|---|
| Keep static HTML | Fits the four-hour prototype scope and existing Stitch export. |
| Use vanilla JavaScript | Navigation and small interactions do not need a framework. |
| Keep SQL separate | Makes the planned data model reviewable without building an API. |
| Use Mermaid | Diagrams render in Markdown and stay close to the written analysis. |
| Use one care record per booking | Matches the current prototype and keeps care history simple. |
| Keep staff assignment optional | A booking may be created before an operations manager assigns staff. |

## 10. Quality requirements

- **Understandability:** a reviewer can start at the README and follow links to the relevant evidence.
- **Traceability:** every major feature maps to a page, analysis file and database table.
- **Consistency:** names, statuses and currency match across UI, diagrams and schema.
- **Reviewability:** the prototype runs from a local static server without hidden setup.
- **Safety of scope:** excluded features are stated instead of being silently implied.

## 11. Risks and technical debt

- There is no real persistence, so browser actions do not update the SQL design.
- Screens can drift from the schema because they are maintained as static HTML.
- Payment status is illustrative and does not prove a real transaction.
- The component and code views are logical groupings, not a backend class architecture.
- A future production version would need authentication, authorization, API validation, concurrency handling and deployment security.

## 12. Glossary

| Word | Meaning in this project |
|---|---|
| Booking | A requested appointment for one pet and one or more services. |
| Care process | The staff steps from intake to handover. |
| Staff assignment | Choosing the staff member responsible for a booking. |
| Service line | One selected service inside a booking. |
| Payment | The planned record of how a booking is paid. |
| Invoice | The planned document summarising the booking cost. |
| Static prototype | Pages that can be opened and navigated locally but do not call a backend. |
