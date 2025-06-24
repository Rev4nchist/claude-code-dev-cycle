#!/usr/bin/env bash
set -euo pipefail

# Install TaskMaster CLI globally if not present
if ! command -v task-master &>/dev/null; then
  echo "🔧 Installing TaskMaster CLI ..."
  npm install -g @coderabbitai/taskmaster
fi

# Initialise TaskMaster in this repo
if [ ! -d ".taskmaster" ] || [ ! -f ".taskmaster/config.json" ]; then
  echo "📂 Initialising TaskMaster project ..."
  task-master init --yes
else
  echo "ℹ️  TaskMaster already initialised – skipping"
fi

echo "✅ Done!"
echo "Next steps:"
echo "  1. Open 'docs/architecture.png'"
echo "  2. Read docs/dev-cycle-overview.md" 