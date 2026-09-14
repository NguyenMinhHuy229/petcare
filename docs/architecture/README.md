# PawCare Architecture

This folder explains how the current PawCare prototype is organised. It describes the project as it exists today: static HTML pages, small JavaScript navigation helpers, a SQLite-compatible schema and reference assets.

## Recommended reading order

1. [Arc42 overview](arc42.md) — the complete short description of the system.
2. [C4 system context](c4-system-context.md) — who uses PawCare and what is outside it.
3. [C4 containers](c4-container.md) — the main running parts and stored data.
4. [C4 components](c4-component.md) — the groups of functionality inside the UI.
5. [C4 code view](c4-code.md) — the real files behind those groups.
6. [Dynamic flows](c4-dynamic-flows.md) — what happens during the important journeys.
7. [Feature analysis](../analysis/features/README.md) and [ERD](../ERD.md) — detailed behaviour and data relationships.

## Important interpretation

The word **container** here means a running application or data store. It does not mean a Docker container. The C4 views are Mermaid diagrams and use simple boxes and arrows so they can be read directly on GitHub.

The component and code views are intentionally lightweight. The repository is a static prototype, so there is no backend service, class library or live database to pretend exists.

## Architecture evidence

| Question | Evidence in the repository |
|---|---|
| What is included? | [`petcare-system.xmind`](../petcare-system.xmind), [`system-overview.md`](../analysis/system-overview.md) |
| What can a user do? | [`analysis/features/`](../analysis/features/) |
| What does the UI look like? | [`pages/`](../../pages/), [`DESIGN.md`](../DESIGN.md) |
| How are pages connected? | [`navigation.js`](../../scripts/navigation.js) |
| What data is planned? | [`schema.sql`](../../database/schema.sql), [`ERD.md`](../ERD.md) |
| How is the prototype checked? | [`verify-project.ps1`](../../scripts/verify-project.ps1), [`verify-navigation.ps1`](../../scripts/verify-navigation.ps1) |
