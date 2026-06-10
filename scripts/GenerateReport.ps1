$LogFile = "C:\Migration\Logs\Migration.log"

$ReportFolder = "C:\Migration\Reports"

if (!(Test-Path $ReportFolder))
{
    New-Item -ItemType Directory -Path $ReportFolder
}

$ReportFile = "$ReportFolder\MigrationReport.txt"

$Logs = Get-Content $LogFile

@"
==================================
Migration Report
==================================

Generated:
$(Get-Date)

Migration Activity Log

$($Logs -join "`r`n")

==================================
"@ | Out-File $ReportFile

Write-Host "Migration Report Generated"

Add-Content $LogFile "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') - Migration Report Generated"