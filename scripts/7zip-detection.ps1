<#
.SYNOPSIS
Checks the installed version of 7-Zip.

.DESCRIPTION
The script locates the 7-Zip executable in standard installation paths and
compares its file version to the value provided via the **ExpectedVersion**
parameter. When the detected version matches, the script returns the version
string and exits with code 0. A mismatch or missing executable results in a
non-zero exit code.

.PARAMETER ExpectedVersion
The version number to compare against the installed 7-Zip. The default value is
`24.09`.

.EXAMPLE
PS> .\7zip-detection.ps1 -ExpectedVersion '24.09'
Verifies that 7-Zip version 24.09 is installed on the system.
#>

param([string]$ExpectedVersion = '24.09')

$primaryPath = "C:\Program Files\7-Zip\7z.exe"
$secondaryPath = "${env:ProgramFiles(x86)}\7-Zip\7z.exe"

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
