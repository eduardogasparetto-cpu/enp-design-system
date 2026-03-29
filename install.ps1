$ErrorActionPreference = "Stop"

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$SkillDir = Join-Path $ScriptDir "skill"
$RuleDir = Join-Path $ScriptDir "rule"

$SkillDest = Join-Path $env:USERPROFILE ".cursor\skills\enp-design-system"
$RuleDest = Join-Path $env:USERPROFILE ".cursor\rules"

Write-Host ""
Write-Host "=== EnP Design System - Instalador Cursor ===" -ForegroundColor Cyan
Write-Host ""

if (-not (Test-Path (Join-Path $SkillDir "SKILL.md"))) {
    Write-Host "Erro: skill\SKILL.md nao encontrado em $ScriptDir" -ForegroundColor Red
    exit 1
}

if (-not (Test-Path $SkillDest)) { New-Item -ItemType Directory -Path $SkillDest -Force | Out-Null }
if (-not (Test-Path $RuleDest)) { New-Item -ItemType Directory -Path $RuleDest -Force | Out-Null }

Get-ChildItem -Path $SkillDir -Filter "*.md" | ForEach-Object {
    Copy-Item -Path $_.FullName -Destination (Join-Path $SkillDest $_.Name) -Force
    Write-Host "  Skill copiada: $($_.Name)" -ForegroundColor Green
}

Get-ChildItem -Path $RuleDir -Filter "*.mdc" | ForEach-Object {
    Copy-Item -Path $_.FullName -Destination (Join-Path $RuleDest $_.Name) -Force
    Write-Host "  Rule copiada: $($_.Name)" -ForegroundColor Green
}

Write-Host ""
Write-Host "Instalacao concluida. Reinicie o Cursor para ativar." -ForegroundColor Cyan
Write-Host ""
