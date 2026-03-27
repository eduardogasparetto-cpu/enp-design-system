# EnP Design System para Cursor

Design System do Ecommerce na Pratica (EnP) empacotado como **Cursor Skill + Rule** para uso automatico em toda conversa que envolva a marca EnP.

> **Convencao:** quando o usuario disser "DS", "DS EnP" ou "Design System", esta se referindo a esta skill.

## O que instala

| Arquivo | Destino | Funcao |
|---|---|---|
| `skill/SKILL.md` | `~/.cursor/skills/enp-design-system/SKILL.md` | Documento de referencia com todos os tokens visuais |
| `rule/enp-design-system.mdc` | `~/.cursor/rules/enp-design-system.mdc` | Regra que ativa a skill automaticamente e pergunta o estilo |

## Instalacao via chat (recomendada)

Abra o chat do Cursor (**Ctrl + L**) e cole:

```
Instale a skill enp-design-system a partir do repositório https://github.com/eduardogasparetto-cpu/enp-design-system — clone o repositório e copie os arquivos: skill/SKILL.md para ~/.cursor/skills/enp-design-system/SKILL.md e rule/enp-design-system.mdc para ~/.cursor/rules/enp-design-system.mdc. Crie as pastas se não existirem.
```

Reinicie o Cursor apos a instalacao.

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

Reinicie o Cursor apos a instalacao.

## Instalacao manual

Se preferir copiar os arquivos na mao:

1. Copie `skill/SKILL.md` para `~/.cursor/skills/enp-design-system/SKILL.md`
2. Copie `rule/enp-design-system.mdc` para `~/.cursor/rules/enp-design-system.mdc`
3. Crie as pastas se nao existirem
4. Reinicie o Cursor

**Windows:** substitua `~` por `%USERPROFILE%` (ex: `C:\Users\SeuNome\.cursor\...`)

## Como funciona

Apos a instalacao, toda conversa no Cursor que mencione **Ecommerce na Pratica** ou **EnP** vai automaticamente:

1. Carregar o Design System EnP como referencia
2. Perguntar o que a pessoa quer criar
3. Perguntar qual **estilo** usar
4. Aplicar os tokens corretos do estilo escolhido

Isso vale para qualquer entrega — UI, landing pages, emails, apresentacoes, social, documentos, copys e qualquer output visual ou textual da marca.

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
- Espacamento, border-radius, sombras
- Transicoes com mapeamento por componente
- Botoes (primario, secundario, ghost x 3 estilos x 6 estados)
- Inputs e formularios (spec + tokens + 3 estilos x 6 estados)
- Overlay patterns (6 contextos com tokens, blur, z-index)
- Aspect ratios + tratamento de imagem
- Breakpoints, grid 12 colunas, z-index
- Cores semanticas com ratios WCAG calculados para os 3 estilos
- Ritmo vertical (espacamento heading-conteudo com tokens + referencia CSS copiavel)
- Superficies e separacao visual (backgrounds > borders)
- **Protocolo de inicializacao conversacional** (§0) — gatilhos, coleta de parametros, regra de bloqueio
- **Bootstrap CSS por modo** (§15d) — blocos prontos para copiar
- **Regras negativas por modo** (§15e) — o que NAO fazer em cada modo
- **Mapeamento componente→token** (§15f) — tabela completa para servicos
- **Checklist de validacao pos-build** (§22) — cores, tipografia, ritmo, semantica, superficies

## Atualizacao

No chat do Cursor:

```
Atualize a skill enp-design-system — faça git pull no repositório https://github.com/eduardogasparetto-cpu/enp-design-system e copie os arquivos atualizados para ~/.cursor/skills/ e ~/.cursor/rules/
```

Ou via terminal:

```bash
cd enp-design-system
git pull
bash install.sh        # Mac/Linux
.\install.ps1          # Windows
```

## Versao

- **Skill:** v2.4.0 (2026-03-24)
- **Base:** Nuvemshop Brand Design Guidelines v1

### Changelog

**v2.4.0** (2026-03-24)
- Adicionado §0 — Protocolo de inicializacao conversacional com gatilhos, coleta de parametros e regra de bloqueio
- Adicionado §15d — Bootstrap CSS com blocos prontos por modo cromatico
- Adicionado §15e — Regras negativas explicitas por modo (o que NAO fazer)
- Adicionado §15f — Mapeamento componente→token completo para modo servicos
- Adicionado referencia CSS rapida na §17 (valores prontos para copiar)
- Adicionado §22 — Checklist de validacao pos-build (cores, tipografia, ritmo, semantica, superficies)
- Atualizada rule enp-design-system-apply.mdc com protocolo de inicializacao obrigatorio

**v2.3.0** (2026-03-26)
- Tabelas, logo, wireframes

**v2.1.0** (2026-03-24)
- Versao inicial publica
