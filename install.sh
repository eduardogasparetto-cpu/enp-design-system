#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SKILLS_DIR="$SCRIPT_DIR/skills"

SKILLS=(
  "enp-design-system"
  "enp-app-guidelines"
  "enp-audit"
  "enp-polish"
  "enp-clarify"
)

echo ""
echo "=== EnP Design System - Instalador ==="
echo ""

if [ ! -d "$SKILLS_DIR" ]; then
  echo "Erro: pasta 'skills/' nao encontrada em $SCRIPT_DIR"
  exit 1
fi

if [ "${1:-}" = "--update" ]; then
  CHOICE=1
  echo "Modo --update: reinstalando para Claude (nivel de usuario)."
  echo ""
else
  echo "Onde instalar?"
  echo "  [1] Claude (recomendado)"
  echo "  [2] Antigravity"
  echo "  [3] Apenas neste projeto"
  echo ""

  while true; do
    read -r -p "Escolha (1, 2 ou 3): " CHOICE
    case "$CHOICE" in
      1|2|3) break ;;
      *) echo "Opcao invalida. Digite 1, 2 ou 3." ;;
    esac
  done
fi

case "$CHOICE" in
  1)
    DEST_ROOT="$HOME/.claude/skills"
    SCOPE="Claude (nivel de usuario)"
    ;;
  2)
    DEST_ROOT="$HOME/.gemini/antigravity/skills"
    SCOPE="Antigravity (nivel de usuario)"
    ;;
  3)
    DEST_ROOT="./.claude/skills"
    SCOPE="Claude (apenas este projeto)"
    ;;
esac

echo ""
echo "Instalando em: $SCOPE"
echo "Destino: $DEST_ROOT"
echo ""

mkdir -p "$DEST_ROOT"

INSTALLED=0
for skill in "${SKILLS[@]}"; do
  SRC="$SKILLS_DIR/$skill"
  DEST="$DEST_ROOT/$skill"

  if [ ! -d "$SRC" ]; then
    echo "  [AVISO] Skill '$skill' nao encontrada em $SRC - pulando"
    continue
  fi

  if [ -d "$DEST" ]; then
    rm -rf "$DEST"
  fi

  mkdir -p "$DEST"
  cp -r "$SRC"/. "$DEST"/

  echo "  [ok] $skill"
  INSTALLED=$((INSTALLED + 1))
done

echo ""
echo "Instalacao concluida: $INSTALLED skills em '$SCOPE'."
echo ""
echo "Proximos passos:"
if [ "$CHOICE" = "1" ]; then
  echo "  - Reinicie o Claude Code para carregar as skills."
elif [ "$CHOICE" = "2" ]; then
  echo "  - Reinicie o Antigravity para carregar as skills."
else
  echo "  - As skills agora valem apenas neste diretorio."
fi
echo ""
echo "Para atualizar quando sair nova versao:"
echo "  cd $(basename "$SCRIPT_DIR") && git pull && bash install.sh"
echo ""
