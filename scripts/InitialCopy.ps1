$LogFile = "C:\Migration\Logs\Migration.log"

function Write-Log {
    param([string]$Message)

    $TimeStamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

    Add-Content $LogFile "$TimeStamp - $Message"
}

Write-Log "Initial Copy Started"

$requestFile = "$env:BUILD_SOURCESDIRECTORY\requesters\migration-request.json"

$request = Get-Content $requestFile | ConvertFrom-Json

$Source = $request.Source
$Destination = $request.Destination

Write-Host "Source: $Source"
Write-Host "Destination: $Destination"

Write-Log "Source: $Source"
Write-Log "Destination: $Destination"

Write-Host "Starting Initial Copy..."

robocopy $Source $Destination /E /COPY:DAT /R:2 /W:2

$RC = $LASTEXITCODE

Write-Host "Robocopy Exit Code: $RC"

Write-Log "Robocopy Exit Code: $RC"

if ($RC -ge 8)
{
    Write-Log "Initial Copy Failed"
    Write-Log "Robocopy failed with exit code $RC"

    throw "Robocopy failed with exit code $RC"
}

Write-Log "Initial Copy Completed Successfully"

Write-Host "Initial Copy Completed Successfully"

exit 0