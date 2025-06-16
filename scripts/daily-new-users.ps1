<#
.SYNOPSIS
    Export newly created Azure AD users from the last 24 hours.
.DESCRIPTION
    Connects to Microsoft Graph and exports users created in the last 24 hours
    to 'daily_new_users.csv'.
    Required permission: User.Read.All
#>

Connect-MgGraph -Scopes "User.Read.All"

$since = (Get-Date).AddHours(-24)
$users = Get-MgUser -Filter "createdDateTime ge $($since.ToString('o'))"

$users |
    Select-Object UserPrincipalName, DisplayName, CreatedDateTime |
    Export-Csv -Path "daily_new_users.csv" -NoTypeInformation

Disconnect-MgGraph
