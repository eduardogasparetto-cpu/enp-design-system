#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SKILL_DIR="$SCRIPT_DIR/skill"
RULE_DIR="$SCRIPT_DIR/rule"

echo ""
echo "=== EnP Design System — Instalador Cursor ==="
echo ""

if [ ! -f "$SKILL_DIR/SKILL.md" ]; then
  echo "Erro: skill/SKILL.md nao encontrado em $SCRIPT_DIR"
  exit 1
fi

echo "Onde deseja instalar?"
echo "  [1] Todos os projetos  (nivel de usuario - ~/.cursor/)"
echo "  [2] Apenas este projeto (nivel de projeto - ./.cursor/)"
echo ""

while true; do
  read -r -p "Escolha (1 ou 2): " CHOICE
  case "$CHOICE" in
    1|2) break ;;
    *) echo "Opcao invalida. Digite 1 ou 2." ;;
  esac
done

if [ "$CHOICE" = "1" ]; then
  SKILL_DEST="$HOME/.cursor/skills/enp-design-system"
  RULE_DEST="$HOME/.cursor/rules"
  SCOPE="usuario (todos os projetos)"
else
  SKILL_DEST="./.cursor/skills/enp-design-system"
  RULE_DEST="./.cursor/rules"
  SCOPE="projeto (apenas este diretorio)"
fi

echo ""
echo "Instalando em nivel de $SCOPE..."
echo ""

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
echo "Instalacao concluida ($SCOPE). Reinicie o Cursor para ativar."
echo ""
