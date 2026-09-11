$ErrorActionPreference = 'Stop'

$routes = @{
  pets         = 'pets.html'
  services     = 'services.html'
  booking      = 'booking.html'
  appointments = 'appointments.html'
  payments     = 'payments.html'
}

$screenFiles = @{
  pets         = 'pages/pets.html'
  services     = 'pages/services.html'
  booking      = 'pages/booking.html'
  appointments = 'pages/appointments.html'
  payments     = 'pages/payments.html'
}

function Read-Screen([string] $name) {
  return Get-Content -Raw -Encoding utf8 $screenFiles[$name]
}

function Assert-Contains([string] $content, [string] $expected, [string] $message) {
  if ($content.IndexOf($expected, [System.StringComparison]::Ordinal) -lt 0) {
    throw "FAIL: $message`nMissing: $expected"
  }
}

$navigation = Get-Content -Raw -Encoding utf8 'scripts/navigation.js'
Assert-Contains $navigation "pets: '../pages/pets.html'" 'navigation map should contain pets route'
Assert-Contains $navigation "services: '../pages/services.html'" 'navigation map should contain services route'
Assert-Contains $navigation "booking: '../pages/booking.html'" 'navigation map should contain booking route'
Assert-Contains $navigation "appointments: '../pages/appointments.html'" 'navigation map should contain appointments route'
Assert-Contains $navigation "payments: '../pages/payments.html'" 'navigation map should contain payments route'

foreach ($screen in $screenFiles.Keys) {
  $content = Read-Screen $screen
  foreach ($target in $routes.Keys) {
    Assert-Contains $content 'src="../scripts/navigation.js" defer' "$screen should load navigation behavior"
  }
}

$serviceHtml = Get-Content -Raw -Encoding utf8 $screenFiles['services']
if (([regex]::Matches([string]$serviceHtml, 'calendar_today')).Count -ne 4) {
  throw 'FAIL: services screen should keep four booking CTAs'
}
Assert-Contains $navigation ": 'booking')" 'service booking CTAs should navigate to booking screen'

$booking = Read-Screen 'booking'
Assert-Contains $navigation "? 'appointments' :" 'booking confirmation should navigate to appointments'

$appointments = Read-Screen 'appointments'
Assert-Contains $navigation "paymentLink.dataset.action = 'payment'" 'unpaid appointment should receive payment action'
Assert-Contains $navigation "#invoice-HD-20241020" 'invoice action should link to invoice detail'

$payments = Read-Screen 'payments'
Assert-Contains $navigation 'window.openInvoiceModal' 'payments screen should open invoice details from hash links'

Write-Output 'PASS: PawCare navigation checks passed.'
