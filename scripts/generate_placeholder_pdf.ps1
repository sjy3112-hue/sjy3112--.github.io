<#
.SYNOPSIS
Creates a lightweight placeholder PDF so visitors can download something
until the real project portfolio is ready.

.DESCRIPTION
The generated PDF contains a short instructional sentence. Run this script
again (or replace the resulting file) after exporting your actual project
portfolio.

.PARAMETER OutputPath
Relative path (from repository root) where the placeholder PDF is created.

.PARAMETER Message
Sentence rendered inside the placeholder PDF.
#>
[CmdletBinding()]
param(
    [string]$OutputPath = "assets/docs/security-cloud-projects.pdf",
    [string]$Message = "Replace this placeholder with your real project portfolio."
)

$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$resolvedOutputPath = Join-Path $repoRoot $OutputPath
$resolvedDirectory = Split-Path -Parent $resolvedOutputPath

if (-not (Test-Path $resolvedDirectory)) {
    New-Item -ItemType Directory -Path $resolvedDirectory -Force | Out-Null
}

$memoryStream = New-Object System.IO.MemoryStream
$writer = New-Object System.IO.StreamWriter($memoryStream, [System.Text.Encoding]::ASCII)
$writer.NewLine = "`n"

$writer.WriteLine("%PDF-1.4")
$objectOffsets = @{}

function Start-PdfObject {
    param([int]$Id)
    $writer.Flush()
    $objectOffsets[$Id] = $memoryStream.Position
    $writer.WriteLine("{0} 0 obj" -f $Id)
}

Start-PdfObject -Id 1
$writer.WriteLine("<< /Type /Catalog /Pages 2 0 R >>")
$writer.WriteLine("endobj")

Start-PdfObject -Id 2
$writer.WriteLine("<< /Type /Pages /Kids [3 0 R] /Count 1 >>")
$writer.WriteLine("endobj")

Start-PdfObject -Id 3
$writer.WriteLine("<< /Type /Page /Parent 2 0 R /MediaBox [0 0 612 792] /Contents 4 0 R /Resources << /Font << /F1 5 0 R >> >> >>")
$writer.WriteLine("endobj")

$escapedMessage = $Message.Replace("(", "\(").Replace(")", "\)")
$streamContent = @"
BT
/F1 18 Tf
72 700 Td
($escapedMessage) Tj
ET
"@ -replace "`r", ""

$streamBytes = [System.Text.Encoding]::ASCII.GetBytes($streamContent)

Start-PdfObject -Id 4
$writer.WriteLine("<< /Length {0} >>" -f $streamBytes.Length)
$writer.WriteLine("stream")
$writer.Flush()
$memoryStream.Write($streamBytes, 0, $streamBytes.Length)
$writer.WriteLine()
$writer.WriteLine("endstream")
$writer.WriteLine("endobj")

Start-PdfObject -Id 5
$writer.WriteLine("<< /Type /Font /Subtype /Type1 /BaseFont /Helvetica >>")
$writer.WriteLine("endobj")

$writer.Flush()
$startXref = $memoryStream.Position

$writer.WriteLine("xref")
$writer.WriteLine("0 6")
$writer.WriteLine("0000000000 65535 f ")
for ($i = 1; $i -le 5; $i++) {
    $offset = "{0:0000000000}" -f [long]$objectOffsets[$i]
    $writer.WriteLine("$offset 00000 n ")
}

$writer.WriteLine("trailer")
$writer.WriteLine("<< /Size 6 /Root 1 0 R >>")
$writer.WriteLine("startxref")
$writer.WriteLine([long]$startXref)
$writer.WriteLine("%%EOF")
$writer.Flush()

[System.IO.File]::WriteAllBytes($resolvedOutputPath, $memoryStream.ToArray())

$writer.Dispose()
$memoryStream.Dispose()

