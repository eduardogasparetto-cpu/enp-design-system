---
name: enp-design-system
description: Design system specification for Ecommerce na Prática (EnP). Use this skill when building any interface, component, landing page, email, social asset, or tool for EnP. Contains all visual tokens, color modes, typography, spacing, gradients, buttons, states, overlays, aspect ratios, transitions, semantic color tables validated for WCAG contrast, table specification with opacity-based theming, logo usage rules with auto-selection by chromatic mode, a wireframe catalog with 19 template categories, and an agent implementation protocol with initialization steps, negative rules, CSS bootstrap blocks and post-build validation checklist. Always consult this skill before generating any EnP visual output.
version: 3.0.0
updated: 2026-03-29
base: Nuvemshop Brand Design Guidelines v1
---

# EnP — Design System 2026

## Sobre

Adaptação do Design System institucional da Nuvemshop para o Ecommerce na Prática. A Nuvemshop usa Nimbus Blue `#0050C3`, tipografia mono-fonte e um único modo visual. O EnP manteve Plus Jakarta Sans e o sistema de espaçamento base 4px, mas substituiu a paleta cromática por identidade própria com três modos (institucional claro, escuro institucional e serviços), 11 gradientes nomeados e semântica WCAG validada.

### Instalação

Cole este link no chat da sua IA e peça para instalar:

```
https://github.com/eduardogasparetto-cpu/enp-design-system
```

A IA vai copiar os arquivos para `.cursor/skills/enp-design-system/` no seu projeto.

