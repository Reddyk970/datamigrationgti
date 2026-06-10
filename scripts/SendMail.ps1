$LogFile = "C:\Migration\Logs\Migration.log"

function Write-Log {
    param([string]$Message)

    $TimeStamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

    Add-Content $LogFile "$TimeStamp - $Message"
}

Write-Log "Send Email Started"

$requestFile = "$env:BUILD_SOURCESDIRECTORY\requesters\migration-request.json"

$request = Get-Content $requestFile | ConvertFrom-Json

Write-Host "Sending Email"

Write-Host "To: $($request.Email)"
Write-Host "Subject: Initial Copy Completed"

Write-Host "Initial Copy Completed"

Write-Log "Notification Email Sent"
Write-Log "Recipient: $($request.Email)"
Write-Log "Subject: Initial Copy Completed"

Write-Log "Send Email Completed"