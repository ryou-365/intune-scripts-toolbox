<#
.SYNOPSIS
Retrieves Azure AD users created in the last 24 hours.

.DESCRIPTION
Uses the Microsoft Graph PowerShell module to query users created within the
last 24 hours and exports the results to a CSV file. The default output path is
`daily_new_users.csv`.

.PARAMETER OutputPath
The path where the CSV file will be written. Defaults to
`daily_new_users.csv`.

.EXAMPLE
PS> .\daily-new-users.ps1 -OutputPath .\report.csv
Exports newly created users to `report.csv`.
#>

param(
    [string]$OutputPath = "daily_new_users.csv"
)

Connect-MgGraph -Scopes "User.Read.All" | Out-Null

$since = (Get-Date).AddHours(-24).ToString('o')
$users = Get-MgUser -Filter "createdDateTime ge $since" -All

$users |
    Select-Object DisplayName, UserPrincipalName, Id, CreatedDateTime |
    Export-Csv -NoTypeInformation -Path $OutputPath
