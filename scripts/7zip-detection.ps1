param([string]$ExpectedVersion = '24.09')

$filePath = "C:\Program Files\7-Zip\7z.exe"

if (-not (Test-Path $filePath)) {
    Write-Output "7-Zip executable not found at $filePath"
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
