#!/bin/bash
# =============================================================================
# postCreateCommand — runs once after the dev container is created.
# Reference: https://containers.dev/implementors/json_reference/#lifecycle-scripts
#
# Agentic AI Stock Advisor (AISA)
# AI-Powered Stock Analysis, Portfolio Management &
# Investment Recommendation Platform
#
# Runs as `vscode`. Only the CA step elevates, so the workspace and npm cache
# stay owned by the runtime user.
# =============================================================================

set -euo pipefail

# Resolve the repo root from this script's own path (.devcontainer/scripts/),
# so the script is portable across forks, renames, and manual invocation.
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd -- "${SCRIPT_DIR}/../.." && pwd)"

cd "${REPO_ROOT}"

echo "[postCreate] Workspace: ${REPO_ROOT}"

# -----------------------------------------------------------------------------
# Corporate TLS interception — install the proxy root CA if one is in the path.
# No-ops on a clean network. Must precede anything that clones or fetches.
# -----------------------------------------------------------------------------

echo "[postCreate] Checking for corporate TLS interception..."
sudo -E sh "${SCRIPT_DIR}/install-corp-ca.sh"

# -----------------------------------------------------------------------------
# Matt Pocock skills — install selected engineering skills
#
# `skills` writes one canonical copy per skill into .agents/skills/ and then
# symlinks it into each selected agent's directory.
# -----------------------------------------------------------------------------

echo "[postCreate] Installing mattpocock/skills into .agents/ ..."

npx --yes skills add https://github.com/mattpocock/skills \
  --agent codex \
  --skill setup-matt-pocock-skills \
  --skill grill-with-docs \
  --skill to-spec \
  --skill to-tickets \
  --skill tdd \
  --skill code-review \
  --skill implement \
  --skill triage \
  --yes

# Defensive cleanup of mirrored Claude skills if created.
if [ -d .claude/skills ]; then
  echo "[postCreate] Removing .claude/skills mirror (canonical copy stays in .agents/)..."
  find .claude/skills -maxdepth 1 -type l -delete
  rmdir --ignore-fail-on-non-empty .claude/skills .claude 2>/dev/null || true
fi

echo "[postCreate] Skills installed:"
ls -1 .agents/skills 2>/dev/null || echo "  (none found — check the install output above)"

# -----------------------------------------------------------------------------
# Add further setup steps below if needed
#
# Example:
#
# echo "[postCreate] Installing project dependencies..."
# npm install
#
# echo "[postCreate] Setting up Python environment..."
# pip install -r requirements.txt --break-system-packages
# -----------------------------------------------------------------------------

echo "[postCreate] Done."
echo ""

echo "┌─────────────────────────────────────────────────────────────┐"
echo "│ Agentic AI Stock Advisor (AISA)                            │"
echo "│ AI-Powered Stock Analysis & Investment Advisory Platform   │"
echo "│                                                             │"
echo "│ Supported Workflows:                                       │"
echo "│ • Real-Time Stock Information Retrieval                    │"
echo "│ • Portfolio Analysis from Excel Files                      │"
echo "│ • Risk Assessment (Low / Medium / High)                    │"
echo "│ • Personalized Stock Recommendations                       │"
echo "│ • Portfolio Diversification Analysis                       │"
echo "│ • Automated Portfolio Updates                              │"
echo "│                                                             │"
echo "│ AI Agents:                                                 │"
echo "│ • Intake Agent                                             │"
echo "│ • Stock Information Agent                                  │"
echo "│ • Portfolio Analysis Agent                                 │"
echo "│ • Risk Assessment Agent                                    │"
echo "│ • Recommendation Agent                                     │"
echo "│ • Portfolio Update Agent                                   │"
echo "│ • Reporting Agent                                          │"
echo "│                                                             │"
echo "│ Key Features:                                              │"
echo "│ • Live Stock Price Analysis                                │"
echo "│ • Monthly High & Low Tracking                              │"
echo "│ • Company Fundamentals & Insights                          │"
echo "│ • Excel Portfolio Scanning                                 │"
echo "│ • Memory-Based Investor Profiling                          │"
echo "│ • AI-Powered Portfolio Optimization                        │"
echo "└─────────────────────────────────────────────────────────────┘"