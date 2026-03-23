$ErrorActionPreference = "Stop"

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$SkillSrc = Join-Path $ScriptDir "skill\SKILL.md"
$RuleSrc = Join-Path $ScriptDir "rule\enp-design-system.mdc"

$SkillDest = Join-Path $env:USERPROFILE ".cursor\skills\enp-design-system"
$RuleDest = Join-Path $env:USERPROFILE ".cursor\rules"

Write-Host ""
Write-Host "=== EnP Design System - Instalador Cursor ===" -ForegroundColor Cyan
Write-Host ""

if (-not (Test-Path $SkillSrc)) {
    Write-Host "Erro: skill\SKILL.md nao encontrado em $ScriptDir" -ForegroundColor Red
    exit 1
}
if (-not (Test-Path $RuleSrc)) {
    Write-Host "Erro: rule\enp-design-system.mdc nao encontrado em $ScriptDir" -ForegroundColor Red
    exit 1
}

if (-not (Test-Path $SkillDest)) { New-Item -ItemType Directory -Path $SkillDest -Force | Out-Null }
if (-not (Test-Path $RuleDest)) { New-Item -ItemType Directory -Path $RuleDest -Force | Out-Null }

Copy-Item -Path $SkillSrc -Destination (Join-Path $SkillDest "SKILL.md") -Force
Write-Host "  Skill copiada para $SkillDest\SKILL.md" -ForegroundColor Green

Copy-Item -Path $RuleSrc -Destination (Join-Path $RuleDest "enp-design-system.mdc") -Force
Write-Host "  Rule copiada para $RuleDest\enp-design-system.mdc" -ForegroundColor Green

Write-Host ""
Write-Host "Instalacao concluida. Reinicie o Cursor para ativar." -ForegroundColor Cyan
Write-Host ""
