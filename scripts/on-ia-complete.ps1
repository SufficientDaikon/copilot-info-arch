$input = [Console]::In.ReadToEnd() | ConvertFrom-Json
$cwd = if ($input.cwd) { $input.cwd } else { Get-Location }
$cutoff = (Get-Date).AddMinutes(-30)
$artifact = Get-ChildItem -Path $cwd -Recurse -Filter "information-architecture.md" -ErrorAction SilentlyContinue |
    Where-Object { $_.LastWriteTime -gt $cutoff } | Select-Object -First 1
if ($artifact) {
    $msg = "Information architecture saved: $($artifact.FullName)`n`nNext step: Hand off to the **wireframe** agent or submit for **design review**.`n`nFull pipeline: https://github.com/SufficientDaikon/sdd-vscode-agents"
    $output = @{ systemMessage = $msg } | ConvertTo-Json -Compress
    Write-Host $output
} else {
    Write-Host '{"continue":true}'
}
