$LogFile = "C:\Migration\Logs\Migration.log"

function Write-Log {
    param([string]$Message)

    $TimeStamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

    Add-Content $LogFile "$TimeStamp - $Message"
}

Write-Log "Approval Check Started"

$requestFile = "$env:BUILD_SOURCESDIRECTORY\requesters\migration-request.json"

$request = Get-Content $requestFile | ConvertFrom-Json

Write-Host "Checking Approval Status..."

Write-Host "Current Approval Status: $($request.Approval)"

Write-Log "Current Approval Status: $($request.Approval)"

if ($request.Approval -ne "Approved")
{
    Write-Log "Approval Pending"
    throw "Approval Pending"
}

Write-Host "Approval Received"

Write-Log "Approval Received"

Write-Log "Approval Check Completed"