$LogFile = "C:\Migration\Logs\Migration.log"

function Write-Log {
    param([string]$Message)

    $TimeStamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

    Add-Content $LogFile "$TimeStamp - $Message"
}

Write-Log "Validation Started"

$requestFile = "$env:BUILD_SOURCESDIRECTORY\requesters\migration-request.json"

$request = Get-Content $requestFile | ConvertFrom-Json

$Source = $request.Source
$Destination = $request.Destination

Write-Host "Source Path: $Source"
Write-Host "Destination Path: $Destination"

Write-Log "Source Path: $Source"
Write-Log "Destination Path: $Destination"

if (!(Test-Path $Source))
{
    Write-Log "Validation Failed - Source path does not exist"
    throw "Source path does not exist: $Source"
}

if (!(Test-Path $Destination))
{
    Write-Log "Validation Failed - Destination path does not exist"
    throw "Destination path does not exist: $Destination"
}

$fileCount = (Get-ChildItem $Destination -Force | Measure-Object).Count

Write-Host "Destination File Count: $fileCount"

Write-Log "Destination File Count: $fileCount"

if ($fileCount -gt 0)
{
    Write-Log "Validation Failed - Destination is not empty"
    throw "Destination is not empty"
}

Write-Log "Validation Successful"

Write-Host "Validation Passed"