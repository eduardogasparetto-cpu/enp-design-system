---
name: enp-design-system
description: >-
  Design system specification for Ecommerce na Prática (EnP). Use this skill
  when building any interface, component, landing page, email, social asset,
  or tool for EnP. Contains all visual tokens, color modes (with hex
  documentation and OKLCH parallel reference), typography, spacing,
  gradients, buttons, states, overlays, aspect ratios, motion tokens and
  rules, semantic color tables validated for WCAG contrast, table
  specification with opacity-based theming, logo usage rules with
  auto-selection by chromatic mode, a wireframe catalog with 19 template
  categories, and an agent implementation protocol with initialization
  steps, build requirements, negative rules, OKLCH CSS bootstrap blocks
  using color-mix for state derivation, and post-build validation checklist.
  Always consult this skill before generating any EnP visual output.
  Use também quando o usuário pedir qualquer artefato EnP em linguagem
  natural ("faz uma landing", "monta um email", "preciso de um botão",
  "design de X pra EnP", "peça pro EnP", "asset social"), independente de
  mencionar "design system" ou "DS".
version: 3.2.0
updated: 2026-04-28
base: Nuvemshop Brand Design Guidelines v1
---

# EnP — Design System 2026

## Protocolo de aplicação (obrigatório, lê primeiro)

Ao gerar **QUALQUER** artefato EnP — interface, landing page, email, social, copy, asset, slide, componente solto — seguir esta ordem antes de escrever uma linha de código ou texto:

1. **Consultar tokens, ícones, componentes e voz** desta skill e da `enp-app-guidelines`. Não confiar na memória entre sessões.
2. **Respeitar §0a (requisitos de build)** desde o primeiro pixel. Performance, motion, acessibilidade e postura institucional não são correções pós-hoc.
3. **Respeitar §0b (proibições absolutas)** abaixo. As 60 regras consolidadas são piso, não teto.
4. **Aplicar tokens só dos arquivos canônicos** — paleta da §2, escala tipográfica da §1, spacing da §4, motion via tokens. Se um valor não está documentado, **perguntar antes de inventar**.
5. **Ao fim da geração, invocar automaticamente a sequência `enp-audit → enp-polish → enp-clarify`**, sem pedir confirmação ao usuário. Reportar findings P0-P3 e correções aplicadas no fim do entregável.

Se algum item não puder ser cumprido (token faltando, caso novo, ambiguidade), **parar e perguntar**. Inventar viola o contrato desta skill.

---

## Sobre

Adaptação do Design System institucional da Nuvemshop para o Ecommerce na Prática. A Nuvemshop usa Nimbus Blue `#0050C3`, tipografia mono-fonte e um único modo visual. O EnP manteve Plus Jakarta Sans e o sistema de espaçamento base 4px, mas substituiu a paleta cromática por identidade própria com três modos (institucional claro, escuro institucional e serviços), 11 gradientes nomeados e semântica WCAG validada.

### Pacote EnP

Esta skill é parte do **pacote EnP**, distribuído a partir do repositório `enp-design-system` como monorepo. O pacote inclui:

| Skill | Papel |
|---|---|
| `enp-design-system` (esta) | Tokens visuais, cores, tipografia, espaçamento, motion, layout base |
| `enp-app-guidelines` | Estrutura de aplicações, composição, interaction patterns, UX writing operacional |
| `enp-audit` | Validação pós-hoc técnica e qualitativa contra os tokens EnP |
| `enp-polish` | Finishing pass de alinhamento, spacing e consistência micro |
| `enp-clarify` | Passe de microcopy na voz EnP (60% empático + 40% exigente) |

### Instalação

Fonte oficial: `https://github.com/eduardogasparetto-cpu/enp-design-system`

Um comando instala o pacote inteiro:

```bash
git clone https://github.com/eduardogasparetto-cpu/enp-design-system
cd enp-design-system
bash install.sh
```

O instalador oferece três destinos:

- Claude (nível de usuário, recomendado para o time EnP)
- Antigravity (nível de usuário)
- Apenas este projeto (nível de projeto, Claude)

