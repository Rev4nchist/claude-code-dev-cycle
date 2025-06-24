# Claude Code Dev Cycle 🏁

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

## FAQ

**Q : Does this starter include any business logic?**  
A : No.  It's a clean scaffolding meant for you to drop your own code into.

**Q : Where do tasks live?**  
A : Inside `.taskmaster/`.  The repo ships with templates only; you generate tasks by running `task-master parse-prd <prd.md>`.

---

© 2025 **Rev4nchist** – MIT Licensed 
