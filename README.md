# Claude Code Dev Cycle 🏁

![Claude Code Dev Cycle Banner](https://raw.githubusercontent.com/Rev4nchist/claude-code-dev-cycle/main/docs/banner.svg)

Minimal repository that demonstrates the **Cursor + TaskMaster + SuperClaude** workflow (with SpecStory session history plus Context7, CodeRabbit, BrowserBase, and StageHand integrations).

[![Use this template](https://img.shields.io/badge/GitHub-Use%20this%20template-success?style=for-the-badge)](https://github.com/Rev4nchist/claude-code-dev-cycle/generate)

---

## What's Inside

| Artifact | Location |
|----------|----------|
| Dark-theme architecture diagram (PNG) | `docs/architecture.png` |
| Mermaid source | `docs/architecture.mmd` |
| Dev-cycle explanation | `docs/dev-cycle-overview.md` |
| Integration setup guide | `docs/integrations-setup.md` |
| One-click bootstrap scripts | `scripts/init.sh`, `scripts/init.ps1` |

---

## Prerequisites

| Tool | Version | Notes |
|------|---------|-------|
| Git | latest | |
| Node.js | ≥ 18.x | required by TaskMaster CLI |
| Bash / PowerShell | for helper script |
| Cursor IDE + Claude Code | for chat integration |

---

## Quick Start

```bash
# clone the starter
git clone https://github.com/Rev4nchist/claude-code-dev-cycle.git
cd claude-code-dev-cycle

# run the helper script (macOS/Linux)
./scripts/init.sh
# or on Windows
./scripts/init.ps1
```

Open **Cursor**, then run `/persona:architect` followed by `/user:load --next` to verify your bridges.  For deeper guidance read `docs/dev-cycle-overview.md`.

---

## 🚀 One-shot Setup Prompt for Cursor

Paste the block below into a fresh chat inside **Cursor** (after opening this repo).  Claude Code will automatically bootstrap the project scaffold on whichever OS you're running:

```text
/persona:architect
# Project Scaffold Initialiser – copy everything below in one go
You are my automated dev-environment assistant. Please:
1. Detect the operating system.
2. Run the appropriate bootstrap script:
   • Unix/macOS → `./scripts/init.sh`
   • Windows     → `./scripts/init.ps1`
3. After TaskMaster initialises, copy `docs/env.example` to `.env`.
4. Prompt me to add: ANTHROPIC_API_KEY, CONTEXT7_API_KEY, BROWSERBASE_API_KEY, CODERABBIT_API_KEY, STAGEHAND_API_KEY.
5. Generate starter tasks:
   `task-master parse-prd docs/example_prd.txt --numTasks 10`
6. Show the output of `task-master next` so I can see the first task.
7. Conclude with **Scaffold ready ✅**.
```

_Just paste once – Claude will execute each step and stop when the scaffold is ready._

---

## FAQ

**Q : Does this starter include any business logic?**  
A : No.  It's a clean scaffolding meant for you to drop your own code into.

**Q : Where do tasks live?**  
A : Inside `.taskmaster/`.  The repo ships with templates only; you generate tasks by running `task-master parse-prd <prd.md>`.

---

© 2025 **Rev4nchist** – MIT Licensed 