Para atualizar quando sair nova versão:

```bash
cd enp-design-system && git pull && bash install.sh
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
6. **Aplicar requisitos de build** da §0a abaixo desde o primeiro draft

### Regra de bloqueio

**NUNCA** prosseguir com código visual se o modo cromático não foi definido. O agente NÃO deve assumir.

---

## 0a. Requisitos de build (obrigatórios desde o primeiro pixel)

Estes requisitos não são correção pós-hoc. São condições de build. Todo output EnP já nasce com tudo isso.

### Performance

- Animar apenas `transform` e `opacity`. Nunca `width`, `height`, `padding`, `margin`, `top`, `left`.
- Imagens abaixo da dobra com `loading="lazy"`.
- Fontes com `font-display: swap` e `size-adjust` override para evitar CLS.
- Não usar `will-change` preemptivamente. Só aplicar quando a animação é iminente (`:hover`, `.is-animating`).
- Ícones inline em SVG (sem requisição extra) quando possível.

### Edge cases de conteúdo (requisito de todo componente interativo)

Todo componente interativo nasce com 8 estados pensados: default, hover, focus-visible, active, disabled, loading, error, success. Nenhum estado fica "para depois".

Todo container de lista, grid, resultado de busca ou coleção nasce com **empty state em 3 beats** (reconhecer brevemente, explicar o valor, oferecer ação). Empty state não é decoração, é onboarding.

Texto com expansão prevista para i18n: contentores ganham `min-width` e `flex-wrap`, nunca dimensão fixa que quebra em alemão ou francês.

### Motion

Tokens de motion da `content-rules.md` (curvas, durações) são usados desde o primeiro draft, não adicionados depois.

`@media (prefers-reduced-motion: reduce)` é obrigatório. Sem exceção. Sem esse bloco, o build está incompleto.

### Responsivo

Mobile-first. Breakpoints da §13. Container queries para componentes que vivem em containers de largura variável.

### Acessibilidade

- `:focus-visible` em todo elemento interativo. Anel de foco nunca suprimido sem substituição.
- Toque mínimo 44x44 (padding ou pseudo-elemento expandindo hit area).
- Contraste WCAG AA como piso, AAA onde cabe.
- `alt` descritivo em imagens com conteúdo, `alt=""` em decorativas.
- `aria-label` em botões de ícone.
- Skip link no topo de aplicações.

### Postura institucional (regra negativa explícita)

Nada de:

- Bounce ou elastic em easing.
- Glassmorphism decorativo (blur usado como ornamento sem função).
- Sparklines ornamentais (gráficos minúsculos sem dado real).
- Emojis direcionais (→ no meio de texto, setas piscando).
- Urgência artificial ("Últimas vagas!", contadores fake, "Só hoje").
- Texto em gradiente.
- Fontes genéricas (Arial, Open Sans, system defaults) fora do fallback.

Essas regras decorrem do reposicionamento de estética infoproduto para credibilidade educacional institucional. Não são preferência, são identidade.

---

## 0b. Proibições absolutas (índice mestre — 60 regras)

Esta seção é o **piso**. Cada item aqui é dura — geração que viole qualquer uma é defeito P0. A regra 9 é a única **soft** (aviso, não bloqueio). Detalhes em cada capítulo referenciado.

### Cor (§2, §15a-c)
1. Sky Blue nunca como `color` de texto (exceto `<a>`). Nunca em eyebrows/headings/labels/badges/tags
2. Branco puro `#FFFFFF` nunca como fundo de página — usar Frost `#F4F7FB`
3. Deep Slate nunca em legendas — usar Gray 40 `#979BA1`
4. Preto puro `#000` nunca em texto
5. Cinza puro `#808080` nunca em lugar nenhum
6. Gradiente nunca em texto, input, ícone <24px, botão primário, estado de feedback, grid repetido
7. Nunca inventar cores fora da paleta documentada
8. Nunca tom de texto fora da escala (3 níveis no escuro: `#FFFFFF`, `#BDC0C6`, `#979BA1`)
9. **Soft:** por padrão separar cards/painéis por contraste + `box-shadow` (§18). Borda só sob pedido explícito do usuário, com aviso "padrão EnP é separação por contraste — aplicando borda conforme solicitado". Sem bloquear.

