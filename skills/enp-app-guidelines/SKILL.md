---
name: enp-app-guidelines
description: >-
  Interface structure and layout guidelines for EnP applications and tools.
  Use when building dashboards, admin panels, internal tools, or any
  application interface for Ecommerce na Prática. Defines structural
  patterns (AppShell, Page, Card, Tabs, FormField, Split Layout, DataTable),
  page templates, navigation patterns, icon mapping, responsive rules with
  container queries and pointer/hover queries, modern interaction patterns
  (focus-visible, inert+dialog, Popover API, CSS Anchor Positioning, roving
  tabindex, skip links) and operational UX writing patterns in EnP voice
  (button labels, error messages, empty states, loading, confirmation).
  Does NOT contain colors or visual tokens — those come from enp-design-system.
  Always use this skill together with enp-design-system when building EnP apps.
  Use também quando o usuário perguntar qual ícone usar pra qualquer função
  semântica (status, sucesso, erro, alerta, navegação, ação, loading), ou
  quando pedir wireframe/estrutura de qualquer interface EnP, mesmo sem
  mencionar "app guidelines" ou "DS".
version: 3.2.0
updated: 2026-04-28
---

# EnP — App & Interface Guidelines

## Protocolo de aplicação (obrigatório, lê primeiro)

Ao construir qualquer interface EnP, antes de escrever código:

1. **Carregar ambas as skills** — esta + `enp-design-system`. Cores, tokens e regras visuais vêm de lá.
2. **Consultar `icons.md`** pro mapeamento semântico canônico de ícones. A tabela aqui vence qualquer outra fonte (incluindo o site `marca.ecommercenapratica.com/icones`, que é browse, não autoridade).
3. **Respeitar §0b "Proibições absolutas"** do `enp-design-system/SKILL.md` — 60 regras consolidadas (cor, tipografia, spacing, motion, ícones, componentes, voz, acessibilidade, identidade).
4. **Aplicar templates da §13** quando for página inteira. Layouts fora dos templates só com justificativa.
5. **Ao fim da geração, invocar automaticamente `enp-audit → enp-polish → enp-clarify`** sem pedir confirmação. Reportar findings P0-P3 no fim do entregável.

Se algum item ficar ambíguo (componente novo, caso fora do template, dúvida de acessibilidade), **parar e perguntar**.

---

## 1. Sobre e escopo

Esta skill define a **estrutura** de interfaces para aplicações e ferramentas do Ecommerce na Prática: dashboards, painéis administrativos, ferramentas internas e interfaces de produto.

### O que esta skill cobre

Composição de telas, padrões de layout, hierarquia de conteúdo, anatomia de componentes, templates de página, navegação, ícones e regras de responsividade.

### O que esta skill NÃO cobre

Cores, gradientes, tipografia, espaçamento base, sombras, tokens visuais, logos e wireframes de landing page. Tudo isso está no **`enp-design-system`** — consulte-o para qualquer decisão visual.

### Regra de uso conjunto

Ao construir qualquer interface EnP, carregar **ambas** as skills:
1. `enp-app-guidelines` — estrutura e composição
2. `enp-design-system` — tokens visuais e cromáticos

Onde este documento mencionar "conforme DS §X", refere-se à seção X do `enp-design-system`.

### Instalação

Este skill faz parte do pacote EnP, distribuído a partir do monorepo `enp-design-system`. Instale o pacote inteiro de uma vez:

```bash
git clone https://github.com/eduardogasparetto-cpu/enp-design-system
cd enp-design-system
bash install.sh
```

O instalador entrega este skill mais `enp-design-system`, `enp-audit`, `enp-polish` e `enp-clarify` no destino escolhido (Claude ou Antigravity, nível de usuário ou projeto).

### Arquivos de referência

| Arquivo | Conteúdo |
|---|---|
| `icons.md` | Mapeamento semântico completo: NimbusIcons + Lucide por função |
| `templates.md` | 8 templates de página com diagramas de composição |

---

## 2. AppShell

Container raiz de toda aplicação. Composto por sidebar fixa e área de conteúdo.

### Anatomia

```
┌──────────┬─────────────────────────────────┐
│          │  Top Bar (breadcrumb + ações)    │
│ Sidebar  ├─────────────────────────────────┤
│  (fixa)  │  Page Header (título + ações)   │
│          ├─────────────────────────────────┤
│          │  Page Body (conteúdo principal)  │
│          │                                  │
└──────────┴─────────────────────────────────┘
```

