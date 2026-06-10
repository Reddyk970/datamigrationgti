$LogFile = "C:\Migration\Logs\Migration.log"

function Write-Log {
    param([string]$Message)

    $TimeStamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

    Add-Content $LogFile "$TimeStamp - $Message"
}

Write-Log "Get Request Started"

Write-Host "Build Directory: $env:BUILD_SOURCESDIRECTORY"

Get-ChildItem $env:BUILD_SOURCESDIRECTORY -Recurse

$requestFile = "$env:BUILD_SOURCESDIRECTORY\requesters\migration-request.json"

Write-Host "Request File: $requestFile"

Write-Log "Request File: $requestFile"

if (!(Test-Path $requestFile))
{
    Write-Log "Request File Not Found"
    throw "Request file not found: $requestFile"
}

$request = Get-Content $requestFile | ConvertFrom-Json

Write-Host "Request Number: $($request.RequestNumber)"
Write-Host "Source: $($request.Source)"
Write-Host "Destination: $($request.Destination)"
Write-Host "Email: $($request.Email)"

Write-Log "Migration Request Received"
Write-Log "Request Number: $($request.RequestNumber)"
Write-Log "Source: $($request.Source)"
Write-Log "Destination: $($request.Destination)"
Write-Log "Email: $($request.Email)"

Write-Log "Get Request Completed"