#!/usr/bin/env pwsh
param()
Write-Host "🔧 Installing TaskMaster CLI if missing ..."
if (-not (Get-Command task-master -ErrorAction SilentlyContinue)) {
  npm install -g @coderabbitai/taskmaster | Out-Null
}

if (-not (Test-Path '.taskmaster/config.json')) {
  Write-Host "📂 Initialising TaskMaster project ..."
  task-master init --yes
} else {
  Write-Host "ℹ️  TaskMaster already initialised – skipping"
}

Write-Host "✅ Done!"
Write-Host "1. Open 'docs/architecture.png'"
Write-Host "2. Read docs/dev-cycle-overview.md'" 