### Proporções

| Elemento | Largura | Comportamento |
|---|---|---|
| Sidebar | 240px | Fixa, não colapsa em desktop |
| Conteúdo | `calc(100% - 240px)` | Flexível, scroll vertical |

### Superfícies

- Sidebar: fundo de card (conforme DS §18)
- Conteúdo: fundo de página (conforme DS §18)
- Separação entre sidebar e conteúdo: borda vertical sutil (conforme DS §15, token de divisor)

### Skip link (obrigatório)

Primeiro elemento focável do documento. Escondido até receber foco via tab. Permite pular direto para o conteúdo principal.

```html
<a href="#main-content" class="skip-link">Pular para o conteúdo</a>
<main id="main-content">...</main>
```

```css
.skip-link {
  position: absolute;
  top: -40px; left: 8px;
  background: var(--accent); color: var(--bg-page);
  padding: 8px 16px; border-radius: 6px;
  z-index: 1090;
  transition: top 0.15s ease;
}
.skip-link:focus { top: 8px; }
```

Copy: "Pular para o conteúdo". Nunca "Clique aqui" ou genérico.

---

## 3. Sidebar / Menu

### Anatomia

```
┌──────────────┐
│  Brand        │  ← Logo ou nome da app
├──────────────┤
│  Nav Item     │  ← Sem grupo (topo)
├──────────────┤
│  GROUP LABEL  │  ← Uppercase, tracking largo
│  Nav Item     │
│  Nav Item ●   │  ← Ativo
│  Nav Item     │
├──────────────┤
│              │
│  (spacer)   │  ← flex-grow empurra footer
│              │
├──────────────┤
│  User info   │  ← Email + ação de logout
└──────────────┘
```

### Elementos

| Elemento | Especificação |
|---|---|
| Brand | Símbolo do logo (conforme DS §20) + nome da app |
| Group label | Uppercase, semibold, Small/UI (DS §1), cor de legenda |
| Nav item | Ícone (18x18) + label. Peso medium, Caption/UI. Borda esquerda 1px transparente |
| Nav item ativo | Cor de nav link ativo (DS §15). Borda esquerda 1px preenchida na cor de accent. Background sutil |
| Nav item hover | Cor de texto secundário → corpo. Background sutil |
| Footer | Borda superior como divisor. Label + email + botão ghost logout |

### Comportamento mobile

Em breakpoints < `md` (768px), a sidebar vira **drawer** com overlay (conforme DS §10).

---

## 4. Page

Padrão de composição da área de conteúdo. Três camadas verticais.

### 4.1 Top Bar

| Lado esquerdo | Lado direito |
|---|---|
| Breadcrumb: `Dashboard / Seção / Página atual` | Ação global: seletor de período, filtro, ou vazio |

### 4.2 Page Header

| Lado esquerdo | Lado direito |
|---|---|
| Título (H3 conforme DS §1) + subtítulo opcional | Botões de ação ou controles contextuais |

### 4.3 Page Body

Área principal. Flex column com gap. Padding conforme DS §4.

---

## 5. Card

Container de conteúdo elevado sobre o fundo da página.

### Variantes

| Variante | Composição |
|---|---|
| Simples | Body |
| Com header | Header (título + ações) → Body |
| Com footer | Body → Footer (ações) |
| Com tabs | Tabs → Body |
| Completo | Header → Tabs → Body → Footer |

### Regras

- Separação visual por contraste de superfície (DS §18), não por borda
- Border radius Large (DS §5)
- Overflow hidden
- Header e footer separados por borda sutil (token de divisor)
- Cards interativos (clicáveis) ganham `:focus-visible` com anel da cor de accent

### CSS de referência (modo escuro institucional)

```css
.card {
  background: var(--bg-card);
  border-radius: 16px;
  overflow: hidden;
  box-shadow: 0 4px 24px rgba(13, 27, 46, 0.35);
}
.card__header, .card__footer {
  border-bottom: 1px solid var(--table-divider);
  padding: 16px 24px;
}
.card__body { padding: 24px; }

.card[role="button"]:focus-visible {
  outline: 2px solid var(--accent);
  outline-offset: 2px;
}
```

