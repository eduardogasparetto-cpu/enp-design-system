#!/usr/bin/env pwsh

$ErrorActionPreference = "Stop"

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$SkillsDir = Join-Path $ScriptDir "skills"

$Skills = @(
    "enp-design-system",
    "enp-app-guidelines",
    "enp-audit",
    "enp-polish",
    "enp-clarify"
)

Write-Host ""
Write-Host "=== EnP Design System - Instalador ==="
Write-Host ""

if (-not (Test-Path $SkillsDir)) {
    Write-Host "Erro: pasta 'skills/' nao encontrada em $ScriptDir" -ForegroundColor Red
    exit 1
}

if ($args -contains "--update") {
    $Choice = "1"
    Write-Host "Modo --update: reinstalando para Claude (nivel de usuario)."
    Write-Host ""
} else {
    Write-Host "Onde instalar?"
    Write-Host "  [1] Claude (recomendado)"
    Write-Host "  [2] Antigravity"
    Write-Host "  [3] Apenas neste projeto"
    Write-Host ""

    do {
        $Choice = Read-Host "Escolha (1, 2 ou 3)"
    } while ($Choice -notin @("1", "2", "3"))
}

switch ($Choice) {
    "1" {
        $DestRoot = Join-Path $HOME ".claude\skills"
        $Scope = "Claude (nivel de usuario)"
    }
    "2" {
        $DestRoot = Join-Path $HOME ".gemini\antigravity\skills"
        $Scope = "Antigravity (nivel de usuario)"
    }
    "3" {
        $DestRoot = ".\.claude\skills"
        $Scope = "Claude (apenas este projeto)"
    }
}

Write-Host ""
Write-Host "Instalando em: $Scope"
Write-Host "Destino: $DestRoot"
Write-Host ""

New-Item -ItemType Directory -Force -Path $DestRoot | Out-Null

$Installed = 0
foreach ($skill in $Skills) {
    $Src = Join-Path $SkillsDir $skill
    $Dest = Join-Path $DestRoot $skill

    if (-not (Test-Path $Src)) {
        Write-Host "  [AVISO] Skill '$skill' nao encontrada - pulando" -ForegroundColor Yellow
        continue
    }

    if (Test-Path $Dest) {
        Remove-Item -Recurse -Force $Dest
    }

    Copy-Item -Recurse $Src $Dest

    Write-Host "  [ok] $skill" -ForegroundColor Green
    $Installed++
}

Write-Host ""
Write-Host "Instalacao concluida: $Installed skills em '$Scope'."
Write-Host ""
Write-Host "Proximos passos:"
switch ($Choice) {
    "1" { Write-Host "  - Reinicie o Claude Code para carregar as skills." }
    "2" { Write-Host "  - Reinicie o Antigravity para carregar as skills." }
    "3" { Write-Host "  - As skills agora valem apenas neste diretorio." }
}
Write-Host ""
Write-Host "Para atualizar quando sair nova versao:"
Write-Host "  cd $(Split-Path -Leaf $ScriptDir); git pull; .\install.ps1"
Write-Host ""
