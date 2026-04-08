# extract-proprietary-files.ps1
# iEnglish 9011 Proprietary Files Extractor

param(
    [string]$VendorSource = "D:\workspace\TIK-5-169-win (1)\Vendor\vendor",
    [string]$TargetDir = "d:\workspace\lineage-build\vendor\ienglish\ienglish_9011\proprietary"
)

$ErrorActionPreference = "Stop"
$ProprietaryFilesList = "d:\workspace\lineage-build\device\ienglish\ienglish_9011\proprietary-files.txt"

Write-Host "========================================"
Write-Host "iEnglish 9011 Proprietary Files Extractor"
Write-Host "========================================"
Write-Host ""
Write-Host "Source: $VendorSource"
Write-Host "Target: $TargetDir"
Write-Host ""

if (-not (Test-Path $VendorSource)) {
    Write-Host "ERROR: Source directory not found: $VendorSource"
    exit 1
}

if (-not (Test-Path $ProprietaryFilesList)) {
    Write-Host "ERROR: Proprietary files list not found: $ProprietaryFilesList"
    exit 1
}

$files = Get-Content $ProprietaryFilesList | Where-Object { $_ -match "^-" } | ForEach-Object { $_ -replace "^-", "" }
$totalFiles = $files.Count
$copiedFiles = 0
$missingFiles = 0
$missingList = @()

Write-Host "Found $totalFiles files to extract"
Write-Host ""

foreach ($file in $files) {
    $file = $file.Trim()
    if ([string]::IsNullOrWhiteSpace($file)) { continue }
    
    $sourcePath = Join-Path $VendorSource $file
    $targetPath = Join-Path $TargetDir $file
    
    if (Test-Path $sourcePath) {
        $targetDirPath = Split-Path $targetPath -Parent
        if (-not (Test-Path $targetDirPath)) {
            New-Item -ItemType Directory -Path $targetDirPath -Force | Out-Null
        }
        
        Copy-Item -Path $sourcePath -Destination $targetPath -Force
        $copiedFiles++
        
        if ($copiedFiles % 50 -eq 0) {
            Write-Host "Copied $copiedFiles / $totalFiles files..."
        }
    } else {
        $missingFiles++
        $missingList += $file
        Write-Host "MISSING: $file"
    }
}

Write-Host ""
Write-Host "========================================"
Write-Host "Extraction Complete!"
Write-Host "========================================"
Write-Host "Copied: $copiedFiles files"
Write-Host "Missing: $missingFiles files"

if ($missingFiles -gt 0) {
    Write-Host ""
    Write-Host "Missing files list:"
    $missingList | ForEach-Object { Write-Host "  - $_" }
}

Write-Host ""
Write-Host "Output directory: $TargetDir"
