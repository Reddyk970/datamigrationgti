$LogFile = "C:\Migration\Logs\Migration.log"

function Write-Log {
    param([string]$Message)

    $TimeStamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

    Add-Content $LogFile "$TimeStamp - $Message"
}

Write-Log "Final Copy Started"

$requestFile = "$env:BUILD_SOURCESDIRECTORY\requesters\migration-request.json"

$request = Get-Content $requestFile | ConvertFrom-Json

$Source = $request.Source
$Destination = $request.Destination

Write-Host "Source: $Source"
Write-Host "Destination: $Destination"

Write-Log "Source: $Source"
Write-Log "Destination: $Destination"

Write-Host "Starting Final Copy..."

robocopy $Source $Destination /E /XO /R:2 /W:2

$RC = $LASTEXITCODE

Write-Host "Robocopy Exit Code: $RC"

Write-Log "Robocopy Exit Code: $RC"

if ($RC -ge 8)
{
    Write-Log "Final Copy Failed"
    Write-Log "Robocopy failed with exit code $RC"

    throw "Final Copy Failed"
}

Write-Log "Final Copy Completed Successfully"

Write-Host "Final Copy Completed Successfully"

exit 0