### Tipografia (§1)
10. **Plus Jakarta Sans é a tipografia oficial** em todo artefato EnP. Nenhuma outra família protagonista. Fallback CSS (sans-serif, system-ui) só pra fallback, nunca protagonista
11. Font-size nunca fora da escala: 12, 14, 16, 18, 22, 30, 42, 58, 70px
12. Font-weight só 400 e 600 — nunca 300/500/700
13. Sem itálico — ênfase por peso, nunca inclinação

### Spacing (§4)
14. 40px exclusivo de padding INTERNO de card — nunca margin/padding estrutural
15. Nunca inventar valor de spacing fora da §4

### Motion (`content-rules.md` + §0a)
16. Animar só `transform` e `opacity` — nunca `width`, `height`, `padding`, `margin`, `top`, `left`
17. Entrada de modal/drawer nunca via `top`
18. Stagger nunca passa 500ms total
19. Optimistic UI nunca em pagamentos ou ações destrutivas
20. Bounce/elastic banidos

### Ícones (§16, `enp-app-guidelines/icons.md`)
21. Ícones monocromáticos — cor por token semântico, nunca cor fixa
22. Ícone de biblioteca fora de Lucide/Nimbus nunca sem mapear primeiro em `icons.md`
23. Componentes Nimbus nunca, a menos que projeto seja React + Nuvemshop
24. **Lucide é o catálogo aberto.** Função semântica nova surgida em criação → escolher ícone Lucide e adicionar ao `icons.md` no mesmo PR

### Componentes / estrutura (`enp-app-guidelines`)
25. Tabs: nunca `border-radius`; nunca background colorido em ativa; nunca weight 500/700
26. Form: label sempre acima do input. **Nunca usar placeholder** — nem como label, nem como exemplo
27. Dropdown: nunca `position:absolute` dentro de `overflow:hidden`
28. Breadcrumb nunca omitido na top bar
29. Layouts nunca fora dos templates sem justificativa
30. Anel de foco nunca suprimido sem substituto `:focus-visible`
31. Hover nunca como única forma de interação (toque não tem hover)
32. Texto i18n nunca em dimensão fixa
33. Indicador lateral 3px banido — só 1px funcional, nunca como ornamento

### Voz / microcopy (`enp-clarify`, `app-guidelines` §15)
34. Erros nunca culpam o usuário
35. Botões nunca "Sim/Não"/"OK/Cancelar" — sempre verbo + objeto
36. Modal: secundário nunca é "Cancelar" — sempre ação reversa nomeada ("Manter projeto")
37. Loading nunca "Carregando..." genérico
38. Card nunca em Title Case (sentence case)
39. Skip link nunca "Clique aqui" genérico
40. Banidos: "passo a passo", "metodologia estruturada", "aplicável", urgência artificial
41. Nunca contrastar com "antigo EnP"/"mercado de cursos" (forward-looking)

### Identidade visual (§20)
42. Logo nunca distorcer, alterar cor, adicionar efeito, rotacionar
43. Logo colorido nunca sobre fundo escuro
44. Polish nunca muda identidade (Button Blue continua Button Blue)

### Wireframes (`wireframes.md`)
45. HTML de wireframe nunca copiado cru — sempre convertido pro framework do projeto

### Acessibilidade (§0a + `enp-audit`)
46. **Texto informativo:** contraste normal nunca abaixo de 4.5:1 (WCAG AA)
47. **Texto informativo grande** (≥18pt ou ≥14pt bold): nunca abaixo de 3:1. **Texto puramente decorativo** (background type, watermark, ornamento) **isento** desde que (a) marcado `aria-hidden="true"`, (b) não interativo, (c) informação equivalente disponível em texto com contraste adequado
48. Touch target nunca menor que 44×44px em qualquer elemento interativo
49. Animação nunca sem respeitar `prefers-reduced-motion`
50. Imagem nunca sem `alt` (decorativa = `alt=""`, conteúdo = descritivo)
51. Botão só com ícone nunca sem `aria-label`
52. Modal nunca sem focus trap e nunca sem fechar no `Esc` (usar `<dialog>` nativo + `inert` no `<main>`)

