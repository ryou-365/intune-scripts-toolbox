# Monthly MFA Report Script
# This script retrieves MFA registration details using Microsoft Graph.
# It requires the "Reports.Read.All" permission.

param(
    [string]$OutputPath = $(Join-Path -Path $PSScriptRoot -ChildPath 'monthly_mfa_report.csv')
)

# Connect to Microsoft Graph
Connect-MgGraph -Scopes 'Reports.Read.All'

# Retrieve user registration details
$details = Get-MgReportAuthenticationMethodsUserRegistrationDetail

# Export the report to CSV
$details | Export-Csv -Path $OutputPath -NoTypeInformation

Write-Host "Report saved to $OutputPath"
