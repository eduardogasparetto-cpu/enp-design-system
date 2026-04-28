# Changelog

Histórico de mudanças do pacote EnP Design System.

---

## v3.2.0 - 2026-04-28

Release de autoridade. Skill deixa de ser descritiva e passa a ser **prescritiva e auto-aplicável**: chamada em linguagem natural → aplicação automática de tokens, regras e voz, com auto-chain de validação no fim.

### Por que esta release

Dois problemas estruturais convergiram:

1. **Drift entre fontes paralelas.** A skill (autoridade canônica) e o site `marca.ecommercenapratica.com` (vitrine pública) eram mantidos em mãos. Já driftaram — a categoria "Status e feedback" no `icons.md` da skill (`circle-check`, `circle-x`, `triangle-alert`, `info`, `loader-circle`, `bell`) não batia com a categoria de mesmo nome em `enp-marca/src/lib/lucide-icons.ts` (`chart-line`, `thumbs-up`, `thumbs-down`, `megaphone`, `bell`). Pra qualquer agente ou humano consultando, ambiguidade.

2. **Skill descritiva, não prescritiva.** Pedir "faz uma landing pra EnP" dependia do agente lembrar de carregar a skill, consultar tokens, evitar regras negativas. Muita coisa caía em prompt do usuário ou revisão pós-hoc manual.

A v3.2.0 resolve os dois com mudança estrutural: dados machine-readable em `data/`, protocolo de aplicação obrigatório no topo das duas skills principais, 60 regras consolidadas em `§0b "Proibições absolutas"`, auto-chain `audit → polish → clarify` no fim de toda geração e header de autoridade no `icons.md` resolvendo a colisão.

### Adicionado

- **Pasta `data/` (raiz, não instalada nos usuários)** — exportação machine-readable da skill em 4 JSONs:
  - `data/tokens.json` — paleta hex+OKLCH dos 3 modos cromáticos, escala tipográfica, spacing, radius, breakpoints, z-index, motion, logo
  - `data/icons.json` — mapeamento semântico Lucide ↔ Nimbus organizado em 4 categorias (navigation, actions, status_feedback, content) + regras
  - `data/components.json` — anatomia, variantes e estados de AppShell, Sidebar, Page, Card, Tabs, MetricsGrid, FormField, SplitLayout, DataTable, Toast, Modal, ConfirmationModal, EmptyState, Loading, Popover + acessibilidade
  - `data/voice.json` — voz EnP 60/40, vocabulário, fórmula de erro, empty state em 3 beats, regras de naming da marca
  - `data/README.md` — explica derivação, manutenção em paralelo ao markdown e consumo via `raw.githubusercontent.com`

- **Seção "Protocolo de aplicação (obrigatório, lê primeiro)"** no topo de `enp-design-system/SKILL.md` e `enp-app-guidelines/SKILL.md` — mandato pré-hoc: consultar tokens antes de gerar, respeitar §0a/§0b, perguntar se o caso não estiver mapeado, invocar audit → polish → clarify automaticamente no fim.

- **§0b "Proibições absolutas"** em `enp-design-system/SKILL.md` — índice mestre com **60 regras consolidadas** organizadas por domínio (cor, tipografia, spacing, motion, ícones, componentes, voz, identidade, wireframes, acessibilidade, estrutural extra, identidade verbal, imagem). Cada regra é dura, exceto a regra 9 (separação de cards por borda) que é **soft** — avisa, não bloqueia.

### Mudado

- **Triggers do `description` ampliados** em todas as 5 skills:
  - `enp-design-system` agora dispara em pedidos soltos como "faz uma landing", "monta um email", "preciso de um botão", sem precisar mencionar "DS" ou "design system"
  - `enp-app-guidelines` dispara em perguntas semânticas de ícone ("qual ícone uso pra erro?") e pedidos de wireframe/estrutura de interface
  - `enp-audit`, `enp-polish`, `enp-clarify` documentam o auto-disparo no fim de qualquer geração

- **Versão de todos os 5 SKILL.md unificada em 3.2.0** — passa a ser a versão do **pacote** (era 3.1.1 no `enp-design-system` e 1.0.0/1.3.0 nos demais)

- **Header de autoridade no `enp-app-guidelines/icons.md`** — declara que a tabela do skill é fonte canônica pra escolha semântica e que o catálogo visual em `marca.ecommercenapratica.com/icones` serve só pra browse e cópia de SVG. Em colisão, a skill vence