### Estrutural extra (`app-guidelines` §11)
53. Lista vazia nunca sem empty state em 3 beats (reconhecer + valor + ação)
54. Confirmação destrutiva nunca sem oferecer Undo primeiro. Modal de confirmação só pra ações genuinamente irreversíveis
55. Loading nunca genérico — variante por contexto: botão = spinner interno; página = skeleton; operação = spinner+texto; global = overlay (só se necessário)
56. `<button>` nunca sem `type` explícito (`button` / `submit` / `reset`)

### Identidade verbal
57. **"Ecommerce na Prática"** sempre por extenso, exato. Nunca "Ecomm.", "E-commerce" (com hífen), "Ecommerce & Prática", "ENP" em texto corrido
58. Sigla "EnP" só em contexto técnico interno (skill, repo, doc dev). Nunca em UI pro usuário final, copy de marketing, ou comunicação pública

### Imagem / asset
59. Foto/ilustração em produção nunca em formato não-otimizado — sempre `webp`/`avif` com fallback via `<picture>`. PNG/JPG cru só em rascunho
60. Logo nunca em PNG/JPG quando SVG disponível
60a. Logo nunca derivado de outra variante via CSS filter ou substituição de fill — sempre baixado da URL canônica da §20

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

**Documentação em hex, implementação em OKLCH.** As tabelas abaixo trazem os dois formatos lado a lado: hex como referência primária para designers e material de marca, OKLCH como representação técnica usada pelo código (§15d).

### 2.1 Institucional

| Nome | Hex | OKLCH | Papel |
|---|---|---|---|
| Frost | `#F4F7FB` | `oklch(97% 0.01 240)` | Fundo de página |
| Pure White | `#FFFFFF` | `oklch(100% 0 0)` | Inputs, cards, leitura densa |
| Deep Slate | `#313642` | `oklch(30% 0.02 258)` | Textos, títulos, ícones |
| Button Blue | `#1076DD` | `oklch(55% 0.18 252)` | CTA principal · links · UI |
| Sky Blue | `#31B3F9` | `oklch(73% 0.14 236)` | Ornamental — gradientes e destaques |
| Lightning Lime | `#CDFF07` | `oklch(94% 0.25 125)` | Acento pontual — badges e tags |

### 2.2 Serviços

| Nome | Hex | OKLCH | Papel |
|---|---|---|---|
| Midnight | `#0D1B2E` | `oklch(19% 0.04 250)` | Fundo de página e seções |
| Deep Slate | `#313642` | `oklch(30% 0.02 258)` | Fundo de cards sobre Midnight |
| Pure White | `#FFFFFF` | `oklch(100% 0 0)` | Textos principais |
| Lightning Lime | `#CDFF07` | `oklch(94% 0.25 125)` | CTA protagonista |
| Sky Blue | `#31B3F9` | `oklch(73% 0.14 236)` | Ornamental — ícones, linhas |
| Button Blue | `#1076DD` | `oklch(55% 0.18 252)` | Ponte para institucional |

### 2.3 Extensão

| Nome | Hex | OKLCH | Contexto |
|---|---|---|---|
| Nature Green | `#00CD4B` | `oklch(74% 0.23 145)` | Sucesso, crescimento, cases |
| Dawn Orange | `#FF7A27` | `oklch(71% 0.19 47)` | Energia, eventos, ativações |
| Lightning Yellow | `#F4DC18` | `oklch(89% 0.19 100)` | Atenção, destaque editorial |
| Sunset Pink | `#C3355D` | `oklch(54% 0.19 5)` | Urgência, exclusividade, erro |

### 2.4 Gray Scale