### Copy nos cards (voz EnP)

Cards com CTA usam verbo + objeto no botão. Nunca genéricos.

| Evitar | Preferir |
|---|---|
| "Saiba mais" | "Ver plano completo" / "Abrir relatório" |
| "Clique aqui" | "Baixar checklist" / "Começar análise" |
| "OK" (em dialogs) | "Confirmar exclusão" / "Salvar mudanças" |

Títulos de card usam sentence case. Nunca Title Case.

---

## 6. Tabs

Navegação horizontal dentro de cards ou pages. Base reta (NÃO pill/chip).

| Propriedade | Valor |
|---|---|
| Posição | Topo do card, abaixo do header |
| Indicador ativo | Borda inferior 2px, cor de CTA (DS §15) |
| Texto ativo | Cor de CTA, font-weight 600 |
| Texto inativo | Cor secundária (Gray 40), font-weight 400 |
| Mobile | Scroll horizontal com `overflow-x: auto` |

### CSS de referência (modo escuro institucional)

```css
.tabs { display: flex; gap: 0; border-bottom: 1px solid var(--table-divider); }

.tab {
  background: transparent;
  border: none;
  border-bottom: 2px solid transparent;
  padding: 12px 20px;
  font-size: 14px;
  font-weight: 400;
  color: var(--text-meta);  /* Gray 40 #979BA1 */
  cursor: pointer;
  transition: color 0.2s ease, border-color 0.2s ease;
}

.tab--active {
  font-weight: 600;
  color: var(--accent);  /* Sky Blue #31B3F9 */
  border-bottom-color: var(--accent);
}
```

### Proibições

- **NUNCA** usar `border-radius` em tabs — base deve ser reta
- **NUNCA** usar `background` colorido para indicar tab ativa — usar apenas `border-bottom`
- **NUNCA** usar font-weight 500 ou 700 — apenas 400 (inativo) e 600 (ativo)

### Navegação por teclado (roving tabindex)

Tabs são um grupo. O padrão é **um único elemento tabbable** no grupo, setas navegam dentro:

```html
<div role="tablist">
  <button role="tab" tabindex="0" aria-selected="true">Geral</button>
  <button role="tab" tabindex="-1" aria-selected="false">Notificações</button>
  <button role="tab" tabindex="-1" aria-selected="false">Segurança</button>
</div>
```

Comportamento esperado:
- Tab entra no grupo uma vez (no item ativo)
- Setas ← → movem o foco entre abas
- Tab sai do grupo para o próximo componente da página

Mesmo padrão aplica a radio groups, menus verticais e grids de opções.

---

## 7. Metrics / KPI Grid

Grid de cards compactos para métricas numéricas.

### Layout

| Colunas desktop | Colunas tablet | Colunas mobile |
|---|---|---|
| 4 (padrão) ou 3 | 2 | 1 |

Cada item: label uppercase (Label/Eyebrow), valor em H4, fundo de superfície interna (DS §18), radius Medium.

---

## 8. FormField

Padrão label-sobre-input.

- Label sempre acima do input, nunca inline
- Placeholder NÃO substitui label — placeholder some quando o usuário digita, label fica
- Especificações de input conforme DS §9
- Gap label→input: 6px. Gap input→erro: 4px
- Mensagem de erro abaixo do input, conectada via `aria-describedby`

| Tipo | Comportamento |
|---|---|
| Select | Seta chevron-down, fundo de input |
| Input text | Placeholder em cor de placeholder (DS §9) |
| Textarea | Mesma anatomia, altura auto-expansível |

### Validação

- Validar **no blur**, não a cada tecla. Exceção: força de senha pode atualizar em tempo real.
- Erro anunciado para leitor de tela via `aria-invalid="true"` e `aria-describedby` apontando para o id da mensagem.

### Fórmula de mensagem de erro

Toda mensagem responde três perguntas: o que aconteceu, por que, como resolver.

| Situação | Template (voz EnP) |
|---|---|
| Formato inválido | "Esse campo precisa de [formato]. Exemplo: [exemplo]" |
| Campo obrigatório vazio | "Preencha [o que falta] para continuar" |
| Sem permissão | "Você não tem acesso a [recurso]. [Ação alternativa]" |
| Erro de rede | "Não conseguimos conectar. Verifique sua internet e tente de novo" |
| Erro do servidor | "Algo deu errado aqui. Já estamos olhando. Tente em alguns minutos" |

