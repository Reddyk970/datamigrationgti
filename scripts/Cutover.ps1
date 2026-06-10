$LogFile = "C:\Migration\Logs\Migration.log"

function Write-Log {
    param([string]$Message)

    $TimeStamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

    Add-Content $LogFile "$TimeStamp - $Message"
}

Write-Log "Cutover Started"

$requestFile = "$env:BUILD_SOURCESDIRECTORY\requesters\migration-request.json"

$request = Get-Content $requestFile | ConvertFrom-Json

$Source = $request.Source

Write-Log "Source Path: $Source"

$ParentFolder = Split-Path $Source -Parent

$ArchiveFolder = Join-Path $ParentFolder "Archive"

if (!(Test-Path $ArchiveFolder))
{
    New-Item -ItemType Directory -Path $ArchiveFolder

    Write-Log "Archive Folder Created: $ArchiveFolder"
}

$TimeStamp = Get-Date -Format "yyyyMMdd_HHmm"

$BackupFolder = Join-Path $ArchiveFolder "Source_$TimeStamp"

Move-Item $Source $BackupFolder

attrib +h $ArchiveFolder

Write-Host "Source moved to hidden archive folder"

Write-Host "Archive Path: $BackupFolder"

Write-Log "Source Archived Successfully"
Write-Log "Archive Path: $BackupFolder"

Write-Log "Cutover Completed"