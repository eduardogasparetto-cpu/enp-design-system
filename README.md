# EnP Design System para Cursor

Design System do Ecommerce na Pratica (EnP) empacotado como **Cursor Skill + Rule** para uso automatico em toda conversa que envolva a marca EnP.

> **Convencao:** quando o usuario disser "DS", "DS EnP" ou "Design System", esta se referindo a esta skill.

## O que instala

| Arquivo | Destino | Funcao |
|---|---|---|
| `skill/SKILL.md` | `.cursor/skills/enp-design-system/SKILL.md` | Documento principal com tokens e regras |
| `skill/semantic-colors.md` | `.cursor/skills/enp-design-system/semantic-colors.md` | Tabelas de cores semanticas WCAG |
| `skill/component-states.md` | `.cursor/skills/enp-design-system/component-states.md` | Estados de botoes, inputs e overlays |
| `skill/content-rules.md` | `.cursor/skills/enp-design-system/content-rules.md` | Gradientes, sombras, transicoes, ritmo, tabelas |
| `skill/wireframes.md` | `.cursor/skills/enp-design-system/wireframes.md` | Catalogo de wireframes para LPs |
| `skill/migration-guide.md` | `.cursor/skills/enp-design-system/migration-guide.md` | Guia para projetos existentes |
| `rule/enp-design-system.mdc` | `.cursor/rules/enp-design-system.mdc` | Regra de auto-deteccao |
| `rule/enp-design-system-apply.mdc` | `.cursor/rules/enp-design-system-apply.mdc` | Regra de aplicacao |

## Instalacao via chat (recomendada)

Abra o chat do Cursor (**Ctrl + L**) e cole:

```
Instale a skill enp-design-system a partir do repositorio https://github.com/eduardogasparetto-cpu/enp-design-system — clone o repositorio e copie todos os arquivos da pasta skill/ para .cursor/skills/enp-design-system/ e da pasta rule/ para .cursor/rules/. Crie as pastas se nao existirem.
```

> Veja o guia completo para nao-tecnicos em [INSTALACAO.md](INSTALACAO.md)

## Instalacao via terminal

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

## Skill complementar

Para interfaces de aplicacao (dashboards, paineis, ferramentas), instale tambem o **enp-app-guidelines**:

```
https://github.com/eduardogasparetto-cpu/enp-app-guidelines
```

## Como funciona

Apos a instalacao, toda conversa no Cursor que mencione **Ecommerce na Pratica** ou **EnP** vai automaticamente:

1. Carregar o Design System EnP como referencia
2. Perguntar o que a pessoa quer criar
3. Perguntar qual **estilo** usar
4. Aplicar os tokens corretos do estilo escolhido

### Estilos

| Estilo | Fundo | CTA principal | Quando usar |
|---|---|---|---|
| **Institucional claro** | Frost `#F4F7FB` | Button Blue `#1076DD` | Site institucional, LP, blog, escola |
| **Escuro institucional** | `#212328` | Sky Blue `#31B3F9` | Versoes escuras do site e ferramentas |
| **Servicos** | Midnight `#0D1B2E` | Lightning Lime `#CDFF07` | Paginas de servico, consultoria, planos |

## O que contem a skill

- Tipografia (familia, escala com 14px Caption/UI, tamanhos responsivos)
- Paleta de cores (institucional, servicos, extensao, gray scale, tokens de opacidade)
- 11 gradientes nomeados + regras de quando NAO usar
- Espacamento, border-radius, sombras, transicoes
- Botoes (primario, secundario, ghost x 3 modos x 6 estados)
- Inputs e formularios (spec + tokens + 3 modos x 6 estados)
- Overlay patterns (6 contextos com tokens, blur, z-index)
- Cores semanticas com ratios WCAG para os 3 modos
- Ritmo vertical com tokens e referencia CSS
- Superficies e separacao visual (backgrounds > borders)
- Tabelas com sistema de opacidade relativa
- Logo (5 variantes, selecao automatica por modo)
- Wireframes (19 categorias para landing pages)
- Protocolo de inicializacao conversacional
- Guia de migracao para projetos existentes
- Checklist de validacao pos-build

## Versao

- **Skill:** v3.0.0 (2026-03-29)
- **Base:** Nuvemshop Brand Design Guidelines v1

### Changelog

**v3.0.0** (2026-03-29)
- Skill dividida em core + 5 arquivos de referencia para melhor performance
- Adicionado migration-guide.md para projetos existentes
- Adicionada referencia cruzada com enp-app-guidelines
- Core SKILL.md reduzido de 1317 para ~450 linhas

**v2.5.0** (2026-03-24)
- Adicionado passo de auto-atualizacao no protocolo de inicializacao

**v2.4.0** (2026-03-24)
- Adicionado protocolo de inicializacao, bootstrap CSS, regras negativas, mapeamento componente-token, checklist

**v2.3.0** (2026-03-26)
- Tabelas, logo, wireframes

**v2.1.0** (2026-03-24)
- Versao inicial publica
