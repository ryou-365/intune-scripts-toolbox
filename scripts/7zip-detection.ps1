$FileVersion = [System.Diagnostics.FileVersionInfo]::GetVersionInfo("C:\Program Files\7-Zip\7z.exe").FileVersion
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
