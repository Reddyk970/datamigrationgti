# Windows File Share Migration Automation Project

## Project Objective

Automate Windows file share migration using Azure DevOps, PowerShell, Robocopy, and a self-hosted agent.

The solution validates migration requests, performs initial and final data copy, handles approvals, executes cutover activities, generates reports, and maintains centralized logs.

---

## Architecture

```text
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
```

---

## Infrastructure Setup

### Components

* Windows Server 2022 VM
* Azure DevOps Project
* Self-Hosted Azure DevOps Agent
* PowerShell Scripts
* Robocopy Utility

### Folder Structure

```text
C:\Migration\Source
C:\Migration\Destination
C:\Migration\Logs
C:\Migration\Reports
C:\Migration\Archive
```

---

## Repository Structure

```text
MigrationRepo
│
├── azure-pipelines.yml
│
├── requesters
│   └── migration-request.json
│
└── scripts
    ├── GetRequest.ps1
    ├── Validate.ps1
    ├── InitialCopy.ps1
    ├── SendMail.ps1
    ├── ApprovalCheck.ps1
    ├── FinalCopy.ps1
    ├── Cutover.ps1
    ├── GenerateReport.ps1
    └── CloseTask.ps1
```

---

## Workflow Explanation

### GetRequest.ps1

Reads migration request details from the JSON request file.

### Validate.ps1

Validates source and destination paths before migration begins.

### InitialCopy.ps1

Performs the initial data migration using Robocopy.

### SendMail.ps1

Simulates email notifications after the initial copy completes.

### ApprovalCheck.ps1

Checks approval status before continuing with cutover activities.

### FinalCopy.ps1

Copies any new or modified files since the initial migration.

### Cutover.ps1

Moves the source folder to an archive location and completes migration cutover.

### GenerateReport.ps1

Generates a migration report containing execution details and status.

### CloseTask.ps1

Marks the migration request as completed.

---

## Logging

Centralized logging is implemented using:

```text
C:\Migration\Logs\Migration.log
```

Each script records:

* Start Time
* End Time
* Success Status
* Failure Status
* Source and Destination Paths
* Migration Activities

Example:

```text
2026-06-10 19:00:01 - Migration Request Received
2026-06-10 19:00:05 - Validation Started
2026-06-10 19:00:06 - Validation Successful
2026-06-10 19:00:15 - Initial Copy Completed
2026-06-10 19:00:30 - Final Copy Completed
2026-06-10 19:00:35 - Cutover Completed
```

---

## Reporting

Migration reports are generated automatically and stored under:

```text
C:\Migration\Reports\MigrationReport.txt
```

The report contains:

* Request Details
* Migration Status
* Activity Logs
* Execution Time
* Completion Status

---

## Rollback Strategy

Archived source folders can be restored if rollback is required.

Archive Location:

```text
C:\Migration\Archive
```

Rollback Process:

1. Identify latest archived source folder.
2. Restore source folder from archive.
3. Verify data integrity.
4. Resume user access.

---

## Azure DevOps Pipeline Stages

```text
Get Request
    ↓
Validate
    ↓
Initial Copy
    ↓
Send Email
    ↓
Approval Check
    ↓
Final Copy
    ↓
Cutover
    ↓
Generate Report
    ↓
Close Task
```

---

## Key Features

* Automated File Share Migration
* PowerShell-Based Automation
* Robocopy Data Synchronization
* Approval Workflow Simulation
* Centralized Logging
* Migration Reporting
* Cutover Automation
* Rollback Capability
* Azure DevOps CI/CD Integration
* Self-Hosted Agent Execution

---

## Technologies Used

* Azure DevOps
* PowerShell
* Windows Server 2022
* Robocopy
* Git
* GitHub
* Self-Hosted Build Agent

---

## Future Enhancements

* ServiceNow Integration
* Email Notifications using SMTP
* Real Approval Workflow
* Dashboard Reporting
* Automated Rollback Triggers
* Migration Scheduling

---

## Author

**Karnati Harinath Reddy**

Windows File Share Migration Automation using Azure DevOps and PowerShell.