- **Tipografia oficial reafirmada como Plus Jakarta Sans** (regra 10 do §0b) — única família protagonista. Sem Inter, sem system-ui como protagonista. Fallback CSS continua válido pra fallback

### Auto-chain pós-geração (novo comportamento)

A partir desta release, qualquer geração via `enp-design-system` ou `enp-app-guidelines` invoca automaticamente, sem confirmação do usuário:

1. `enp-audit` — relatório P0-P3 de violações
2. `enp-polish` — finishing pass de alinhamento e consistência
3. `enp-clarify` — passe de microcopy na voz EnP

Findings + correções aplicadas aparecem no fim do entregável.

### Próximas releases previstas

- **`enp-marca` v2.x** (consumir `data/*.json` via fetch, eliminar a colisão "Status e feedback", adicionar páginas `/cores`, `/tipografia`, `/voz`, `/componentes` espelhando a skill)
- **`enp-design-system` v3.3.0** (script de geração JSON ← markdown + CI check de coerência)

---

## v3.1.1 - 2026-04-24

Pequena release de manutenção em cima da v3.1.0.

### Adições e mudanças

- **Lucide passa a ser o padrão único de ícones do DS EnP** em qualquer contexto (HTML, apresentações, React, Vue, Astro, etc.). Nimbus continua sendo a biblioteca usada dentro do ecossistema Nuvemshop em projetos que já a consomem — coexistência, não fallback.
- `skills/enp-app-guidelines/icons.md` reescrito: tabelas de mapeamento semântico reordenadas com Lucide na coluna primária e nova seção "Navegação e cópia" apontando pra https://marca.ecommercenapratica.com/icones.
- `skills/enp-design-system/SKILL.md` §16 atualizado: remove "exclusivamente NimbusIcons" e posiciona Lucide como padrão.
- Nomes de ícones validados contra a versão atual do Lucide (`circle-check`, `circle-x`, `triangle-alert`, `loader-circle`, `funnel`, `chart-column-big` em vez dos antigos `check-circle`, `x-circle`, etc.).
- Zips em `upload-claude-ai/enp-design-system.zip` e `upload-claude-ai/enp-app-guidelines.zip` regenerados com o conteúdo novo.

### Manutenção

- Workflow `.github/workflows/slack-notify.yml` desabilitado (trigger trocado para `workflow_dispatch` manual). O secret `SLACK_WEBHOOK_URL` nunca foi configurado e o workflow estava acumulando falhas em cada merge na main.

---

## v3.1.0 - 2026-04-23

Primeira versão do pacote como monorepo. Absorve `enp-app-guidelines`, adiciona três commands novos, remove suporte a Cursor.

### Contexto

Esta versão nasceu de uma avaliação comparativa entre o DS EnP e o skill `impeccable` (Paul Bakaus, Apache 2.0, `https://github.com/pbakaus/impeccable`). O Impeccable é um pacote genérico de boas práticas de frontend, com 7 referências temáticas e 17 slash commands. A questão em aberto era: o que do Impeccable vale incorporar ao DS EnP sem sobrescrever decisões já validadas?

A análise identificou três tipos de relação:

- **Conflitos duros**: Plus Jakarta Sans (Impeccable proíbe, DS EnP mandata) e `border-left > 1px` como padrão AI-slop (Impeccable proíbe, DS EnP usava 3px em indicadores laterais).
- **Divergências de forma com acordo em espírito**: OKLCH vs hex na paleta. Ambos banem preto puro, cinza puro e gradiente em texto.
- **Gaps reais**: motion design, interaction patterns modernos (`:focus-visible`, Popover API, anchor positioning) e UX writing operacional.

A decisão foi **não adotar o Impeccable como está** nem fazer fork completo. Em vez disso, absorver os gaps diretamente no DS EnP, mantendo os tokens e a voz EnP como fonte da verdade. Os requisitos que são "condição de build" (performance, edge cases, motion, acessibilidade) entraram no protocolo do DS. Só três commands verdadeiramente pós-hoc viraram skills próprias: `enp-audit`, `enp-polish`, `enp-clarify`.

A reestruturação para monorepo veio da necessidade operacional: o time EnP passou a usar só Claude Code e Antigravity. Ter dois repos separados criava fricção no onboarding e risco de drift de versão.

### Adicionado

