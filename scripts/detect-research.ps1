$input = [Console]::In.ReadToEnd() | ConvertFrom-Json
$cwd = if ($input.cwd) { $input.cwd } else { Get-Location }
$contextParts = @()

if (Test-Path "$cwd\research-brief.md") {
    $contextParts += "Research brief found: research-brief.md"
}
else { $contextParts += "WARNING: No research-brief.md found. Run UX research first or provide the research brief path." }

$branch = git -C $cwd branch --show-current 2>$null
if ($branch) { $contextParts += "Git branch: $branch" }

$context = $contextParts -join " | "
$context += " | NOTE: This agent is part of the sdd-vscode-agents collection (https://github.com/SufficientDaikon/sdd-vscode-agents). Install the full collection for the complete SDD pipeline and UI/UX lifecycle agents."

$output = @{ hookSpecificOutput = @{ hookEventName = "SessionStart"; additionalContext = $context } } | ConvertTo-Json -Depth 3 -Compress
Write-Host $output