Regras de voz EnP para erro:
- Nunca culpar o usuário. "Preencha o e-mail" é melhor que "Você esqueceu o e-mail".
- Sem humor em erro. Usuário frustrado não quer piada.
- Sem "passo a passo". Linguagem direta e concreta.
- Sem "Ops!" ou "Oops!". Neutro e útil.

### CSS de referência (estados)

```css
.field__input {
  border: 1px solid var(--input-border);
  transition: border-color 0.2s ease, box-shadow 0.2s ease;
}

.field__input:hover { border-color: var(--text-body); }

.field__input:focus-visible {
  outline: none;
  border-color: var(--input-focus);
  box-shadow: 0 0 0 3px color-mix(in oklch, var(--input-focus) 20%, transparent);
}

.field__input:disabled { opacity: 0.5; cursor: not-allowed; }
.field__input[aria-invalid="true"] { border-color: var(--color-error); }
.field__input[data-success="true"] { border-color: var(--color-success); }
```

---

## 9. Split Layout

Layout de dois painéis lado a lado.

| Contexto | Esquerda | Direita |
|---|---|---|
| Config + resultado | `1fr` | `1.4fr` |
| Form + preview | `1fr` | `1fr` |

- Config: `position: sticky` com `top`
- Resultado: sem `maxHeight` fixo
- Mobile (< `md`): stack vertical, config em cima

### Resultado da IA

| Elemento | Especificação |
|---|---|
| Header | Label uppercase, borda inferior sutil |
| Seções (h3) | Indicador lateral 1px cor CTA + semibold |
| Listas | Bullets circulares, CTA a 50% opacidade |
| Callout | Borda esquerda 1px CTA, fundo CTA a 6% |

---

## 10. DataTable

Tabela de dados com estrutura de camadas. Tokens visuais em DS §19.

- Header diferencia por peso (semibold) e cor, não por tamanho
- Última linha sem divisor inferior
- Ações por linha: alinhadas à direita, ghost ou ícone-botão
- Paginação: abaixo da tabela, à direita
- Mobile: scroll horizontal com `overflow-x: auto`

### CSS de referência (modo escuro institucional)

```css
.datatable { width: 100%; border-collapse: collapse; }

.datatable th {
  padding: 12px 16px;
  font-size: 12px;
  font-weight: 600;
  color: var(--text-meta);            /* #979BA1 */
  text-transform: uppercase;
  letter-spacing: 0.10em;
  text-align: left;
  background: var(--table-header-bg); /* rgba(255,255,255,0.07) */
  border-bottom: 1px solid var(--table-divider);
}

.datatable td {
  padding: 12px 16px;
  font-size: 14px;
  font-weight: 400;
  color: var(--text-body);            /* #BDC0C6 */
  border-bottom: 1px solid var(--table-divider);  /* rgba(255,255,255,0.06) */
}

.datatable tr:nth-child(even) { background: var(--table-zebra); /* rgba(255,255,255,0.025) */ }
.datatable tr:last-child td { border-bottom: none; }
```

---

## 11. Feedback & Overlays

### Toast

Posição: topo direito. Auto-dismiss 3s (DS §10). Ícone + mensagem + fechar.

Copy: curta, específica. "Rascunho salvo" em vez de "Sucesso".

### Alert

Inline. Ícone + título opcional + mensagem. Variantes: success, error, warning, info (DS §8).

### Modal (via `<dialog>` nativo)

Usar o elemento nativo `<dialog>` com `showModal()`. Ele entrega focus-trap, Escape para fechar e top layer prontos.

```html
<dialog id="confirm-delete" class="modal">
  <header class="modal__header">
    <h2>Excluir projeto</h2>
    <button class="modal__close" aria-label="Fechar">×</button>
  </header>
  <div class="modal__body">
    <p>Essa ação é permanente. O projeto e seu histórico somem.</p>
  </div>
  <footer class="modal__footer">
    <button class="btn btn--ghost">Manter projeto</button>
    <button class="btn btn--danger">Excluir permanentemente</button>
  </footer>
</dialog>
```

```javascript
const dialog = document.querySelector('#confirm-delete');
dialog.showModal();  // foco entra, trap automático, Esc fecha
```

