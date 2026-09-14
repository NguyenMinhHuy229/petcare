$ErrorActionPreference = 'Stop'

function Assert-Contains([string] $content, [string] $expected, [string] $message) {
  if ($content.IndexOf($expected, [System.StringComparison]::Ordinal) -lt 0) {
    throw "FAIL: $message`nMissing: $expected"
  }
}

$requiredFiles = @(
  'docs/architecture/README.md',
  'docs/architecture/arc42.md',
  'docs/architecture/c4-system-context.md',
  'docs/architecture/c4-container.md',
  'docs/architecture/c4-component.md',
  'docs/architecture/c4-code.md',
  'docs/architecture/c4-dynamic-flows.md'
)

foreach ($path in $requiredFiles) {
  if (-not (Test-Path -LiteralPath $path -PathType Leaf)) {
    throw "FAIL: architecture file is missing: $path"
  }
  if ($path -like 'docs/architecture/c4-*.md') {
    $content = Get-Content -Raw -Encoding UTF8 $path
    Assert-Contains $content '```mermaid' "$path should contain a Mermaid diagram"
  }
}

$arc42 = Get-Content -Raw -Encoding UTF8 'docs/architecture/arc42.md'
foreach ($section in @('## 1.', '## 2.', '## 3.', '## 4.', '## 5.', '## 6.', '## 7.', '## 8.', '## 9.', '## 10.', '## 11.', '## 12.')) {
  Assert-Contains $arc42 $section 'Arc42 document should contain all twelve sections'
}
Assert-Contains $arc42 'No backend API' 'Arc42 should state the current backend boundary'
Assert-Contains $arc42 'database/schema.sql' 'Arc42 should link the database design'

$readme = Get-Content -Raw -Encoding UTF8 'README.md'
Assert-Contains $readme 'Arc42 and C4 architecture' 'root README should link the architecture documentation'
Assert-Contains $readme 'docs/architecture/arc42.md' 'root README should link Arc42'
Assert-Contains $readme 'docs/architecture/c4-system-context.md' 'root README should link C4 context'

Write-Output 'PASS: Arc42 and C4 architecture documentation checks passed.'
