# copilot-info-arch

> **Part of [sdd-vscode-agents](https://github.com/SufficientDaikon/sdd-vscode-agents)** — install the full collection for the complete SDD pipeline + UI/UX lifecycle.

A VS Code Copilot agent plugin that creates comprehensive information architecture — sitemaps, navigation design, user flows, and content strategies.

## What it does

The **info-arch** agent structures your product's information:
- Creates a complete sitemap with page hierarchy
- Designs navigation systems (primary, secondary, utility)
- Maps user flows for key tasks
- Defines content models and page templates
- Creates a screen inventory with prioritization

## Hooks included

| Hook | Event | What it does |
|------|-------|-------------|
| **Research brief detection** | `SessionStart` | Auto-detects research-brief.md from the UX research phase |
| **IA completion** | `Stop` | Checks for information-architecture.md and suggests next step (wireframing) |

## Install

### Via Copilot CLI
```bash
copilot plugin install SufficientDaikon/copilot-info-arch
```

### Via VS Code settings

Clone the repo and add to your `settings.json`:
```json
"chat.plugins.paths": {
    "/path/to/copilot-info-arch": true
}
```

### Via local path
```bash
git clone https://github.com/SufficientDaikon/copilot-info-arch.git
copilot plugin install ./copilot-info-arch
```

## Usage

Switch to the **info-arch** agent in VS Code chat, then:
```
Create the information architecture for this project based on research-brief.md
```
**Expected output**: A comprehensive information-architecture.md with sitemap, navigation, user flows, and content strategy.

## Pipeline position

```
ux-research -> **info-arch** -> wireframe
```

## Full collection

This agent works best as part of the full SDD + UI/UX pipeline. Install all 13 agents:

```bash
copilot plugin install SufficientDaikon/sdd-vscode-agents
```

See the [full collection](https://github.com/SufficientDaikon/sdd-vscode-agents) for documentation and the complete agent list.

## License

MIT