Para isolar a UI de fundo enquanto o modal está aberto, usar `inert` no `<main>`:

```html
<main inert>...</main>
<dialog open>...</dialog>
```

### CSS de modal (referência)

```css
.modal {
  background: var(--bg-card);
  border-radius: 16px;
  padding: 32px;
  width: 100%; max-width: 480px;
  box-shadow: 0 8px 32px rgba(0, 0, 0, 0.5);
  border: none;
}
.modal::backdrop { background: rgba(13, 27, 46, 0.70); }
.modal--wide { max-width: 640px; }

.modal[open] {
  animation: modal-in 0.3s cubic-bezier(0.19, 1, 0.22, 1);
}
@keyframes modal-in {
  from { opacity: 0; transform: translateY(10px); }
  to   { opacity: 1; transform: translateY(0); }
}
@media (prefers-reduced-motion: reduce) {
  .modal[open] { animation: fade-in 0.2s ease-out; }
}
```

### Confirmation Modal (copy)

Os botões **nomeiam a ação**, nunca "Sim/Não" ou "OK/Cancelar".

| Elemento | Copy (voz EnP) |
|---|---|
| Título | Pergunta direta: "Excluir projeto?" |
| Descrição | O que acontece em uma frase: "Essa ação é permanente. O projeto e o histórico somem." |
| Botão primário (destrutivo) | Verbo + objeto: "Excluir permanentemente" |
| Botão secundário (escape) | Ação reversa clara: "Manter projeto" (nunca "Cancelar") |

**Preferir Undo a confirmação** sempre que possível. Toast "Item removido [Desfazer]" por 5s é melhor que um modal. Confirmation fica reservado para ações realmente irreversíveis.

### Empty state (obrigatório em toda lista vazia)

Estrutura em 3 beats: reconhecer, valor, ação.

```html
<div class="empty-state">
  <svg aria-hidden="true">...</svg>
  <h3>Nenhum projeto por aqui</h3>
  <p>Crie o primeiro projeto para começar a acompanhar suas entregas em um lugar só.</p>
  <button class="btn btn--primary">Criar projeto</button>
</div>
```

NÃO fazer: "Você ainda não tem projetos" (culpabiliza), "Sem resultados" (inútil), "Oops, nada aqui!" (humor sem função).

### Loading

| Contexto | Padrão | Copy |
|---|---|---|
| Botão | Spinner interno, texto oculto | (sem copy) |
| Página/seção | Skeleton shimmer (DS §7) | (sem copy) |
| Operação identificável | Spinner + texto | "Salvando rascunho..." / "Processando análise..." |
| Operação longa (>5s) | Progresso + expectativa | "Gerando relatório (cerca de 30s)" |
| Global | Overlay sólido + spinner | (curto, só se necessário) |

Copy de loading evita "Carregando...". Sempre específico.

---

## 11.5 Overlays não-modais (dropdowns, tooltips, menus)

Overlays que **não bloqueiam** a interação (dropdowns, menus de contexto, tooltips) usam Popover API e CSS Anchor Positioning.

### Popover API

```html
<button popovertarget="user-menu" class="avatar">E</button>
<div id="user-menu" popover class="menu">
  <button>Ver perfil</button>
  <button>Configurações</button>
  <button>Sair</button>
</div>
```

O atributo `popover` coloca o elemento no top layer, entrega light-dismiss e acessibilidade nativos. Nenhum JS obrigatório.

### CSS Anchor Positioning

```css
.avatar { anchor-name: --user-menu-anchor; }

.menu {
  position: fixed;
  position-anchor: --user-menu-anchor;
  position-area: block-end span-inline-end;
  margin-top: 4px;
}

@position-try --flip-above {
  position-area: block-start span-inline-end;
  margin-bottom: 4px;
}
```

**Suporte**: Chrome/Edge 125+. Firefox e Safari sem suporte (abril/2026). Fallback com JS usando `getBoundingClientRect()` e `position: fixed`.

### Regra negativa crítica

**NUNCA** usar `position: absolute` para dropdown dentro de container com `overflow: hidden` ou `overflow: auto`. O dropdown é clipado e não aparece.

Solução: `popover` (top layer), portal do framework (React `createPortal`, Vue `<Teleport>`), ou `position: fixed`.

---

