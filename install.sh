#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SKILL_SRC="$SCRIPT_DIR/skill/SKILL.md"
RULE_SRC="$SCRIPT_DIR/rule/enp-design-system.mdc"

SKILL_DEST="$HOME/.cursor/skills/enp-design-system"
RULE_DEST="$HOME/.cursor/rules"

echo ""
echo "=== EnP Design System — Instalador Cursor ==="
echo ""

if [ ! -f "$SKILL_SRC" ]; then
  echo "Erro: skill/SKILL.md nao encontrado em $SCRIPT_DIR"
  exit 1
fi
if [ ! -f "$RULE_SRC" ]; then
  echo "Erro: rule/enp-design-system.mdc nao encontrado em $SCRIPT_DIR"
  exit 1
fi

mkdir -p "$SKILL_DEST"
mkdir -p "$RULE_DEST"

cp "$SKILL_SRC" "$SKILL_DEST/SKILL.md"
echo "  Skill copiada para $SKILL_DEST/SKILL.md"

cp "$RULE_SRC" "$RULE_DEST/enp-design-system.mdc"
echo "  Rule copiada para $RULE_DEST/enp-design-system.mdc"

echo ""
echo "Instalacao concluida. Reinicie o Cursor para ativar."
echo ""