| Nome | Hex | OKLCH | Uso |
|---|---|---|---|
| Gray 80 | `#303339` | `oklch(29% 0.008 260)` | Títulos alternativos |
| Gray 60 | `#5C6167` | `oklch(47% 0.008 260)` | Textos secundários |
| Gray 40 | `#979BA1` | `oklch(67% 0.008 260)` | Metadados, suporte |
| Gray 20 | `#BDC0C6` | `oklch(79% 0.008 260)` | Divisores, bordas sutis |
| Gray 10 | `#EFF1F4` | `oklch(95% 0.005 260)` | Fundos neutros leves |

> **Nota sobre equivalências OKLCH**: os valores OKLCH foram calculados para preservar a percepção visual do hex original. Pequenas variações matemáticas entre os dois espaços são esperadas. Em caso de dúvida, o hex é a referência primária da marca.

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

### Grid auto-fit (padrão para cards sem breakpoint)

Para coleções de cards, features, depoimentos e grids de conteúdo similar, usar grid auto-fit com `minmax`. O comportamento responsivo nasce pronto, sem media query:

```css
.auto-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
  gap: 24px;
}
```

Comportamento: em viewports largos, quantas colunas couberem de 280px+ aparecem. Em mobile, colapsa naturalmente para 1 coluna. Sem `@media`.

Valores recomendados de `minmax` por tipo de card:

| Tipo de card | minmax | Uso |
|---|---|---|
| Card compacto (feature, logo) | `minmax(200px, 1fr)` | Grids de 4-6 colunas em desktop |
| Card padrão (conteúdo) | `minmax(280px, 1fr)` | Grids de 3-4 colunas |
| Card rico (com imagem grande) | `minmax(360px, 1fr)` | Grids de 2-3 colunas |

Para layouts estruturais (hero, seção de abertura, split layout), usar o grid fixo de 12 colunas.

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

## 15d. Bootstrap CSS por modo (OKLCH com derivação)

Blocos prontos para copiar. O agente DEVE usar o bloco do modo ativo como primeira ação ao criar qualquer página ou componente.

Os primitivos são declarados em OKLCH. Os estados derivados (hover, active, disabled) são calculados via `color-mix(in oklch, ...)` sobre os primitivos, não hardcoded. Isso dá interpolação perceptivamente uniforme e consistência automática se um primitivo mudar.

A documentação da §2 continua em hex como referência primária. O CSS abaixo é a camada de implementação.

**Modo institucional claro:**

```css
:root {
  /* Primitivos (equivalentes hex em §2.1 e §2.4) */
  --frost: oklch(97% 0.01 240);           /* #F4F7FB */
  --pure-white: oklch(100% 0 0);          /* #FFFFFF */
  --deep-slate: oklch(30% 0.02 258);      /* #313642 */
  --button-blue: oklch(55% 0.18 252);     /* #1076DD */
  --gray-20: oklch(79% 0.008 260);        /* #BDC0C6 */
  --gray-40: oklch(67% 0.008 260);        /* #979BA1 */
  --gray-60: oklch(47% 0.008 260);        /* #5C6167 */

  /* Semânticos */
  --bg-page: var(--frost);
  --bg-card: var(--pure-white);
  --bg-card-inner: var(--frost);
  --text-heading: var(--deep-slate);
  --text-body: var(--gray-60);
  --text-body-strong: var(--deep-slate);
  --text-meta: var(--gray-40);
  --accent: var(--button-blue);
  --accent-hover: color-mix(in oklch, var(--accent) 88%, white);
  --accent-active: color-mix(in oklch, var(--accent) 85%, black);
  --accent-disabled: color-mix(in oklch, var(--accent) 40%, var(--gray-20));
  --link: var(--button-blue);
  --link-hover: var(--deep-slate);
  --divider: var(--gray-20);
  --input-border: var(--gray-20);
  --input-focus: var(--button-blue);
}
```

**Modo escuro institucional:**

