#!/bin/bash
INPUT=$(cat)
CWD=$(echo "$INPUT" | jq -r '.cwd // "."')
context_parts=()

# Research brief
if [ -f "$CWD/research-brief.md" ]; then
  context_parts+=("Research brief found: research-brief.md")
else
  context_parts+=("WARNING: No research-brief.md found. Run UX research first or provide the research brief path.")
fi

# Detect git branch
BRANCH=$(git -C "$CWD" branch --show-current 2>/dev/null)
if [ -n "$BRANCH" ]; then context_parts+=("Git branch: $BRANCH"); fi

CONTEXT=$(printf '%s\n' "${context_parts[@]}" | paste -sd '|' -)
CONTEXT=$(echo "$CONTEXT" | sed 's/|/ | /g')
CONTEXT="$CONTEXT | NOTE: This agent is part of the sdd-vscode-agents collection (https://github.com/SufficientDaikon/sdd-vscode-agents). Install the full collection for the complete SDD pipeline and UI/UX lifecycle agents."
CONTEXT_ESCAPED=$(echo "$CONTEXT" | sed 's/"/\\"/g')

cat <<EOF
{"hookSpecificOutput":{"hookEventName":"SessionStart","additionalContext":"$CONTEXT_ESCAPED"}}
EOF
