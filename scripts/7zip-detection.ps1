$candidatePaths = @(
    "$env:ProgramFiles\7-Zip\7z.exe",
    "$env:ProgramFiles(x86)\7-Zip\7z.exe",
    "$env:ProgramW6432\7-Zip\7z.exe"
)

$sevenZipPath = $null
foreach ($path in $candidatePaths) {
    if (Test-Path $path) {
        $sevenZipPath = $path
        break
    }
}

if (-not $sevenZipPath) {
    exit 1
}

$FileVersion = [System.Diagnostics.FileVersionInfo]::GetVersionInfo($sevenZipPath).FileVersion
#The below line trims the spaces before and after the version name
$FileVersion = $FileVersion.Trim();
if ("24.09" -eq $FileVersion)
{
    #Write the version to STDOUT by default
    $FileVersion
    exit 0
}
else
{
    #Exit with non-zero failure code
    exit 1
}