**Instalação manual:** baixe o [ZIP do repositório](https://github.com/eduardogasparetto-cpu/enp-design-system/archive/refs/heads/main.zip), extraia e copie a pasta para `.cursor/skills/enp-design-system/`.

### Skill complementar

Para interfaces de aplicação (dashboards, painéis, ferramentas), instale também o **enp-app-guidelines**:

```
https://github.com/eduardogasparetto-cpu/enp-app-guidelines
```

### Arquivos de referência

Este SKILL.md contém os tokens e regras essenciais. Detalhes completos estão nos arquivos de referência — o agente DEVE lê-los quando precisar da informação específica:

| Arquivo | Conteúdo |
|---|---|
| `semantic-colors.md` | Tabelas §15a/b/c completas com WCAG + mapeamento componente→token §15f |
| `component-states.md` | Botões (3 variantes × 3 modos × 6 estados), inputs (3 modos × 6 estados), overlays |
| `content-rules.md` | Gradientes, sombras, transições, efeitos, aspect ratios, ritmo vertical, tabelas |
| `wireframes.md` | Catálogo de 19 categorias de wireframes para landing pages |
| `migration-guide.md` | Guia para aplicar o DS em projetos existentes |

---

## 0. Protocolo de inicialização (obrigatório)

O agente **NÃO PODE** gerar código visual para EnP sem completar esta inicialização.

### Gatilhos de ativação

| Categoria | Termos |
|---|---|
| Marca | EnP, Ecommerce na Prática, ecommerce na pratica |
| Modo | serviços, institucional, modo escuro, modo claro, dark mode |
| Peça | landing page, LP, email, componente, seção, hero, card, slide, apresentação, social, banner, página |
| DS | design system, DS, DS EnP, identidade visual, id visual, tokens |
| Produto | consultoria, escola, blog, plataforma, ferramenta, curso |

### Auto-atualização da skill (passo obrigatório)

Imediatamente após detectar o gatilho — e **antes de perguntar qualquer coisa ao usuário**:

1. Verificar se o repositório versionado existe no workspace: `enp-design-system/skill/SKILL.md`
2. Comparar `version:` do frontmatter em ambos os arquivos (skill instalada vs versionada)
3. Se a versão versionada for mais recente: copiar sobre a instalada
4. Se o repositório não existir: tentar clonar `https://github.com/eduardogasparetto-cpu/enp-design-system`. Se não for possível, prosseguir com a versão atual.
5. Re-ler a skill atualizada.

### Coleta de parâmetros

Ao detectar um gatilho, coletar via conversa antes de escrever qualquer código:

**1. Modo cromático** (obrigatório, nunca pular)

- **Institucional claro** — fundo Frost `#F4F7FB`, textos Deep Slate, CTA Button Blue `#1076DD`
- **Escuro institucional** — fundo `#212328`, textos brancos/Gray 20, CTA Sky Blue `#31B3F9`
- **Serviços** — fundo Midnight `#0D1B2E`, textos brancos/Gray 20, CTA Lightning Lime `#CDFF07`

Contextos óbvios: "consultoria"/"serviços"/"plano" = serviços. "Blog"/"escola"/"site institucional" = institucional claro.

**2. Tipo de peça** (obrigatório)

LP completa · Seção · Componente · Email · Social · Slide · Outro.

**3. Stack / Framework** (pular se óbvio)

HTML + CSS puro · React + Tailwind · Next.js · Vue · Outro.

### Após coletar os parâmetros

1. **Carregar tokens semânticos** — ler `semantic-colors.md` para o modo declarado
2. **Inicializar CSS variables** usando o bloco bootstrap da §15d abaixo
3. **Consultar wireframes** (`wireframes.md`) se for LP ou seção
4. **Aplicar escala tipográfica** da §1 com `clamp()` para responsividade
5. **Verificar regras negativas** da §15e abaixo

### Regra de bloqueio

**NUNCA** prosseguir com código visual se o modo cromático não foi definido. O agente NÃO deve assumir.

---

## 1. Tipografia

### Família

```css
font-family: 'Plus Jakarta Sans', -apple-system, BlinkMacSystemFont, "Helvetica Neue", arial, sans-serif;
```

```html
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;600&display=swap" />
```

Sem família display ou serif. Pesos: **400** (Regular) e **600** (Semibold) apenas.

### Escala tipográfica

| Nome | Desktop | Mobile (<768px) | Peso | Tracking | Leading | Uso |
|---|---|---|---|---|---|---|
| Display | 70px | 36px | 600 | -0.03em | 1.0 | Hero principal, capa |
| H1 | 58px | 36px | 600 | -0.025em | 1.05 | Título principal de seção |
| H2 | 42px | 32px | 600 | -0.025em | 1.1 | Abertura de blocos |
| H3 | 30px | 24px | 600 | -0.02em | 1.2 | Títulos de card, subseções |
| H4 | 22px | 20px | 600 | -0.01em | 1.3 | Cabeçalhos de card, preços |
| Lead/Intro | 18px | 16px | 400 | 0 | 1.5 | Primeiro parágrafo após H1/H2 |
| Body | 16px | 16px | 400 | 0 | 1.5 | Parágrafos, interface, botões |
| Body longo | 18px | 16px | 400 | 0 | 1.5 | Blog, escola, materiais |
| Caption/UI | 14px | 14px | 400 | 0 | 1.5 | Labels, textos de suporte |
| Small/UI | 12px | 12px | 400 | 0 | 1.5 | Legendas, metadados |
| Label/Eyebrow | 12px | 12px | 600 | +0.10em | - | Uppercase · rótulos, badges |

Base: 16px = 1rem. Sem itálicos. Ênfase por peso, nunca inclinação.

---

## 2. Paleta de cores

### 2.1 Institucional

| Nome | Hex | Papel |
|---|---|---|
| Frost | `#F4F7FB` | Fundo de página |
| Pure White | `#FFFFFF` | Inputs, cards, leitura densa |
| Deep Slate | `#313642` | Textos, títulos, ícones |
| Button Blue | `#1076DD` | CTA principal · links · UI |
| Sky Blue | `#31B3F9` | Ornamental — gradientes e destaques |
| Lightning Lime | `#CDFF07` | Acento pontual — badges e tags |

### 2.2 Serviços

| Nome | Hex | Papel |
|---|---|---|
| Midnight | `#0D1B2E` | Fundo de página e seções |
| Deep Slate | `#313642` | Fundo de cards sobre Midnight |
| Pure White | `#FFFFFF` | Textos principais |
| Lightning Lime | `#CDFF07` | CTA protagonista |
| Sky Blue | `#31B3F9` | Ornamental — ícones, linhas |
| Button Blue | `#1076DD` | Ponte para institucional |

### 2.3 Extensão

| Nome | Hex | Contexto |
|---|---|---|
| Nature Green | `#00CD4B` | Sucesso, crescimento, cases |
| Dawn Orange | `#FF7A27` | Energia, eventos, ativações |
| Lightning Yellow | `#F4DC18` | Atenção, destaque editorial |
| Sunset Pink | `#C3355D` | Urgência, exclusividade, erro |

### 2.4 Gray Scale

| Nome | Hex | Uso |
|---|---|---|
| Gray 80 | `#303339` | Títulos alternativos |
| Gray 60 | `#5C6167` | Textos secundários |
| Gray 40 | `#979BA1` | Metadados, suporte |
| Gray 20 | `#BDC0C6` | Divisores, bordas sutis |
| Gray 10 | `#EFF1F4` | Fundos neutros leves |

### 2.5 Tokens de opacidade (overlay/hover/glass)

| Token | Hex rgba | Uso |
|---|---|---|
| `midnight/30` | `rgba(13,27,46,0.30)` | Overlay leve |
| `midnight/55` | `rgba(13,27,46,0.55)` | Overlay de modal |
| `midnight/70` | `rgba(13,27,46,0.70)` | Overlay bloqueante |
| `midnight/80` | `rgba(13,27,46,0.80)` | Splash, onboarding |
| `white/10` | `rgba(255,255,255,0.10)` | Glass sutil escuro |
| `white/20` | `rgba(255,255,255,0.20)` | Glass cards serviços |
| `white/40` | `rgba(255,255,255,0.40)` | Glass nav pills |
| `slate/20` | `rgba(49,54,66,0.20)` | Hover sutil claro |
| `slate/40` | `rgba(49,54,66,0.40)` | Separadores translúcidos |

### 2.6 Tokens de superfície (tabelas/containers)

Opacidade sobre `slate` (`#313642`) para backgrounds e borders de dados. Ver `content-rules.md` (Tabelas) para detalhes.

| Token | Opacidade | Uso |
|---|---|---|
| `slate/10` | 10% | Borda de container de tabela |
| `slate/[0.07]` | 7% | Fundo de header de tabela |
| `slate/[0.06]` | 6% | Divisor entre linhas |
| `slate/[0.05]` | 5% | Fundo de bloco de código |
| `slate/[0.03]` | 3% | Faixa zebra (linhas pares) |

---

## 4. Espaçamento

Base: **4px**. Todo espaçamento é múltiplo de 4.

| Múltiplo | Valor | Uso |
|---|---|---|
| 2x | 8px | Gaps pequenos, ícones |
| 4x | 16px | Padding de card, gaps |
| 6x | 24px | Gap padrão, baseline |
| 8x | 32px | Espaçamento médio |
| 10x | 40px | Padding vertical de card |
| 12x | 48px | Espaçamento grande |
| 15x | 60px | Margem de seção |
| 16x | 64px | Gap de seção grande |
| 20x | 80px | Padding homepage |

Seção padrão: 120px top/bottom. Card: 40px top/bottom · 16px lados. Card completo: 40px · 32px.

---

## 5. Border radius

| Nome | Valor | Uso |
|---|---|---|
| Small | 3px | Arredondamento sutil |
| Medium | 6px | Inputs |
| Large | 16px | Cards, containers |
| Full | 32px | Badges, tags |
| Ultra | 48px | Decorativos grandes |
| Pill | 100px | Botões, pills |

---

## 13. Breakpoints e grid

| Nome | Min-width | Container max |
|---|---|---|
| xs | 0 | fluid |
| sm | 480px | 448px |
| md | 768px | 736px |
| lg | 1024px | 992px |
| xl | 1280px | 1248px |
| xxl | 1440px | 1408px |

Grid: 12 colunas. Gutter: 32px (16px por lado).

---

## 14. Z-index

| Valor | Uso |
|---|---|
| 1000 | Dropdowns |
| 1020 | Elementos sticky |
| 1030 | Elementos fixed |
| 1045 | Painéis offcanvas / drawer |
| 1055 | Modais |
| 1060 | Onboarding |
| 1080 | Tooltips |
| 1090 | Toasts · Loading/Splash |

---

## 15d. Bootstrap CSS por modo

Blocos prontos para copiar. O agente DEVE usar o bloco do modo ativo como primeira ação ao criar qualquer página ou componente.

**Modo institucional claro:**

```css
:root {
  --bg-page: #F4F7FB;
  --bg-card: #FFFFFF;
  --bg-card-inner: #F4F7FB;
  --text-heading: #313642;
  --text-body: #5C6167;
  --text-body-strong: #313642;
  --text-meta: #979BA1;
  --accent: #1076DD;
  --accent-hover: #FFFFFF;
  --accent-active: #0A5BB5;
  --link: #1076DD;
  --link-hover: #313642;
  --divider: #BDC0C6;
  --input-border: #BDC0C6;
  --input-focus: #1076DD;
}
```

**Modo escuro institucional:**

```css
:root {
  --bg-page: #212328;
  --bg-card: #2A2D33;
  --bg-card-inner: #1A1D22;
  --text-heading: #FFFFFF;
  --text-body: #BDC0C6;
  --text-meta: #979BA1;
  --accent: #31B3F9;
  --accent-hover: #5AABF5;
  --accent-active: #1A8FD1;
  --link: #31B3F9;
  --link-hover: #FFFFFF;
  --nav-active: #CDFF07;
  --divider: #979BA1;
  --input-border: #979BA1;
  --input-focus: #31B3F9;
}
```

**Modo serviços:**

```css
:root {
  --bg-page: #0D1B2E;
  --bg-card: #313642;
  --bg-card-inner: #1A2640;
  --text-heading: #FFFFFF;
  --text-body: #BDC0C6;
  --text-meta: #979BA1;
  --accent: #CDFF07;
  --accent-hover: #D9FF3D;
  --accent-active: #B8E000;
  --ornamental: #31B3F9;    /* NUNCA usar como cor de texto */
  --link: #31B3F9;
  --link-hover: #FFFFFF;
  --nav-active: #CDFF07;
  --divider: #979BA1;
  --input-border: #5C6167;
  --input-focus: #31B3F9;
}
```

---

## 15e. Regras negativas por modo

O agente DEVE ler esta seção antes de atribuir qualquer cor a qualquer elemento.

**Modo serviços — proibições:**

1. **NUNCA** usar Sky Blue (`#31B3F9`) como `color` de texto. Sky Blue é APENAS ornamental (ícones SVG, `box-shadow`, `radial-gradient`, `border` decorativa). Única exceção: links `<a>`.
2. **NUNCA** usar Sky Blue em eyebrows, headings, labels, badges, tags ou qualquer texto.
3. **NUNCA** usar `40px` como margin/padding estrutural — 40px é exclusivo para padding INTERNO de card.
4. **NUNCA** inventar valores de espaçamento: todo valor DEVE existir na tabela §4.
5. **NUNCA** usar font-size fora da escala §1: 12, 14, 16, 18, 22, 30, 42, 58, 70px.
6. Eyebrows usam cor de corpo (`--text-body`), NÃO accent nem ornamental.

**Modo institucional claro — proibições:**

1. **NUNCA** usar branco puro `#FFFFFF` como fundo de página — usar Frost `#F4F7FB`.
2. **NUNCA** usar Deep Slate para legendas — usar Gray 40 `#979BA1`.
3. **NUNCA** usar Lightning Lime como CTA — Lime é acento pontual, não protagonista.

**Todos os modos — proibições:**

1. **NUNCA** usar gradiente em texto, fundo de input, ícones < 24px, botões primários, estados de feedback, ou grid repetido.
2. **NUNCA** usar bordas para separar cards/painéis — usar contraste de `background` e/ou `box-shadow` (§18).
3. **NUNCA** usar font-weight 300, 500 ou 700 — apenas 400 e 600.

---

## 16. Ícones

Usar exclusivamente **NimbusIcons**. Documentação: https://nimbus.nuvemshop.com.br/documentation/resources/nimbus-icons

---

## 18. Superfícies e separação visual

A separação entre elementos é feita por **contraste de fundo**, não por bordas.

### Hierarquia — modo institucional claro

| Camada | Cor | Papel |
|---|---|---|
| Fundo de página | Frost `#F4F7FB` | Base geral |
| Card / painel | Pure White `#FFFFFF` | Conteúdo elevado |
| Card interno | Frost `#F4F7FB` ou Gray 10 `#EFF1F4` | Área dentro de card |

### Onde NÃO usar bordas

Cards, slides, painéis, containers de feature, pricing, grids de logo. Usar contraste de `background` e/ou `box-shadow`.

### Bordas permitidas

Tabelas, inputs, dividers explícitos `<hr>`, botão outline.

---

## 20. Logo

### Variantes

| Variante | Arquivo | Uso |
|---|---|---|
| Completo colorido | `logo-colorido-ecommerce-na-pratica.svg` | Modo claro, espaço horizontal |
| Completo branco | `logo-branco-ecommerce-na-pratica.svg` | Modos escuro e serviços |
| Símbolo azul | `simbolo-azul-ecommerce-na-pratica.svg` | Modo claro, espaços reduzidos |
| Símbolo branco | `simbolo-branco-ecommerce-na-pratica.svg` | Modos escuro e serviços |
| Avatar azul/branco | `avatar-azul-branco-ecommerce-na-pratica.svg` | Perfis de redes sociais |

### Seleção automática por modo

| Modo | Logo completo | Símbolo |
|---|---|---|
| Institucional claro | Colorido | Azul |
| Escuro institucional | Branco | Branco |
| Serviços | Branco | Branco |

Área de respiro mínima: metade da altura do símbolo em cada direção. Nunca distorcer, alterar cores, adicionar efeitos, rotacionar ou usar versão colorida sobre fundo escuro.

---

## 22. Checklist de validação pós-build

### Cores

- [ ] Modo cromático da §0 aplicado corretamente
- [ ] Nenhum texto usa Sky Blue em modo serviços (exceto links `<a>`)
- [ ] Eyebrows usam `--text-body`, não accent/ornamental
- [ ] Headings = `--text-heading`, corpo = `--text-body`, metadados = `--text-meta`
- [ ] Nenhuma cor hardcoded fora da paleta do modo ativo
- [ ] Nenhuma cor inventada (verificar contra §2 + `semantic-colors.md`)

### Tipografia

- [ ] Todos os `font-size` da escala §1 — nunca valores soltos
- [ ] Apenas pesos 400 e 600
- [ ] Plus Jakarta Sans como única fonte

### Estrutura

- [ ] Todo espaçamento é múltiplo de 4px
- [ ] Cards/painéis NÃO usam `border` para separação (§18)
- [ ] Títulos de card usam `<h3>` ou `<h4>`, hierarquia sequencial
- [ ] Seções usam `<section>` com `id`

### Referências detalhadas

Para checklist completa de ritmo vertical, espaçamentos específicos e estados de componente, consultar `content-rules.md` e `component-states.md`.