```css
:root {
  /* Primitivos */
  --bg-dark: oklch(22% 0.008 260);        /* #212328 */
  --bg-dark-card: oklch(26% 0.008 260);   /* #2A2D33 */
  --bg-dark-inner: oklch(18% 0.008 260);  /* #1A1D22 */
  --pure-white: oklch(100% 0 0);          /* #FFFFFF */
  --sky-blue: oklch(73% 0.14 236);        /* #31B3F9 */
  --lime: oklch(94% 0.25 125);            /* #CDFF07 */
  --gray-20: oklch(79% 0.008 260);        /* #BDC0C6 */
  --gray-40: oklch(67% 0.008 260);        /* #979BA1 */

  /* Semânticos */
  --bg-page: var(--bg-dark);
  --bg-card: var(--bg-dark-card);
  --bg-card-inner: var(--bg-dark-inner);
  --text-heading: var(--pure-white);
  --text-body: var(--gray-20);
  --text-meta: var(--gray-40);
  --accent: var(--sky-blue);
  --accent-hover: color-mix(in oklch, var(--accent) 85%, white);
  --accent-active: color-mix(in oklch, var(--accent) 85%, black);
  --accent-disabled: color-mix(in oklch, var(--accent) 40%, var(--gray-40));
  --link: var(--sky-blue);
  --link-hover: var(--pure-white);
  --nav-active: var(--lime);
  --divider: var(--gray-40);
  --input-border: var(--gray-40);
  --input-focus: var(--sky-blue);
}
```

**Modo serviços:**

```css
:root {
  /* Primitivos */
  --midnight: oklch(19% 0.04 250);        /* #0D1B2E */
  --deep-slate: oklch(30% 0.02 258);      /* #313642 */
  --midnight-inner: oklch(24% 0.05 250);  /* #1A2640 */
  --pure-white: oklch(100% 0 0);          /* #FFFFFF */
  --lime: oklch(94% 0.25 125);            /* #CDFF07 */
  --sky-blue: oklch(73% 0.14 236);        /* #31B3F9 */
  --gray-20: oklch(79% 0.008 260);        /* #BDC0C6 */
  --gray-40: oklch(67% 0.008 260);        /* #979BA1 */
  --gray-60: oklch(47% 0.008 260);        /* #5C6167 */

  /* Semânticos */
  --bg-page: var(--midnight);
  --bg-card: var(--deep-slate);
  --bg-card-inner: var(--midnight-inner);
  --text-heading: var(--pure-white);
  --text-body: var(--gray-20);
  --text-meta: var(--gray-40);
  --accent: var(--lime);
  --accent-hover: color-mix(in oklch, var(--accent) 88%, white);
  --accent-active: color-mix(in oklch, var(--accent) 85%, black);
  --accent-disabled: color-mix(in oklch, var(--accent) 35%, var(--gray-40));
  --ornamental: var(--sky-blue);    /* NUNCA usar como cor de texto */
  --link: var(--sky-blue);
  --link-hover: var(--pure-white);
  --nav-active: var(--lime);
  --divider: var(--gray-40);
  --input-border: var(--gray-60);
  --input-focus: var(--sky-blue);
}
```

### Suporte a navegadores

`oklch()` e `color-mix()` são suportados em navegadores modernos (Chrome 111+, Safari 16.4+, Firefox 113+). Para contextos de e-mail, newsletters, ou fallback legacy, usar os hex da §2 diretamente. Nesses casos, a derivação não está disponível e cada estado vira hex fixo.

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

