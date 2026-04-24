# Guia de instalação do DS EnP

Este guia é para quem nunca instalou uma skill de Claude Code ou Antigravity.

## Antes de começar

- Um computador (Mac, Windows ou Linux)
- **Git** instalado (`git --version` no terminal, se aparecer versão, ok)
- **Claude Code** ou **Google Antigravity** instalado

## Mac / Linux

1. Abra o Terminal.
2. Cole e dê Enter:

```bash
git clone https://github.com/eduardogasparetto-cpu/enp-design-system.git
cd enp-design-system
bash install.sh
```

3. O instalador pergunta onde instalar:

```
=== EnP Design System - Instalador ===

Onde instalar?
  [1] Claude (recomendado)
  [2] Antigravity
  [3] Apenas neste projeto
```

Digite `1` se usa Claude Code. `2` se usa Antigravity. Para os dois, rode duas vezes.

4. Reinicie o Claude Code (ou Antigravity).

## Windows

1. Abra o PowerShell.
2. Cole:

```powershell
git clone https://github.com/eduardogasparetto-cpu/enp-design-system.git
cd enp-design-system
.\install.ps1
```

3. Mesmas opções do Mac/Linux.
4. Reinicie o Claude Code (ou Antigravity).

## Se der erro

**"bash: command not found"** no Mac: prefixe com `bash`:
```bash
bash install.sh
```

**"Execution Policy"** no Windows:
```powershell
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
```

**"git: command not found"**: instale pelo [git-scm.com](https://git-scm.com/).

## Como atualizar

### Mac / Linux

```bash
cd enp-design-system
git pull
bash install.sh
```

### Windows

```powershell
cd enp-design-system
git pull
.\install.ps1
```

## Como saber se funcionou

No Claude Code, em qualquer projeto:

```
Usando o DS EnP, crie um botão primário no modo institucional claro.
```

Se responder referenciando Plus Jakarta Sans, Button Blue `#1076DD` e regras do DS, a skill está ativa.

## Pastas instaladas

Claude Code (opção `[1]`):
```
~/.claude/skills/enp-design-system/
~/.claude/skills/enp-app-guidelines/
~/.claude/skills/enp-audit/
~/.claude/skills/enp-polish/
~/.claude/skills/enp-clarify/
```

Antigravity (opção `[2]`): raiz em `~/.gemini/antigravity/skills/`.

Para desinstalar, apagar as pastas.

## Dúvidas

Edo (Eduardo Gasparetto), canal `#ds-enp` no Slack.