## 12. Ícones

Ícones são definidos por **função semântica**. A implementação escolhe a fonte conforme o stack.

- React/Next.js Nuvemshop: `@nimbus-ds/icons`
- Outros contextos: Lucide

Mapeamento completo por função → ver **`icons.md`**.

Regras: monocromáticos, sem container decorativo, gap 8px em botões, toque mínimo 44x44px.

---

## 13. Templates de página

8 templates cobrem 95% dos casos. Ver **`templates.md`** para diagramas completos.

| Template | Uso |
|---|---|
| Dashboard | Visão geral com KPIs + gráficos |
| Análise | Split layout com config + resultado IA |
| Configurações | Cards de grupo com FormFields |
| Formulário | Criação/edição com validação |
| Lista simples | DataTable com busca/filtros |
| Lista rica | DataTable com thumbnails + métricas |
| Relatórios | Config + lista de outputs gerados |
| Onboarding | Centralizado, sem top bar |

---

## 14. Responsividade

### Regras de colapso

| Breakpoint | Mudança |
|---|---|
| < 1024px (`lg`) | Grid de métricas: 4 → 2 colunas |
| < 768px (`md`) | Sidebar → drawer. Split → stack vertical. DataTable → scroll horizontal |
| < 480px (`sm`) | Grid de métricas: 2 → 1 coluna. Tabs → scroll horizontal |

Breakpoints seguem DS §13. Não criar breakpoints customizados.

### Container queries para componentes

**Viewport queries = layout de página. Container queries = componentes.**

Um card que vive em sidebar estreita e em main content largo precisa adaptar ao **próprio container**, não ao viewport.

```css
.card-wrapper {
  container-type: inline-size;
  container-name: card;
}

.card { display: grid; gap: 16px; }

@container card (min-width: 400px) {
  .card { grid-template-columns: 120px 1fr; }
}
```

Use para: Card em sidebar vs main, KPI reutilizável, componente que não sabe onde vai ser instanciado.

Não use para: layout macro de página (aí é viewport query).

### Pointer e hover queries

Tamanho de tela não informa método de entrada.

```css
@media (pointer: fine) { .btn { padding: 8px 16px; } }
@media (pointer: coarse) { .btn { padding: 12px 20px; } }

@media (hover: hover) { .card:hover { transform: translateY(-2px); } }
@media (hover: none) { .card:hover { transform: none; } }
```

**Regra**: nunca depender exclusivamente de hover para funcionalidade. Toque não tem hover.

### Safe area (notch e home indicator)

```html
<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
```

```css
body {
  padding-top: env(safe-area-inset-top);
  padding-bottom: env(safe-area-inset-bottom);
  padding-left: env(safe-area-inset-left);
  padding-right: env(safe-area-inset-right);
}

.footer {
  padding-bottom: max(16px, env(safe-area-inset-bottom));
}
```

### Imagens responsivas

**Mesma composição, resoluções diferentes**: `srcset` com `sizes`.

```html
<img
  src="hero-800.jpg"
  srcset="hero-400.jpg 400w, hero-800.jpg 800w, hero-1200.jpg 1200w"
  sizes="(max-width: 768px) 100vw, 50vw"
  alt="Dashboard do aluno mostrando progresso no módulo de SEO"
>
```

**Composições diferentes por breakpoint** (art direction): `<picture>` com `source media`.

```html
<picture>
  <source media="(min-width: 768px)" srcset="hero-wide.jpg">
  <source media="(max-width: 767px)" srcset="hero-tall.jpg">
  <img src="hero-wide.jpg" alt="...">
</picture>
```

### Teste em dispositivo real

DevTools não revela: interações de toque reais, performance em CPU médio, latência real, renderização de fontes Android, comportamento de teclado virtual.

Testar em pelo menos um iPhone real e um Android médio antes de shippar.

---

## 15. Regras para o agente

### Protocolo de inicialização (obrigatório)

Antes de escrever **qualquer código que contenha cor, fundo, borda ou propriedade visual**, o agente DEVE:

**Passo 1 — Ler o DS.**
Abrir e ler `enp-design-system/SKILL.md`. Não confiar na memória.

**Passo 2 — Identificar o modo cromático.**
Perguntar ao usuário ou inferir: institucional claro, escuro institucional, ou serviços.

