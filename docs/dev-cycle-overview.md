# Developer Cycle Overview

This document explains how **Cursor**, **TaskMaster**, **SuperClaude / Claude Code**, and the auxiliary MCP servers work together so you can reproduce the same productivity loop on any machine.

---

## 1 Plan  *(Cursor Chat + TaskMaster)*
1. Open **Cursor IDE**.
2. Run `task-master next` (or `/user:load --next`) to pull the next actionable task from **TaskMaster**.
3. If the task needs architectural thinking, switch persona – e.g. `/persona:architect`.
4. Record high-level decisions back to the task with `task-master update-subtask --id <id> --prompt "…"` (`update_subtask` MCP).

---

## 2 Implement  *(Claude Code)*
1. For each subtask, start a Git checkpoint:
   ```bash
   /user:git --checkpoint --label "Task <id> start"
   ```
2. Use **Claude Code** commands to generate or edit code that satisfies the acceptance criteria.
3. Log discoveries/notes back to the subtask with another `update_subtask` call.
4. Finish with a second checkpoint commit.

---

## 3 Validate  *(MCPs)*
| Validation need | Tool / Shortcut |
|-----------------|-----------------|
| API / library docs | `--c7 <lib>` → **Context7** |
| Live UI / API smoke test | **BrowserBase** (Playwright) |
| Code review (AI) | **CodeRabbit** |
| CI build / PR checks | **StageHand** |

All checks should pass before marking the subtask complete.

---

## 4 Close Loop
1. Mark the subtask done:
   ```bash
   task-master set-status --id <id> --status done
   ```
2. TaskMaster updates dependency graphs automatically.
3. Run `task-master generate` if you publish per-task Markdown docs.
4. Return to **Plan** for the next task.

---

## Validation Checklist (after installation)
- `/persona:architect` replies in an architectural voice.
- `/user:load --next` mirrors `task-master next` output.
- `/user:git --checkpoint` creates a commit starting with `Checkpoint:`.
- `task-master list --status=pending` matches the IDs you saw via chat.

---

## Quick Installation Recap
```bash
# in repo root
yarn global add @coderabbitai/taskmaster   # or npm i -g …
./scripts/init.sh   # Windows: .\scripts\init.ps1
```

Once TaskMaster initialises, parse your own PRD:
```bash
task-master parse-prd docs/my_prd.md --numTasks 10
```

Start Cursor, load your next task, and you're off 🚀 