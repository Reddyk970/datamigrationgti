$LogFile = "C:\Migration\Logs\Migration.log"

function Write-Log {
    param([string]$Message)

    $TimeStamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

    Add-Content $LogFile "$TimeStamp - $Message"
}

Write-Log "Close Task Started"

Write-Host "Migration Completed Successfully"
Write-Host "Closing SCTASK"

Write-Log "Migration Completed Successfully"
Write-Log "Request Closed"

Write-Log "Close Task Completed"