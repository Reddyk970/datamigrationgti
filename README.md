Windows File Share Migration Automation Project
Project Documentation and Interview Reference
1. Project Objective
Automate Windows file share migration using Azure DevOps, PowerShell, Robocopy, and a self-hosted agent. The solution validates requests, performs initial and final data copy, handles approvals, executes cutover, generates reports, and maintains logs.
2. Architecture
User Request (JSON)
        ↓
Get Request
        ↓
Validate
        ↓
Initial Copy
        ↓
Email Notification
        ↓
Approval Check
        ↓
Final Copy
        ↓
Cutover
        ↓
Generate Report
        ↓
Close Request
3. Infrastructure Setup
Windows Server 2022 VM
Azure DevOps Project
Self-Hosted Azure DevOps Agent
PowerShell Scripts
Robocopy Utility

Folders:
C:\Migration\Source
C:\Migration\Destination
C:\Migration\Logs
C:\Migration\Reports
C:\Migration\Archive
4. Repository Structure
MigrationRepo
|-- azure-pipelines.yml
|-- requesters
|   |-- migration-request.json
|-- scripts
    |-- GetRequest.ps1
    |-- Validate.ps1
    |-- InitialCopy.ps1
    |-- SendMail.ps1
    |-- ApprovalCheck.ps1
    |-- FinalCopy.ps1
    |-- Cutover.ps1
    |-- GenerateReport.ps1
    |-- CloseTask.ps1
5. Workflow Explanation
Get Request: Reads migration request details.
Validate: Checks source and destination paths.
Initial Copy: Copies data using Robocopy.
Send Email: Simulated notification.
Approval Check: Reads approval status.
Final Copy: Copies delta changes.
Cutover: Moves source to archive.
Generate Report: Creates migration report.
Close Task: Marks migration complete.
6. Logging
Centralized logging implemented in C:\Migration\Logs\Migration.log. Each script records start time, status, success, and failure details.
7. Reporting
MigrationReport.txt is generated under C:\Migration\Reports and contains migration activity history and status.
8. Rollback Strategy
Archived source folders can be restored from C:\Migration\Archive if migration rollback is required.
9. Azure DevOps Pipeline
Stages:
Get Request
Validate
Initial Copy
Send Email
Approval Check
Final Copy
Cutover
Generate Report
Close Task
