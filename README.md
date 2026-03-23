# EnP Design System para Cursor

Design System do Ecommerce na Pratica (EnP) empacotado como **Cursor Skill + Rule** para uso automatico em toda conversa que envolva UI.

## O que instala

| Arquivo | Destino | Funcao |
|---|---|---|
| `skill/SKILL.md` | `~/.cursor/skills/enp-design-system/SKILL.md` | Documento de referencia com todos os tokens visuais |
| `rule/enp-design-system.mdc` | `~/.cursor/rules/enp-design-system.mdc` | Regra que ativa a skill automaticamente e pergunta o modo de cor |

## Instalacao rapida

### Mac / Linux

```bash
git clone https://github.com/eduardogasparetto-cpu/enp-design-system.git
cd enp-design-system
bash install.sh
```

### Windows (PowerShell)

```powershell
git clone https://github.com/eduardogasparetto-cpu/enp-design-system.git
cd enp-design-system
.\install.ps1
```

Reinicie o Cursor apos a instalacao.

## Instalacao manual

Se preferir copiar os arquivos na mao:

1. Copie `skill/SKILL.md` para `~/.cursor/skills/enp-design-system/SKILL.md`
2. Copie `rule/enp-design-system.mdc` para `~/.cursor/rules/enp-design-system.mdc`
3. Crie as pastas se nao existirem
4. Reinicie o Cursor

**Windows:** substitua `~` por `%USERPROFILE%` (ex: `C:\Users\SeuNome\.cursor\...`)

## Como funciona

Apos a instalacao, toda conversa no Cursor que envolva geracao de UI vai automaticamente:

1. Carregar o Design System EnP como referencia
2. Perguntar qual **modo de cor** usar antes de gerar codigo
3. Aplicar os tokens corretos do modo escolhido

### Modos de cor

| Modo | Fundo | CTA principal | Quando usar |
|---|---|---|---|
| **Institucional claro** | Frost `#F4F7FB` | Button Blue `#1076DD` | Site institucional, LP, blog, escola |
| **Escuro institucional** | `#212328` | Sky Blue `#31B3F9` | Versoes escuras do site e ferramentas |
| **Servicos** | Midnight `#0D1B2E` | Lightning Lime `#CDFF07` | Paginas de servico, consultoria, planos |

## O que contem a skill

- Tipografia (familia, escala, tamanhos responsivos)
- Paleta de cores (institucional, servicos, extensao, gray scale, tokens de opacidade)
- 11 gradientes nomeados + regras de quando NAO usar
- Espacamento, border-radius, sombras
- Transicoes com mapeamento por componente
- Botoes (primario, secundario, ghost x 3 modos x 6 estados)
- Inputs e formularios (spec + tokens + 3 modos x 6 estados)
- Overlay patterns (6 contextos com tokens, blur, z-index)
- Aspect ratios + tratamento de imagem
- Breakpoints, grid 12 colunas, z-index
- Cores semanticas com ratios WCAG calculados para os 3 modos

## Atualizacao

Quando a skill for atualizada:

```bash
cd enp-design-system
git pull
bash install.sh        # Mac/Linux
.\install.ps1          # Windows
```

## Versao

- **Skill:** v2.0.0 (2026-03-22)
- **Base:** Nuvemshop Brand Design Guidelines v1
