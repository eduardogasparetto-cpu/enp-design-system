# Changelog

Histórico de mudanças do pacote EnP Design System.

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
