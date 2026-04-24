# EnP Design System

Monorepo do ecossistema de skills do Ecommerce na Prática (EnP) para Claude Code e Google Antigravity.

> **Convenção**: quando o usuário disser "DS", "DS EnP" ou "Design System", está se referindo a este pacote.

## O que instala

Cinco skills, um ponto de entrada:

| Skill | Versão | Papel |
|---|---|---|
| `enp-design-system` | 3.1.0 | Tokens visuais, cores (hex + OKLCH), tipografia, espaçamento, motion, layout base |
| `enp-app-guidelines` | 1.3.0 | Estrutura de aplicações, composição, interaction patterns modernos, UX writing operacional na voz EnP |
| `enp-audit` | 1.0.0 | Validação pós-hoc técnica e qualitativa contra os tokens EnP |
| `enp-polish` | 1.0.0 | Finishing pass de alinhamento, spacing e consistência micro |
| `enp-clarify` | 1.0.0 | Passe de microcopy na voz EnP (60% empático + 40% exigente) |

## Instalação

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

O instalador pergunta uma coisa:

- `[1] Claude (recomendado)` - `~/.claude/skills/` nível de usuário
- `[2] Antigravity` - `~/.gemini/antigravity/skills/` nível de usuário
- `[3] Apenas neste projeto` - `./.claude/skills/` escopado

### Atualizar

```bash
cd enp-design-system && git pull && bash install.sh
```

Ou com a flag `--update`:

```bash
bash install.sh --update
```

## Como funciona

Toda conversa no Claude Code ou Antigravity que mencione **Ecommerce na Prática**, **EnP**, **DS**, **design system**, **consultoria**, **escola**, **blog**, **modo escuro**, **modo claro** ou **serviços** vai automaticamente:

1. Ativar o `enp-design-system` como fonte de tokens visuais.
2. Ativar o `enp-app-guidelines` se for aplicação, dashboard ou painel.
3. Disponibilizar `enp-audit`, `enp-polish` e `enp-clarify` como commands para revisão pós-hoc.

Skills são ativadas por gatilho semântico. Em projetos não-EnP, ficam dormentes.

## Arquitetura

```
enp-design-system/
├── README.md
├── INSTALACAO.md
├── CHANGELOG.md
├── install.sh
├── install.ps1
└── skills/
    ├── enp-design-system/
    │   ├── SKILL.md
    │   ├── semantic-colors.md
    │   ├── component-states.md
    │   ├── content-rules.md
    │   ├── wireframes.md
    │   └── migration-guide.md
    ├── enp-app-guidelines/
    │   ├── SKILL.md
    │   ├── icons.md
    │   └── templates.md
    ├── enp-audit/
    │   └── SKILL.md
    ├── enp-polish/
    │   └── SKILL.md
    └── enp-clarify/
        └── SKILL.md
```

## Princípios do pacote

1. **Tokens EnP são fonte da verdade**.
2. **Voz EnP 60/40 rege todo microcopy**.
3. **Forward-looking**. Afirma o que EnP é hoje, não combate o que foi.
4. **Performance, edge cases, motion e acessibilidade são requisitos de build**, não correção pós-hoc.
5. **Hex continua a linguagem humana da paleta**. OKLCH é a camada técnica.

## Licença

Design System proprietário do Ecommerce na Prática (EnP), parte do grupo Nuvemshop. Baseado em Nuvemshop Brand Design Guidelines v1.

## Contato

Eduardo Gasparetto (Edo) - Head de Criação do EnP.
