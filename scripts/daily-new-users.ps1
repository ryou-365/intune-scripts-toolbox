<#
.SYNOPSIS
Retrieves Azure AD users created in the last 24 hours.

.DESCRIPTION
Uses the Microsoft Graph PowerShell module to query users created within the last 24 hours and exports the results to a CSV file. The default output path is
`daily_new_users.csv`.
Connects to Microsoft Graph and exports users created in the last 24 hours to 'daily_new_users.csv'.
Required permission: User.Read.All

.PARAMETER OutputPath
The path where the CSV file will be written. Defaults to `daily_new_users.csv`.

.EXAMPLE
PS> .\daily-new-users.ps1 -OutputPath .\report.csv
Exports newly created users to `report.csv`.
#>

Connect-MgGraph -Scopes "User.Read.All"

$since = (Get-Date).AddHours(-24)
$users = Get-MgUser -Filter "createdDateTime ge $($since.ToString('o'))"

$users |
    Select-Object UserPrincipalName, DisplayName, CreatedDateTime |
    Export-Csv -Path "daily_new_users.csv" -NoTypeInformation

Disconnect-MgGraph