- **Novo skill `enp-audit`** (v1.0.0) - validação pós-hoc técnica e qualitativa contra tokens EnP, regras negativas, WCAG AA e postura institucional. Gera relatório P0-P3.
- **Novo skill `enp-polish`** (v1.0.0) - finishing pass. Diferente de `enp-audit` (que aponta), este aplica correções.
- **Novo skill `enp-clarify`** (v1.0.0) - passe de microcopy na voz EnP 60/40.
- **Instalador unificado** (`install.sh` e `install.ps1`) - instala os cinco skills com um comando.
- **Flag `--update`** no `install.sh`.
- **README.md** e **INSTALACAO.md** novos.

### Mudado

#### `enp-design-system` v3.0.0 → v3.1.0

- **§2 Paleta de cores**: adicionada coluna OKLCH paralela ao hex. Hex continua primário.
- **§15d CSS bootstrap blocks**: reescritos em OKLCH com `color-mix(in oklch, ...)` para derivações de estado.
- **§13 Breakpoints e grid**: adicionado padrão `grid-template-columns: repeat(auto-fit, minmax(280px, 1fr))`.
- **§0a Requisitos de build (novo)**: performance, edge cases, motion, responsivo, acessibilidade, postura institucional como requisitos de build.
- **`content-rules.md`**: seção "Transições" virou "Transições e motion" com regras obrigatórias (`transform`/`opacity` only, `prefers-reduced-motion` obrigatório, exits = 75% do enter, banir bounce/elastic), stagger via CSS custom properties, Collapse via `grid-template-rows`, perceived performance.

#### `enp-app-guidelines` v1.2.0 → v1.3.0

- **§3 e §9**: indicador lateral 3px → 1px.
- **§2 AppShell**: skip link obrigatório.
- **§5 Card**: `:focus-visible` em cards interativos, copy guidelines na voz EnP.
- **§6 Tabs**: roving tabindex.
- **§8 FormField**: validação no blur, fórmula de erro, estados completos (8 estados).
- **§11 Modal**: migrado para `<dialog>` nativo com `inert`.
- **§11 Confirmation Modal**: copy na voz EnP, regra Undo > Confirmação.
- **§11 Empty state (novo)**: obrigatório em 3 beats.
- **§11 Loading**: copy específico para cada contexto.
- **§11.5 (novo)**: Popover API + CSS Anchor Positioning para dropdowns.
- **§14**: container queries, pointer/hover queries, safe-area-inset, `<picture>` art direction, teste em device real.
- **§15**: três regras negativas novas, requisitos de build, tabela voz EnP aplicada.

### Removido

- **Suporte a Cursor**: pasta `rule/` e scripts antigos removidos.
- **Repo separado `enp-app-guidelines`**: absorvido como skill irmão.

### Princípios de decisão

- Tokens EnP são fonte da verdade.
- Voz EnP 60/40 rege todo microcopy.
- Forward-looking.
- Performance, edge cases, motion e acessibilidade são requisitos de build.
- Hex continua a linguagem humana da paleta. OKLCH é a camada técnica.

### Migração

Quem tinha `enp-design-system` v3.0.0 e/ou `enp-app-guidelines` v1.2.0 instalados separadamente:

```bash
rm -rf ~/.claude/skills/enp-design-system ~/.claude/skills/enp-app-guidelines
git clone https://github.com/eduardogasparetto-cpu/enp-design-system.git
cd enp-design-system
bash install.sh
```

Todas as convenções de uso do DS continuam iguais. Nenhum hex mudou na documentação.

---

## v3.0.0 - 2026-04-02

Versão base do `enp-design-system`, antes da consolidação em monorepo. Distribuído como skill único junto com Cursor rules. Cobria tokens visuais, 3 modos cromáticos, 11 gradientes, semântica WCAG validada, protocolo de implementação com CSS bootstrap e checklist pós-build.

---

## v1.2.0 - 2026-04-02 (`enp-app-guidelines`)

Versão final do `enp-app-guidelines` como repo separado. Cobria AppShell, Sidebar, Page, Card, Tabs, Metrics Grid, FormField, Split Layout, DataTable, Feedback & Overlays, Ícones, 8 templates de página e regras de responsividade. Usava indicadores laterais de 3px. Sem interaction patterns modernos, sem UX writing operacional, sem container queries.

A partir da v1.3.0, este skill vive dentro do monorepo `enp-design-system`.
