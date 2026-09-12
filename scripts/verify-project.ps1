$ErrorActionPreference = 'Stop'

function Assert-Contains([string] $content, [string] $expected, [string] $message) {
  if ($content.IndexOf($expected, [System.StringComparison]::Ordinal) -lt 0) {
    throw "FAIL: $message`nMissing: $expected"
  }
}

function Assert-NotContains([string] $content, [string] $unexpected, [string] $message) {
  if ($content.IndexOf($unexpected, [System.StringComparison]::OrdinalIgnoreCase) -ge 0) {
    throw "FAIL: $message`nUnexpected: $unexpected"
  }
}

$requiredFiles = @(
  'README.md',
  'database/schema.sql',
  'docs/ERD.md',
  'docs/analysis/README.md',
  'docs/analysis/system-overview.md',
  'docs/analysis/business-rules.md',
  'docs/analysis/traceability.md',
  'docs/analysis/features/pet-profile.md',
  'docs/analysis/features/service-catalog.md',
  'docs/analysis/features/create-booking.md',
  'docs/analysis/features/appointment-tracking.md',
  'docs/analysis/features/payment-and-invoice.md',
  'pages/pets.html',
  'pages/services.html',
  'pages/booking.html',
  'pages/appointments.html',
  'pages/payments.html'
)

foreach ($path in $requiredFiles) {
  if (-not (Test-Path -LiteralPath $path -PathType Leaf)) {
    throw "FAIL: required project file is missing: $path"
  }
}

$schema = Get-Content -Raw -Encoding utf8 'database/schema.sql'
foreach ($table in @('customers', 'pets', 'services', 'staff', 'bookings', 'booking_services', 'payments', 'invoices')) {
  Assert-Contains $schema "CREATE TABLE $table" "schema should define $table"
}

$erd = Get-Content -Raw -Encoding utf8 'docs/ERD.md'
Assert-Contains $erd '```mermaid' 'ERD should use Mermaid format'
Assert-Contains $erd 'CUSTOMERS ||--o{ PETS' 'ERD should describe customer-pet relationship'
Assert-Contains $erd 'BOOKINGS ||--o{ BOOKING_SERVICES' 'ERD should describe booking-service relationship'

$analysisOverview = Get-Content -Raw -Encoding utf8 'docs/analysis/system-overview.md'
Assert-Contains $analysisOverview 'flowchart LR' 'system overview should include Mermaid diagrams'
Assert-Contains $analysisOverview 'Pet owner' 'system overview should identify the main user'

foreach ($feature in @(
  'docs/analysis/features/pet-profile.md',
  'docs/analysis/features/service-catalog.md',
  'docs/analysis/features/create-booking.md',
  'docs/analysis/features/appointment-tracking.md',
  'docs/analysis/features/payment-and-invoice.md'
)) {
  $featureContent = Get-Content -Raw -Encoding utf8 $feature
  Assert-Contains $featureContent 'Use case diagram' "$feature should define a use case diagram"
  Assert-Contains $featureContent 'Sequence diagram' "$feature should define a sequence diagram"
  Assert-Contains $featureContent 'Acceptance criteria' "$feature should define acceptance criteria"
}

$readme = Get-Content -Raw -Encoding utf8 'README.md'
foreach ($section in @('Scope', 'User flow', 'Database', 'Run locally')) {
  Assert-Contains $readme $section "README should contain $section section"
}

foreach ($screen in @('pages/services.html', 'pages/booking.html', 'pages/payments.html', 'pages/appointments.html')) {
  $html = Get-Content -Raw -Encoding utf8 $screen
  Assert-NotContains $html 'Pet boarding' "$screen should not expose out-of-scope boarding service"
  Assert-NotContains $html 'Live photo reports' "$screen should not expose live photo reports"
  Assert-NotContains $html 'Business VAT' "$screen should not expose business VAT workflow"
}

Write-Output 'PASS: project scope, schema, ERD and README checks passed.'