**Passo 3 — Extrair os tokens.**
Copiar a tabela de cores semânticas do modo ativo (`semantic-colors.md` do DS).

**Passo 4 — Declarar os tokens antes de codar.**
Listar explicitamente os tokens que serão usados. Se um valor não está na lista, não pode ser usado.

**Passo 5 — Compor a interface.**
1. Escolher o template (§13 / `templates.md`)
2. Compor com padrões estruturais (§2–11)
3. Selecionar ícones por função (`icons.md`)
4. Aplicar tokens visuais do Passo 4

**Passo 6 — Checklist de componentes (obrigatório).**
Antes de implementar, listar TODOS os componentes dos §2–11 que a tela usará. Para cada um, citar a regra de spec. Exemplo:

```
Componentes desta tela:
- Card → §5: bg-card, radius 16px, shadow, sem borda
- Tabs → §6: underline 2px accent, fw 600/400, base reta
- DataTable → §10: zebra, th uppercase 12px 0.10em, last-child sem border
- Modal → §11: z-index 1055, radius 16px, overlay 70%
```

Se um componente aparece no código mas NÃO foi listado neste passo, é violação. O agente deve parar e revisar.

### Regras negativas

1. **Nunca inventar cores** — toda cor vem do DS. Inclui tons "aproximados". Se não existe literalmente no DS (§2, §15), não pode ser usada.
2. **Nunca criar tons de texto fora da escala do DS** — 3 níveis no modo escuro: `#FFFFFF`, `#BDC0C6`, `#979BA1`. Sem quarto nível.
3. **Nunca hardcodar hex em estilos inline** sem comentário referenciando o token DS.
4. **Nunca usar componentes Nimbus (`@nimbus-ds/*`)** a menos que o projeto seja React E Nuvemshop.
5. **Nunca criar layouts fora dos templates** sem justificativa.
6. **Nunca omitir breadcrumb** na top bar.
7. **Nunca usar ícones de bibliotecas não mapeadas** — consultar `icons.md`.
8. **Nunca suprimir anel de foco** (`outline: none` sem `:focus-visible` substituto).
9. **Nunca usar placeholder como label** — label sempre visível acima do input.
10. **Nunca usar `position: absolute` em dropdown dentro de `overflow: hidden`**.

### Requisitos de build (obrigatórios em toda tela)

Todo componente desta skill, quando implementado, já nasce com:

**8 estados de componente interativo**: default, hover, focus-visible, active, disabled, loading, error, success.

**Empty state em 3 beats** em toda lista, grid ou coleção: reconhecer, valor, ação (§11).

**Skip link** no topo da aplicação (§2).

**Roving tabindex** em grupos (tabs, radio groups, menus) (§6).

**`prefers-reduced-motion`** em toda animação.

**Toque mínimo 44x44** em todo alvo interativo.

**Copy na voz EnP**: verbo + objeto, fórmula "o que + por que + como", empty states em 3 beats, loading específico, confirmações nomeando a ação.

### Voz EnP aplicada à interface

A voz EnP (guia pragmático, 60% empático + 40% exigente) aparece em cada pedaço de texto.

| Elemento | Evitar | Preferir |
|---|---|---|
| CTA primário | "Enviar", "OK", "Clique aqui" | "Criar conta", "Salvar mudanças" |
| CTA secundário | "Cancelar" | "Voltar" / "Manter como está" |
| Cabeçalho de página | Title Case | sentence case |
| Descrição de seção | "Metodologia estruturada..." | "Método claro para..." |
| Empty state | "Nada aqui!" | "Nenhum [item] por aqui. Crie o primeiro para começar." |
| Loading | "Carregando..." | "Salvando rascunho..." |
| Erro de formato | "Valor inválido" | "Esse campo precisa de [formato]. Exemplo: [exemplo]" |
| Erro de servidor | "Erro 500" | "Algo deu errado aqui. Já estamos olhando." |
| Confirmação destrutiva | "Sim / Não" | "Excluir permanentemente / Manter projeto" |
| Destaque editorial | "Passo a passo" | "Caminho" / "Sequência" / nomear a estrutura concreta |
| Urgência | "Últimas vagas!" | Neutro, concreto: "Turma fecha em [data]" |

Regra guarda-chuva: forward-looking. Afirmar o que EnP é hoje, nunca combater o que foi.