O padrão do DS EnP é **Lucide** ([lucide.dev](https://lucide.dev)). Vale pra qualquer contexto — HTML puro, apresentações, Vue, Astro, React, etc. Mapeamento semântico completo e regras de uso em `enp-app-guidelines/icons.md`.

Nimbus coexiste dentro do ecossistema Nuvemshop: em qualquer projeto (React ou não) que já consuma `@nimbus-ds/icons`, continuar com Nimbus pra manter consistência com UI existente e evitar retrabalho. Documentação: https://nimbus.nuvemshop.com.br/documentation/resources/nimbus-icons

Navegação e cópia: https://marca.ecommercenapratica.com/icones

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

| Variante | Arquivo base | Uso |
|---|---|---|
| Completo colorido | `logo-colorido-ecommerce-na-pratica` | Modo claro, espaço horizontal |
| Completo branco | `logo-branco-ecommerce-na-pratica` | Fundos escuros institucionais |
| Completo escuro | `logo-escuro-ecommerce-na-pratica` | Fundos claros sem cor (papel, PDF, print) |
| Símbolo azul | `simbolo-azul-ecommerce-na-pratica` | Modo claro, espaços reduzidos |
| Símbolo branco | `simbolo-branco-ecommerce-na-pratica` | Fundos escuros, espaços reduzidos |
| Símbolo escuro | `simbolo-escuro-ecommerce-na-pratica` | Fundos claros neutros, espaços reduzidos |
| Avatar azul/branco | `avatar-azul-branco-ecommerce-na-pratica` | Perfis de redes sociais |

### URLs canônicas (CDN oficial)

Base: `https://marca.ecommercenapratica.com/images/logos/`

| Variante | URL |
|---|---|
| Completo colorido | `https://marca.ecommercenapratica.com/images/logos/logo-colorido-ecommerce-na-pratica.svg` |
| Completo branco | `https://marca.ecommercenapratica.com/images/logos/logo-branco-ecommerce-na-pratica.svg` |
| Completo escuro | `https://marca.ecommercenapratica.com/images/logos/logo-escuro-ecommerce-na-pratica.svg` |
| Símbolo azul | `https://marca.ecommercenapratica.com/images/logos/simbolo-azul-ecommerce-na-pratica.svg` |
| Símbolo branco | `https://marca.ecommercenapratica.com/images/logos/simbolo-branco-ecommerce-na-pratica.svg` |
| Símbolo escuro | `https://marca.ecommercenapratica.com/images/logos/simbolo-escuro-ecommerce-na-pratica.svg` |
| Avatar azul/branco | `https://marca.ecommercenapratica.com/images/logos/avatar-azul-branco-ecommerce-na-pratica.svg` |

### Regra de uso

Em qualquer artefato (HTML, email, landing page, slide, social, documento) referenciar o logo **pela URL canônica acima** — nunca derivar de outra variante (ex: trocar `fill: #fff` no branco para gerar a versão azul). Para artefatos que precisam funcionar offline ou ser exportados para PDF, baixar o SVG da URL canônica e referenciar localmente.

Seleção pelo modo cromático:
- Modo institucional claro → completo colorido
- Modos escuro institucional e serviços → completo branco
- Espaços reduzidos (favicon, avatar pequeno, ícone de app) → símbolo (azul em fundo claro, branco em fundo escuro)

> Variantes **escuro** (logo e símbolo) somente sob determinação explícita do usuário — nunca aplicar por iniciativa própria.

### Seleção automática por modo

| Modo | Logo completo | Símbolo |
|---|---|---|
| Institucional claro | Colorido | Azul |
| Escuro institucional | Branco | Branco |
| Serviços | Branco | Branco |

Área de respiro mínima: metade da altura do símbolo em cada direção. Nunca distorcer, alterar cores, adicionar efeitos, rotacionar ou usar versão colorida sobre fundo escuro.

### Regras de composição

**Tamanho**
- Logo completo: mínimo 100px de largura; recomendado 140px de largura em web desktop/laptop
- Abaixo de 100px de largura disponível → substituir pelo símbolo isolado
- Tamanhos para outros contextos (mobile, email, print) definidos caso a caso

**Posicionamento**
- Preferencial: alinhado à esquerda
- Centralizado permitido quando a composição exigir

**Fundo**
- Somente sobre fundos sólidos ou gradientes permitidos pelo manual (§2) que garantam contraste adequado
- Sobre fotografias permitido apenas em regiões de cor homogênea o suficiente para garantir contraste (ex: céu limpo, parede lisa, superfície uniforme) — proibido em áreas com variação de cor ou textura que comprometam a legibilidade

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
