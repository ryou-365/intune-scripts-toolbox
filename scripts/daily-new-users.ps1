# Script: daily-new-users.ps1
# Overview: Retrieves users created within the last 24 hours via Microsoft Graph
#           and exports the results to 'daily_new_users.csv'.
# Required Permission: User.Read.All

param()

Connect-MgGraph -Scopes "User.Read.All"

$since = (Get-Date).AddHours(-24)
$users = Get-MgUser -Filter "createdDateTime ge $($since.ToString('o'))"

$users |
    Select-Object UserPrincipalName, DisplayName, CreatedDateTime |
    Export-Csv -Path "daily_new_users.csv" -NoTypeInformation

Disconnect-MgGraph
