param([string]$ExpectedVersion = '24.09')

$primaryPath = "C:\Program Files\7-Zip\7z.exe"
$secondaryPath = "C:\Program Files (x86)\7-Zip\7z.exe"

if (Test-Path $primaryPath) {
    $filePath = $primaryPath
} elseif (Test-Path $secondaryPath) {
    $filePath = $secondaryPath
} else {
    Write-Output "7-Zip executable not found"
    exit 1
}

$FileVersion = [System.Diagnostics.FileVersionInfo]::GetVersionInfo($filePath).FileVersion
# The below line trims the spaces before and after the version name
$FileVersion = $FileVersion.Trim()

if ($FileVersion -eq $ExpectedVersion)
{
    # Write the version to STDOUT by default
    $FileVersion
    exit 0
}
else
{
    # Exit with non-zero failure code
    exit 1
}
