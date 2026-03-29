#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SKILL_DIR="$SCRIPT_DIR/skill"
RULE_DIR="$SCRIPT_DIR/rule"

SKILL_DEST="$HOME/.cursor/skills/enp-design-system"
RULE_DEST="$HOME/.cursor/rules"

echo ""
echo "=== EnP Design System — Instalador Cursor ==="
echo ""

if [ ! -f "$SKILL_DIR/SKILL.md" ]; then
  echo "Erro: skill/SKILL.md nao encontrado em $SCRIPT_DIR"
  exit 1
fi

mkdir -p "$SKILL_DEST"
mkdir -p "$RULE_DEST"

for f in "$SKILL_DIR"/*.md; do
  fname=$(basename "$f")
  cp "$f" "$SKILL_DEST/$fname"
  echo "  Skill copiada: $fname"
done

for f in "$RULE_DIR"/*.mdc; do
  fname=$(basename "$f")
  cp "$f" "$RULE_DEST/$fname"
  echo "  Rule copiada: $fname"
done

echo ""
echo "Instalacao concluida. Reinicie o Cursor para ativar."
echo ""
