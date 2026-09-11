---
name: PawCare Veterinary & Grooming Care System
colors:
  primary: '#00685f'
  secondary: '#a93349'
  tertiary: '#994100'
  surface: '#f9f9ff'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#f0f3ff'
  on-surface: '#111c2d'
  on-surface-variant: '#3d4947'
typography:
  fontFamily: Be Vietnam Pro
  display-lg: '36px / 44px / 700'
  headline-lg: '24px / 32px / 700'
  headline-sm: '18px / 26px / 600'
  body-md: '14px / 22px / 400'
  label-md: '12px / 16px / 600'
  price-display: '18px / 24px / 700'
rounded: { sm: 0.25rem, DEFAULT: 0.5rem, md: 0.75rem, lg: 1rem, xl: 1.5rem, full: 9999px }
spacing: { gutter: 1rem, gutter-tablet: 1.25rem, gutter-desktop: 1.5rem, margin: 1rem, margin-tablet: 1.5rem, margin-desktop: 2.5rem, space-xs: 0.25rem, space-sm: 0.5rem, space-md: 1rem, space-lg: 1.5rem, space-xl: 2rem }
---

## Brand and style

The design balances warm, attentive pet care with medical accuracy and professional service. Soft surfaces, generous whitespace and gentle shadows create a calm, reassuring experience for pet owners.

The visual direction is modern tactile minimalism: rounded cards, a warm neutral canvas, teal as the trusted primary color, and coral accents for emotional emphasis and secondary actions. Interface copy is concise, friendly and easy to scan.

## Color system

- **Primary teal:** `#00685F` communicates hygiene, safety and professional care.
- **Secondary coral:** `#A93349` highlights affection and important secondary actions.
- **Tertiary orange:** `#994100` supports notices and light warnings.
- **Canvas:** `#F9F9FF`; cards use `#FFFFFF`; muted areas use `#F0F3FF`.
- **Text:** `#111C2D` for primary content and `#3D4947` for supporting content.

Appointment status colors use light tinted backgrounds for readability: Pending (amber), Confirmed (sky blue), In service (indigo), Completed (emerald), and Cancelled (rose).

## Typography and currency

The interface uses **Be Vietnam Pro** for a rounded, modern and readable hierarchy. Headline styles identify page titles and pet names; body styles support descriptions; label styles support controls and status badges.

All prototype prices use VND with comma-separated thousands, for example `150,000 VND` and `1,250,000 VND`. Prices use the `price-display` style so totals are easy to verify.

## Layout and spacing

The layout uses a responsive fluid grid with 4px and 8px spacing increments:

- **Mobile (< 640px):** four columns, 16px margins and gutters; cards stack vertically.
- **Tablet (640px–1024px):** eight columns, 24px margins and 20px gutters.
- **Desktop (>= 1024px):** twelve columns, a centered 1200px maximum width and 40px outer margins.

Use `space-xs` and `space-sm` between icons and labels, `space-md` between form controls or list rows, and `space-xl` between major sections.

## Elevation, shapes and components

Use tonal layers and soft ambient shadows instead of harsh black shadows. Cards use white surfaces with a subtle teal-tinted border and low elevation. Dropdowns and selected controls use a slightly stronger shadow. Modals use the highest elevation with a blurred backdrop.

- **Cards and containers:** `rounded-2xl` or `rounded-3xl` for major content groups.
- **Buttons and inputs:** `rounded-xl` or a soft pill shape for comfortable touch targets.
- **Status badges:** `rounded-full`, compact padding and a 6px status dot.
- **Pet avatars:** circular or squircle crops with a 2px white protective border.
- **Primary button:** teal background, white text, 48px minimum height on mobile.
- **Secondary button:** light coral background or coral outline for supporting actions.
- **Service card:** service name, duration, VND price and a clear action.
- **Pet card:** avatar, name, species, age, weight and care notes.
- **Form controls:** white background, `#E2E8F0` border, teal focus ring and clear labels.

## Prototype scope note

The current static prototype focuses on pet profiles, services, booking, appointment status, payment and invoices. The health timeline is a design reference only; medical records, vaccination management, authentication, backend APIs and real payment gateways are outside the prototype scope.
