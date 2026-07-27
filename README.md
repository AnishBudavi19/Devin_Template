# Autonomous Business Operations Center (ABOC)

An AI-powered operations automation platform that intelligently manages:

- IT Incidents
- Customer Complaints
- System Alerts
- Service Requests
- Infrastructure Failures

ABOC uses AI agents to automate operational workflows, eliminating manual effort required for ticket triage, prioritization, assignment, escalation, monitoring, and reporting.

Repository:

<https://github.com/AnishBudavi19/Devin_Template>

> **Podman only.** The container configuration uses Podman-specific arguments that Docker may not support.

---

## Project Overview

Organizations receive hundreds of operational events every day:

- IT incidents
- Customer complaints
- Infrastructure failures
- Monitoring alerts
- Service requests

Traditionally, operations teams must:

1. Read and understand incoming tickets
2. Determine severity and priority
3. Assign tickets to the correct team
4. Monitor progress
5. Escalate delayed issues
6. Generate operational reports

ABOC automates these activities using a network of AI agents.

---

## ABOC Agent Architecture

```text
Incoming Event
      │
      ▼
Intake Agent
      │
      ▼
Priority Classification Agent
      │
      ▼
Assignment Agent
      │
      ▼
Monitoring Agent
      │
      ▼
Escalation Agent
      │
      ▼
Reporting Agent
```

### AI Agents

#### Intake Agent
- Receives incoming operational events
- Extracts relevant details
- Creates structured tickets

#### Priority Classification Agent
- Determines business impact
- Assigns severity level
- Calculates priority

#### Assignment Agent
- Routes tickets to appropriate teams
- Balances workload distribution
- Supports automatic reassignment

#### Monitoring Agent
- Tracks ticket progress
- Detects SLA risks
- Monitors response times

#### Escalation Agent
- Automatically escalates delayed tickets
- Notifies stakeholders
- Ensures SLA compliance

#### Reporting Agent
- Generates operational reports
- Produces performance metrics
- Identifies recurring issues

---

## Key Features

- AI-powered ticket intake
- Automated incident classification
- Smart priority scoring
- Automatic team assignment
- SLA monitoring
- Escalation automation
- Operational reporting
- Infrastructure alert processing
- Customer complaint management
- Service request automation

---

## Prerequisites

- Podman with a running machine
- GPU container access
  https://podman-desktop.io/docs/podman/gpu
- VS Code with the Dev Containers extension
- Node.js (for the devcontainer CLI)

Add the following to VS Code User Settings:

```jsonc
"dev.containers.dockerPath": "podman",
"dev.containers.dockerComposePath": "podman-compose",
"dev.containers.mountWaylandSocket": false
```

---

## Usage

### 1. Install Dev Containers CLI

```powershell
npm install -g @devcontainers/cli
```

### 2. Apply the Template

```powershell
$env:NODE_OPTIONS = "--use-system-ca"

devcontainer templates apply --template-id ghcr.io/anishbudavi19/aboc-workspace/aboc-workspace:latest --workspace-folder .
```

> Apply is a one-time copy operation and will not overwrite an existing `.devcontainer` directory.

### 3. Open in Container

1. Open project folder in VS Code
2. Press `F1`
3. Select **Dev Containers: Reopen in Container**
4. Wait for container build and initialization

---

## First Run

Authenticate Devin CLI:

```bash
devin setup
```

---

## What Happens During Container Setup

The post-create process performs:

### Corporate Certificate Setup

If the network uses TLS interception:

- Detects corporate proxy certificates
- Installs trusted root certificates
- Updates the container trust store

### Skill Installation

Installs development skills into:

```text
.agents/skills/
```

These skills assist with:

- Specification writing
- Ticket creation
- TDD workflows
- Code review
- Implementation planning
- Issue triage

---

## Example Workflow

### Incoming Ticket

```text
System Alert:
Database response time exceeds threshold.
```

### Automated Processing

```text
Intake Agent
    ↓
Priority Agent (High Severity)
    ↓
Assignment Agent (Database Team)
    ↓
Monitoring Agent
    ↓
Escalation Agent (if SLA breached)
    ↓
Reporting Agent
```

### Result

```text
Ticket Created
Priority Assigned
Team Assigned
SLA Monitored
Escalation Managed
Report Generated
```

---

## Customization

| Change | Location |
|----------|----------|
| Apt packages | Dockerfile |
| Node.js version | NodeSource setup section |
| Additional setup steps | scripts/postCreateCommand.sh |
| Skills configuration | scripts/postCreateCommand.sh |
| GPU configuration | devcontainer.json |

---

## Business Value

ABOC helps organizations:

- Reduce incident response time
- Improve ticket resolution efficiency
- Ensure SLA compliance
- Minimize manual operational work
- Improve customer satisfaction
- Enhance operational visibility
- Scale support operations through AI automation

---

## Technology Stack

- Devin CLI
- Node.js 22
- Python 3
- GitHub CLI
- Podman Dev Containers
- AI Agent Framework
- Automated Workflow Orchestration

---

## License

Internal project for the Autonomous Business Operations Center (ABOC).