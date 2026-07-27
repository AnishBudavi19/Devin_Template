# Agentic AI Stock Advisor (AISA)

An AI-powered investment advisory platform that intelligently manages:

- Stock Information Retrieval
- Portfolio Analysis
- Risk Assessment
- Investment Recommendations
- Portfolio Optimization
- Excel Portfolio Management

AISA uses AI agents to automate investment research, portfolio analysis, stock recommendation generation, risk evaluation, and portfolio updates.

Repository:

<https://github.com/AnishBudavi19/Devin_Template>

> **Podman only.** The container configuration uses Podman-specific arguments that Docker may not support.

---

## Project Overview

Investors need to continuously monitor:

- Stock prices
- Portfolio performance
- Market trends
- Risk exposure
- Diversification opportunities

Traditionally, investors must:

1. Research stock information
2. Analyze portfolio allocation
3. Calculate risk exposure
4. Identify diversification opportunities
5. Track market performance
6. Update portfolio records

AISA automates these activities using a network of AI agents.

---

## AISA Agent Architecture

```text
User Query / Portfolio Upload
           │
           ▼
      Intake Agent
           │
           ▼
 Stock Information Agent
           │
           ▼
 Portfolio Analysis Agent
           │
           ▼
 Risk Assessment Agent
           │
           ▼
 Recommendation Agent
           │
           ▼
 Portfolio Update Agent
           │
           ▼
      Reporting Agent
```

### AI Agents

#### Intake Agent

- Receives user queries and portfolio uploads
- Extracts investment requirements
- Creates structured investment context

#### Stock Information Agent

- Fetches current stock prices
- Provides monthly high and low values
- Retrieves company information
- Collects key financial metrics
- Analyzes stock fundamentals

#### Portfolio Analysis Agent

- Reads uploaded Excel portfolios
- Evaluates sector allocation
- Calculates portfolio diversification
- Detects concentration risks
- Identifies missing sector exposure

#### Risk Assessment Agent

- Determines investor risk profile
- Supports Low Risk strategy
- Supports Medium Risk strategy
- Supports High Risk strategy
- Calculates portfolio risk score

#### Recommendation Agent

- Generates personalized stock recommendations
- Suggests diversification opportunities
- Identifies growth opportunities
- Recommends stocks based on investor profile
- Explains recommendation rationale

#### Portfolio Update Agent

- Adds recommended stocks to Excel files
- Creates recommendation sheets
- Updates portfolio reports automatically
- Preserves existing portfolio data

#### Reporting Agent

- Generates portfolio insights
- Produces investment summaries
- Tracks recommendation history
- Creates portfolio health reports

---

## Key Features

- AI-powered stock research
- Real-time stock information retrieval
- Current stock price tracking
- Monthly high and low stock analysis
- Company profile and fundamentals analysis
- Excel portfolio scanning
- Portfolio diversification analysis
- Sector allocation analysis
- Risk-based stock recommendations
- Portfolio optimization suggestions
- Automated Excel portfolio updates
- Investor preference memory
- Personalized investment insights
- Portfolio health scoring

---

## Supported User Scenarios

### Scenario 1: Stock Information

User:

```text
What is the current price of TCS?
```

Response:

```text
Current Price
Monthly High
Monthly Low
Company Information
Market Capitalization
Sector Information
Investment Summary
```

---

### Scenario 2: Portfolio Analysis

User Uploads:

```text
portfolio.xlsx
```

Agent Actions:

1. Read portfolio
2. Analyze holdings
3. Determine sector allocation
4. Assess risk exposure
5. Generate recommendations
6. Update Excel with suggested stocks

---

### Scenario 3: Risk-Based Recommendations

User:

```text
Suggest stocks for a medium-risk investor.
```

Agent Actions:

```text
Retrieve Risk Profile
Analyze Current Portfolio
Fetch Market Data
Identify Diversification Needs
Generate Recommendations
Provide Investment Report
```

---

## Portfolio Recommendation Workflow

```text
Portfolio Upload
        │
        ▼
Read Excel Portfolio
        │
        ▼
Analyze Holdings
        │
        ▼
Determine Risk Level
        │
        ▼
Fetch Stock Market Data
        │
        ▼
Generate Recommendations
        │
        ▼
Update Portfolio Excel File
        │
        ▼
Generate Report
```

---

## Memory System

The platform maintains investor preferences and investment history.

Stored Information:

```json
{
  "user_id": "123",
  "risk_profile": "Medium",
  "investment_horizon": "5 Years",
  "preferred_sectors": [
    "IT",
    "Banking"
  ],
  "avoid_sectors": [
    "Crypto"
  ]
}
```

Memory enables:

- Personalized recommendations
- Consistent investment strategies
- Portfolio tracking
- Long-term investment guidance

---

## Stock Information Sources

The system can integrate with:

- Yahoo Finance
- Alpha Vantage
- Polygon.io
- Finnhub
- Twelve Data
- NSE/BSE Market Data APIs

Supported Information:

- Current Price
- Monthly High
- Monthly Low
- 52 Week High
- 52 Week Low
- Company Information
- Sector Information
- Market Capitalization
- P/E Ratio
- Dividend Yield
- Financial Metrics

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

- Stock research
- Portfolio analysis
- Risk assessment
- Excel processing
- Recommendation generation
- Financial reporting
- Investment planning

---

## Example Workflow

### User Request

```text
Analyze my portfolio and recommend stocks for a medium-risk investment strategy.
```

### Automated Processing

```text
Portfolio Upload
        ↓
Intake Agent
        ↓
Portfolio Analysis Agent
        ↓
Risk Assessment Agent
        ↓
Stock Information Agent
        ↓
Recommendation Agent
        ↓
Portfolio Update Agent
        ↓
Reporting Agent
```

### Result

```text
Portfolio Analyzed
Risk Profile Identified
Sector Allocation Reviewed
Diversification Opportunities Found
Recommended Stocks Generated
Excel Portfolio Updated
Investment Report Created
```

---

## Example Output

### Portfolio Summary

```text
Portfolio Score: 84/100

Diversification: 87
Risk Balance: 82
Sector Coverage: 84
Growth Potential: 83
```

### Recommendations

```text
1. Infosys
   Reason: Strong IT Exposure

2. Sun Pharma
   Reason: Diversification Opportunity

3. HDFC Bank
   Reason: Stable Long-Term Growth
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

AISA helps investors:

- Make data-driven investment decisions
- Improve portfolio diversification
- Understand portfolio risk exposure
- Receive AI-powered stock recommendations
- Reduce research effort
- Automate portfolio analysis
- Keep portfolio records updated
- Enhance investment decision-making
- Scale financial advisory workflows using AI

---

## Technology Stack

- Devin CLI
- Node.js 22
- Python 3
- GitHub CLI
- Podman Dev Containers
- LangGraph / Agent Framework
- LLM Integration (GPT, Claude, Gemini)
- Stock Market Data APIs
- Excel Processing Engine
- Portfolio Recommendation Engine
- Memory & User Profile Management
- Automated Workflow Orchestration

---

## License

Internal project for the Agentic AI Stock Advisor (AISA).