$ErrorActionPreference = "Stop"

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$SkillDir = Join-Path $ScriptDir "skill"
$RuleDir = Join-Path $ScriptDir "rule"

Write-Host ""
Write-Host "=== EnP Design System - Instalador Cursor ===" -ForegroundColor Cyan
Write-Host ""

if (-not (Test-Path (Join-Path $SkillDir "SKILL.md"))) {
    Write-Host "Erro: skill\SKILL.md nao encontrado em $ScriptDir" -ForegroundColor Red
    exit 1
}

Write-Host "Onde deseja instalar?" -ForegroundColor Yellow
Write-Host "  [1] Todos os projetos  (nivel de usuario - ~/.cursor/)" -ForegroundColor White
Write-Host "  [2] Apenas este projeto (nivel de projeto - ./.cursor/)" -ForegroundColor White
Write-Host ""

do {
    $Choice = Read-Host "Escolha (1 ou 2)"
} while ($Choice -ne "1" -and $Choice -ne "2")

if ($Choice -eq "1") {
    $SkillDest = Join-Path $env:USERPROFILE ".cursor\skills\enp-design-system"
    $RuleDest = Join-Path $env:USERPROFILE ".cursor\rules"
    $Scope = "usuario (todos os projetos)"
} else {
    $SkillDest = Join-Path (Get-Location) ".cursor\skills\enp-design-system"
    $RuleDest = Join-Path (Get-Location) ".cursor\rules"
    $Scope = "projeto (apenas este diretorio)"
}

Write-Host ""
Write-Host "Instalando em nivel de $Scope..." -ForegroundColor Cyan
Write-Host ""

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
Write-Host "Instalacao concluida ($Scope). Reinicie o Cursor para ativar." -ForegroundColor Cyan
Write-Host ""
