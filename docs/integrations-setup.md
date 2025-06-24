# Integration Setup Guide

Follow this checklist to wire up **Cursor**, **TaskMaster**, **SuperClaude / Claude Code**, and the supporting MCP servers on a fresh workstation.

> 🟣 15-minute install if you already have Node, Git & Cursor.

---

## 1. Install Cursor & Extensions

| Step | Action |
|------|--------|
| 1. | Download **Cursor IDE**: <https://cursor.sh> |
| 2. | Launch Cursor and open the **Extensions** pane. |
| 3. | Install **Claude Code** extension (official). |
| 4. | Install **SpecStory** extension (optional – automatic chat history). |

> After install, restart Cursor so the extensions initialise.

---

## 2. TaskMaster CLI

```bash
npm install -g @coderabbitai/taskmaster
```

> Requires Node ≥ 18.  Verify with `task-master --version`.

### Initialise Project (one-time per repo)

```bash
cd <repo>
./scripts/init.sh   # Windows: .\scripts\init.ps1
```

---

## 3. SuperClaude (chat command bridges)

1. Clone the SuperClaude source **inside** the repo (keeps things tidy):
   ```bash
   git clone https://github.com/NomenAK/SuperClaude.git ./.supersrc/SuperClaude
   ```
2. Run the installer (needs Bash – Git for Windows includes it):
   ```bash
   bash ./.supersrc/SuperClaude/install.sh --dir "$HOME/.claude"
   ```
3. Add this to your shell profile so Cursor sees the install:
   ```bash
   # PowerShell $PROFILE or ~/.bashrc / ~/.zshrc
   export CLAUDE_HOME="$HOME/.claude"   # Windows: $env:CLAUDE_HOME = "$HOME/.claude"
   ```
4. Restart your terminal and Cursor.

Validation:
```text
/persona:architect          # Claude responds in architecture mode
/user:load --next            # Shows next task (none yet if repo is fresh)
```

---

## 4. SpecStory (optional)

SpecStory auto-saves every chat to `.specstory/history/`.  Enable via **Settings → Extensions → SpecStory → Auto Save**.

---

## 5. API Keys & `.env`

Copy `docs/env.example` to `.env` in the repo root and fill in the keys relevant to your org:

```bash
cp docs/env.example .env
```

| Provider | Variable | Note |
|----------|----------|------|
| Anthropic (Claude Code) | `ANTHROPIC_API_KEY` | Required for Claude Code & SuperClaude |
| Context7 | `CONTEXT7_API_KEY` | Library documentation lookups |
| BrowserBase | `BROWSERBASE_API_KEY` | Live browser & Playwright tests |
| CodeRabbit | `CODERABBIT_API_KEY` | AI code review |
| StageHand | `STAGEHAND_API_KEY` | CI / PR checks |
| OpenRouter (optional) | `OPENROUTER_API_KEY` | If you route OpenAI/Mistral via OpenRouter |

> TaskMaster reads these automatically when it calls MCP tools.

---

## 6. First Tasks

1. Draft a Product Requirements Doc (or use `docs/example_prd.txt`).
2. Parse it:
   ```bash
   task-master parse-prd docs/example_prd.txt --numTasks 10
   ```
3. Open Cursor → `/user:load --next` → start building!

---

## 7. Troubleshooting

| Symptom | Fix |
|---------|-----|
| `/user:git --checkpoint` not found | Ensure SuperClaude installed & `CLAUDE_HOME` set |
| `--c7 foo` times out | Check `CONTEXT7_API_KEY` in `.env` |
| BrowserBase calls fail | Verify `BROWSERBASE_API_KEY` and that you have credits |
| CodeRabbit suggestions empty | Confirm you invited the repo in CodeRabbit dashboard |

---

Happy hacking 🚀 