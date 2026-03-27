---
name: enp-design-system
description: Design system specification for Ecommerce na Prática (EnP). Use this skill when building any interface, component, landing page, email, social asset, or tool for EnP. Contains all visual tokens, color modes, typography, spacing, gradients, buttons, states, overlays, aspect ratios, transitions, semantic color tables validated for WCAG contrast, table specification with opacity-based theming, logo usage rules with auto-selection by chromatic mode, a wireframe catalog with 19 template categories, and an agent implementation protocol with initialization steps, negative rules, CSS bootstrap blocks and post-build validation checklist. Always consult this skill before generating any EnP visual output.
version: 2.5.0
updated: 2026-03-24
base: Nuvemshop Brand Design Guidelines v1
---

# EnP - Design System 2026

## Sobre este skill

Este skill é uma adaptação do Design System institucional da Nuvemshop para o Ecommerce na Prática.

O sistema da Nuvemshop foi construído para uma plataforma SaaS com identidade cromática única, centrada no Nimbus Blue `#0050C3`, tipografia mono-fonte e um único modo visual. É um sistema sólido, maduro e bem documentado — e serviu como ponto de partida ideal por duas razões: a EnP compartilha a mesma fonte principal (Plus Jakarta Sans) e opera dentro do ecossistema Nuvemshop, o que torna a coerência visual entre os dois sistemas estrategicamente relevante.

O que mudou na adaptação:

- **Identidade cromática própria:** o Nimbus Blue foi substituído pelo Button Blue `#1076DD` como âncora funcional, com Sky Blue `#31B3F9` como elemento ornamental herdado da história visual do EnP e Lightning Lime `#CDFF07` como acento de conversão e protagonista no modo serviços.
- **Dois modos cromáticos:** o sistema da Nuvemshop tem um único modo. O EnP tem três — institucional (claro), institucional escuro e serviços — cada um com paleta semântica própria, validada por contraste WCAG.
- **Paleta de extensão:** a Nuvemshop usa cores de produto/segmento. O EnP usa cores de extensão temáticas com lógica de zoneamento cromático em vez de restrição por campanha.
- **Gradientes curados:** o sistema da Nuvemshop tem três gradientes funcionais. O EnP tem 11 gradientes nomeados (5 institucionais, 6 de serviços), cada um com território de uso definido.
- **Semântica validada:** todas as tabelas de cores semânticas foram calculadas com contraste WCAG 2.1.
- **Estados de componentes:** documentados para os três modos com tokens de hover, active, focus, disabled e loading.
- **Overlay patterns:** cinco padrões documentados com tokens de opacidade, blur e z-index.
- **Tabelas:** especificação completa com sistema de opacidade relativa sobre `slate` que funciona nos três modos sem ajustes.

O que permaneceu igual: Plus Jakarta Sans, sistema de espaçamento base 4px, border radius, breakpoints e grid de 12 colunas, escala de z-index, transições base e ícones NimbusIcons.

### Instalação

Cole este link no chat da sua IA (Cursor, Claude Code ou similar) e peça para ela instalar:

```
https://github.com/eduardogasparetto-cpu/enp-design-system
```

A IA vai copiar o arquivo `SKILL.md` para `.cursor/skills/enp-design-system/` no seu projeto e está pronto para uso.

**Instalação manual:** baixe o [ZIP do repositório](https://github.com/eduardogasparetto-cpu/enp-design-system/archive/refs/heads/main.zip), extraia e copie `SKILL.md` para `.cursor/skills/enp-design-system/` na raiz do seu projeto.

---

## 0. Protocolo de inicialização (obrigatório)

O agente **NÃO PODE** gerar código visual para EnP sem completar esta inicialização. Não importa se o pedido é "só um botão" ou uma LP inteira — o protocolo se aplica.

### Gatilhos de ativação

O protocolo é ativado quando a conversa menciona qualquer um destes termos no contexto de criação ou edição visual:

| Categoria | Termos |
|---|---|
| Marca | EnP, Ecommerce na Prática, ecommerce na pratica |
| Modo | serviços, institucional, modo escuro, modo claro, dark mode |
| Peça | landing page, LP, email, componente, seção, hero, card, slide, apresentação, social, banner, página |
| DS | design system, DS, DS EnP, identidade visual, id visual, tokens |
| Produto | consultoria, escola, blog, plataforma, ferramenta, curso |

### Auto-atualização da skill (passo obrigatório)

Imediatamente após detectar o gatilho — e **antes de perguntar qualquer coisa ao usuário** — o agente DEVE garantir que está usando a versão mais recente da skill:

1. **Verificar se o repositório versionado existe** no workspace: procurar `enp-design-system/skill/SKILL.md` relativo à raiz do projeto (ou caminho absoluto conhecido).
2. **Comparar versões:** ler o campo `version:` do frontmatter em ambos os arquivos:
   - Skill instalada: `.cursor/skills/enp-design-system/SKILL.md`
   - Skill versionada: `enp-design-system/skill/SKILL.md`
3. **Se a versão versionada for mais recente** (ou a skill instalada não existir): copiar o arquivo versionado sobre o instalado.
4. **Se o repositório versionado não existir** no workspace: tentar clonar `https://github.com/eduardogasparetto-cpu/enp-design-system` para `enp-design-system/` e sincronizar. Se não for possível (sem acesso à rede, permissão negada, etc.), prosseguir com a versão instalada atual e informar ao usuário.
5. **Após sincronizar:** re-ler a skill atualizada para garantir que as seções referenciadas nos próximos passos refletem o conteúdo mais novo.

> **Regra:** nunca gerar código visual com base em uma skill desatualizada quando a versão mais nova está disponível no workspace.

### Coleta de parâmetros

Ao detectar um gatilho, o agente DEVE coletar estes parâmetros via conversa antes de escrever qualquer CSS, HTML ou componente. Usar a ferramenta `AskQuestion` quando disponível. Pular um parâmetro apenas se já estiver definido na conversa ou for óbvio pelo contexto.

**1. Modo cromático** (obrigatório, nunca pular)

Opções:
- **Institucional claro** — fundo Frost `#F4F7FB`, textos Deep Slate, CTA Button Blue `#1076DD`
- **Escuro institucional** — fundo `#212328`, textos brancos/Gray 20, CTA Sky Blue `#31B3F9`
- **Serviços** — fundo Midnight `#0D1B2E`, textos brancos/Gray 20, CTA Lightning Lime `#CDFF07`

Contextos que tornam o modo óbvio (não precisa perguntar): "página de consultoria" / "serviços" / "plano" = serviços. "Blog" / "escola" / "site institucional" = institucional claro. Se ambíguo, perguntar.

**2. Tipo de peça** (obrigatório)

Opções: Landing page completa · Seção isolada (especificar: hero, features, pricing, etc.) · Componente (botão, card, input, modal, etc.) · Email/Newsletter · Social asset · Slide/Apresentação · Outro.

**3. Stack / Framework** (pular se óbvio pelo projeto)

Opções: HTML + CSS puro · React + Tailwind · Next.js · Vue · Outro.

### Após coletar os parâmetros

Com as respostas, o agente DEVE executar estes passos antes de gerar qualquer código:

1. **Carregar tokens semânticos** da §15 para o modo declarado — cores de texto, superfícies, ação e bordas
2. **Inicializar CSS variables** usando o bloco bootstrap da §15d para o modo — copiar o bloco inteiro como ponto de partida
3. **Consultar wireframes** (§21) se for LP ou seção — nunca criar do zero sem consultar o catálogo
4. **Aplicar escala tipográfica** da §1 — usar apenas tamanhos da tabela, com `clamp()` para responsividade
5. **Aplicar ritmo vertical** da §17 — todo margin/padding DEVE usar tokens múltiplos de 4px
6. **Verificar regras negativas** da §15e — ler antes de atribuir qualquer cor a qualquer elemento

### Regra de bloqueio

**NUNCA** prosseguir com código visual se o modo cromático não foi definido. Na dúvida, perguntar. Aplicar tokens errados é pior que perguntar. O agente NÃO deve "assumir serviços" ou "assumir institucional" — o modo DEVE ser explícito.

---

## 1. Tipografia

### Família

Sistema mono-tipográfico. Uma única família em todos os contextos.

```html
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;600&display=swap" />
```

```css
font-family: 'Plus Jakarta Sans', -apple-system, BlinkMacSystemFont, "Helvetica Neue", arial, sans-serif;
```

Sem família display ou serif. Não usar Ivy Presto ou qualquer fonte secundária.

### Pesos

Dois pesos apenas.

| Peso | Valor | Uso |
|---|---|---|
| Regular | 400 | Corpo de texto, parágrafos, legendas |
| Semibold | 600 | Títulos, botões, destaques, labels |

**Semibold é o peso principal.** Se uma mensagem funciona em um único peso, usar Semibold. Sem itálicos. Dar ênfase com peso, nunca com inclinação.

### Escala tipográfica

| Nome | Desktop | Mobile (<768px) | Peso | Tracking | Leading | Uso |
|---|---|---|---|---|---|---|
| Display | 70px | 36px | 600 | -0.03em | 1.0 | Hero principal, capa de apresentação |
| H1 | 58px | 36px | 600 | -0.025em | 1.05 | Título principal de seção ou LP |
| H2 | 42px | 32px | 600 | -0.025em | 1.1 | Abertura de blocos de conteúdo |
| H3 | 30px | 24px | 600 | -0.02em | 1.2 | Títulos de card, slides, itens, subseções |
| H4 | 22px | 20px | 600 | -0.01em | 1.3 | Cabeçalhos de card, preços, nomes de plano |
| Lead/Intro | 18px | 16px | 400 | 0 | 1.5 | Primeiro parágrafo após H1 ou H2 |
| Body | 16px | 16px | 400 | 0 | 1.5 | Parágrafos, descrições, interface, botões |
| Body longo | 18px | 16px | 400 | 0 | 1.5 | Blog, escola, materiais educacionais |
| Caption/UI | 14px | 14px | 400 | 0 | 1.5 | Labels de formulário, textos de suporte em cards, captions legíveis |
| Small/UI | 12px | 12px | 400 | 0 | 1.5 | Legendas, metadados, links de nav |
| Label/Eyebrow | 12px | 12px | 600 | +0.10em | - | Uppercase · rótulos de seção, badges, tags |

**Base:** 16px = 1rem. Botões e parágrafos de interface sempre em 16px. Conteúdo educacional longo usa 18px.

### Configuração tipográfica

- Tracking: -10pt (ou -1%) para textos acima de 18pt. -0.5% abaixo de 18pt.
- Word spacing: 120% mínimo, 130% ideal, 150% máximo.
- Ligaduras e stylistic sets: desligados.
- Itálicos: não utilizados.
- All caps: não usar em blocos de texto. Versaletes permitidos para indexação em até 14pt com tracking entre 50-100pt.

---

## 2. Paleta de cores

### 2.1 Paleta institucional

| Nome | Hex | Papel | Gradiente |
|---|---|---|---|
| Frost | `#F4F7FB` | Fundo de página - substitui branco puro | ✓ ponto de chegada em fades suaves |
| Pure White | `#FFFFFF` | Inputs, cards, áreas de leitura densa | ✓ base em gradientes de card |
| Deep Slate | `#313642` | Textos, títulos e ícones | - |
| Button Blue | `#1076DD` | CTA principal · links ativos · UI · fundo de banners e blocos de destaque | ✓ âncora |
| Sky Blue | `#31B3F9` | Ornamental - gradientes e destaques | ✓ luz sobre Button Blue |
| Lightning Lime | `#CDFF07` | Acento pontual - badges e tags | - |

### 2.2 Paleta serviços

| Nome | Hex | Papel | Gradiente |
|---|---|---|---|
| Midnight | `#0D1B2E` | Fundo de página e seções | ✓ base profunda |
| Deep Slate | `#313642` | Fundo de cards internos sobre Midnight | ✓ camada intermediária |
| Pure White | `#FFFFFF` | Textos principais sobre fundos escuros | - |
| Lightning Lime | `#CDFF07` | CTA protagonista · fundo de destaque | ✓ energia direcional |
| Sky Blue | `#31B3F9` | Ornamental - ícones, linhas, luz radial | ✓ luz sobre Midnight |
| Button Blue | `#1076DD` | Ponte de transição para território institucional | ✓ âncora de gradiente |

### 2.3 Paleta de extensão

Para contextos temáticos e campanhas. Múltiplas cores de extensão podem coexistir em uma peça desde que cada uma ocupe um **território espacial delimitado** - um bloco, uma seção, um card. O que não pode é duas cores de extensão dividindo o mesmo elemento sem separação clara.

| Nome | Hex | Contexto semântico | Uso |
|---|---|---|---|
| Nature Green | `#00CD4B` | Resultado, crescimento, conquista | Sucesso de sistema, cases, métricas positivas |
| Dawn Orange | `#FF7A27` | Energia, movimento, ativação | Eventos, D2C Summit, ativações presenciais |
| Lightning Yellow | `#F4DC18` | Atenção, destaque editorial | Headlines temáticas em fundos escuros |
| Sunset Pink | `#C3355D` | Urgência controlada, exclusividade | Ofertas, lançamentos, condições especiais |

### 2.4 Gray Scale

| Nome | Hex | Uso |
|---|---|---|
| Gray 80 | `#303339` | Títulos alternativos ao Deep Slate |
| Gray 60 | `#5C6167` | Textos secundários e legendas |
| Gray 40 | `#979BA1` | Metadados e informações de suporte |
| Gray 20 | `#BDC0C6` | Divisores e bordas sutis |
| Gray 10 | `#EFF1F4` | Fundos neutros leves |

### 2.5 Tokens de opacidade

Valores exclusivos de contexto de sobreposição — overlays, hover, glass e backdrop-filter. Nunca usar como cor de `border`, `background` sólido ou `color` de texto. Para bordas e divisores sólidos, usar os tokens de Gray Scale (§2.4) ou os tokens semânticos de divisor (§15).

| Token | Hex rgba | Uso |
|---|---|---|
| `midnight/30` | `rgba(13,27,46,0.30)` | Overlay leve, hover sutil em modo escuro |
| `midnight/55` | `rgba(13,27,46,0.55)` | Overlay de modal institucional |
| `midnight/70` | `rgba(13,27,46,0.70)` | Overlay bloqueante |
| `midnight/80` | `rgba(13,27,46,0.80)` | Splash, onboarding, loading total |
| `white/10` | `rgba(255,255,255,0.10)` | Glass sutil sobre fundo escuro |
| `white/20` | `rgba(255,255,255,0.20)` | Glass cards modo serviços |
| `white/40` | `rgba(255,255,255,0.40)` | Glass nav pills |
| `slate/20` | `rgba(49,54,66,0.20)` | Hover sutil modo institucional |
| `slate/40` | `rgba(49,54,66,0.40)` | Separadores translúcidos |

### 2.6 Tokens de superfície com opacidade

Valores de opacidade sobre `slate` usados como `background` e `border` em superfícies de dados. Diferente da §2.5 (overlays, hover, glass), estes tokens **são** backgrounds e borders — projetados para criar contraste relativo ao modo ativo sem cores fixas.

O token base é `slate` (Deep Slate `#313642`), que é escuro no modo claro e se inverte nos modos escuros. Qualquer percentual de opacidade gera contraste proporcional ao contexto.

| Token | Opacidade | Uso principal | Escopo |
|---|---|---|---|
| `slate/10` | 10% | Borda de container de tabela | Tabelas |
| `slate/[0.07]` | 7% | Fundo de header de tabela | Tabelas |
| `slate/[0.06]` | 6% | Divisor entre linhas de tabela | Tabelas |
| `slate/[0.05]` | 5% | Fundo de bloco de código dentro de card | Pontual |
| `slate/[0.03]` | 3% | Faixa zebra de tabela (linhas pares) | Tabelas |

#### Escopo de aplicação

**Tabelas** — uso primário e recorrente. Todos os tokens desta seção foram projetados para a especificação de tabelas (§19): container, header, faixas alternadas e divisores. A combinação dos 5 níveis garante hierarquia visual sem dependência de cores fixas.

**Pontuais** — uso secundário e restrito. `slate/[0.05]` pode ser usado em blocos de código (`<pre>`, `<code>`) embutidos dentro de cards, onde é necessário diferenciar visualmente o bloco do fundo do card sem usar `bg-frost` (que não se adapta ao modo escuro). Outros usos pontuais são permitidos desde que restritos a **áreas internas de componentes** — nunca como fundo de página, fundo de card principal, ou overlay.

#### Regras

1. **Escopo restrito:** estes tokens existem para tabelas e elementos internos de componentes. Para fundos de página, usar tokens de superfície (§18). Para overlays, usar §2.5.
2. **Não substituem Gray Scale:** para bordas sólidas e divisores convencionais, continuar usando Gray Scale (§2.4) e tokens semânticos de divisor (§15). Os tokens desta seção são para **contraste relativo**, não para bordas absolutas.
3. **Referência cruzada:** para detalhes completos de aplicação em tabelas, ver §19.

---

## 3. Gradientes

### 3.1 Gradientes institucionais

| Nome | CSS | Uso |
|---|---|---|
| Base limpa | `linear-gradient(180deg, #FFFFFF 0%, #F4F7FB 100%)` | Cards longos e modais com respiração vertical |
| Frio sutil | `linear-gradient(180deg, #F4F7FB 0%, #EBF3FD 50%, #D4E8FA 100%)` | Fundos de seção com temperatura sem azul explícito |
| Âncora → Frost | `linear-gradient(180deg, #1076DD 0%, #5BA8EF 50%, #F4F7FB 100%)` | Heroes com transição integrada ao fundo de página |
| Âncora → Sky | `linear-gradient(135deg, #1076DD 0%, #31B3F9 100%)` | Banners, heroes e seções de destaque |
| Âncora → Midnight | `linear-gradient(180deg, #1076DD 0%, #0A5BB5 50%, #0D1B2E 100%)` | Heroes escuros, transição para território de serviços |

### 3.2 Gradientes de serviços

| Nome | CSS | Uso |
|---|---|---|
| Luz de rodapé Sky | `linear-gradient(180deg, #31B3F9 0%, #313642 100%)` | Cards de feature com luz Sky emergindo da base |
| Card de conversão | `linear-gradient(180deg, #313642 0%, #1A2640 100%)` | Blocos de CTA internos e cards de oferta |
| Hero de serviços | `linear-gradient(180deg, #31B3F9 0%, #0D1B2E 100%)` | Fundo de heroes e páginas |
| Transição escura neutra | `linear-gradient(180deg, #303339 0%, #0D1B2E 100%)` | Fade de fundo neutro para profundo |
| Fundo de página longo | `linear-gradient(180deg, #0D1B2E 0%, #1A2E4A 100%)` | Páginas inteiras de serviços |
| Profundidade com dupla luz | `linear-gradient(135deg, #31B3F9 0%, #CDFF07 50%, #0D1B2E 100%)` | Heroes premium com profundidade máxima |

### 3.3 Regras negativas de gradiente

**Nunca usar gradiente em:**
- Texto corrido - parágrafos e labels sempre cor sólida
- Backgrounds de formulário - inputs, textareas e fieldsets sempre fundo sólido
- Ícones abaixo de 24px - gradientes perdem legibilidade em escala pequena
- Botões de ação primária - cor sólida para máximo contraste e clareza de CTA
- Estados de feedback (error, success, warning) - sempre cores sólidas
- Elementos repetidos em grid - cards em lista com fundo sólido ou glass
- Modo claro com baixo contraste - gradientes sutis sobre Frost podem não passar WCAG AA

**Usar gradiente apenas em:**
- Heroes e banners de seção conforme tokens da seção 3.1 e 3.2
- Glass cards sobre fundo escuro com backdrop-filter usando tokens white/10 a white/40
- Elementos decorativos de marca - bordas de jornada, separadores de modo
- Destaques com alta hierarquia visual - um elemento por seção

---

## 4. Espaçamento

Base: **4px**. Todo espaçamento é múltiplo de 4.

| Múltiplo | Valor | Uso |
|---|---|---|
| 2x | 8px | Gaps pequenos, espaçamento de ícones |
| 4x | 16px | Padding de card, gaps pequenos |
| 6x | 24px | Gap padrão, baseline |
| 8x | 32px | Espaçamento médio |
| 10x | 40px | Padding vertical de card |
| 12x | 48px | Espaçamento grande |
| 15x | 60px | Margem de seção, meia seção |
| 16x | 64px | Gap de seção grande |
| 20x | 80px | Padding de seção homepage |

### Seções

| Contexto | Valor |
|---|---|
| Padding de seção padrão | 120px top/bottom |
| Padding de seção reduzido | 60px |
| Margem de seção | 60px |
| Padding de card | 16px |
| Padding vertical de card | 40px top/bottom · 16px lados |
| Padding de card completo | 40px top/bottom · 32px lados |

---

## 5. Border radius

| Nome | Valor | Uso |
|---|---|---|
| Small | 3px | Arredondamento sutil |
| Medium | 6px | Inputs, elementos pequenos |
| Large | 16px | Cards, imagens, containers |
| Full | 32px | Badges, tags |
| Ultra | 48px | Elementos decorativos grandes |
| Pill | 100px | Botões, pills, badges |

---

## 6. Sombras

```css
/* Padrão - cards e elementos elevados */
box-shadow:
  0 24px 48px -12px rgba(50, 50, 93, 0.1),
  0 18px 36px -18px rgba(0, 0, 0, 0.1),
  0 -12px 36px -8px rgba(0, 0, 0, 0.02);

/* Suave - elevação sutil */
box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);

/* Sticky column - menus e interfaces */
box-shadow:
  4px 0 6px -2px rgba(0, 0, 0, 0.08),
  6px 0 12px -4px rgba(0, 0, 0, 0.05);

/* Dark - modo serviços e modo escuro institucional */
box-shadow:
  0 24px 48px -12px rgba(0, 0, 0, 0.4),
  0 18px 36px -18px rgba(0, 0, 0, 0.3);
```

---

## 7. Transições

### Curvas e durações

| Nome | Valor |
|---|---|
| Ease Out Expo | `cubic-bezier(0.19, 1, 0.22, 1)` |
| Ease In-Out Quad | `cubic-bezier(0.645, 0.045, 0.355, 1)` |
| Ease In-Out Quart | `cubic-bezier(0.77, 0, 0.175, 1)` |
| Duração rápida | 0.15s |
| Duração normal | 0.3s |
| Duração lenta | 0.6s |
| Duração atmosfera | 2s |

### Mapeamento por componente

| Componente | Propriedade | Duração | Curva |
|---|---|---|---|
| Botão | `all` | 0.15s | `ease-in-out` |
| Input focus | `border-color, box-shadow` | 0.2s | `ease` |
| Card hover | `transform, box-shadow` | 0.3s | `ease-out` |
| Modal entrada | `opacity, transform` | 0.3s | Ease Out Expo |
| Modal saída | `opacity, transform` | 0.2s | `ease-in` |
| Toast entrada | `opacity, transform` | 0.3s | Ease Out Expo |
| Toast saída | `opacity` | 0.2s | `ease-in` |
| Drawer | `transform` | 0.3s | Ease Out Expo |
| Tooltip | `opacity` | 0.15s | `ease` |
| Collapse | `height, opacity` | 0.3s | Ease Out Expo |
| Skeleton shimmer | `background-position` | 1.5s | `linear` · loop infinito |
| Splash fill (marca) | `clip-path` | 2s | `ease-in-out` · animação de preenchimento bottom→top |
| Splash fade-out | `opacity` | 0.3s | Ease Out Expo · após fill completo |

---

## 8. Botões

### Base

```css
.btn {
  font-family: 'Plus Jakarta Sans', sans-serif;
  font-size: 16px;
  font-weight: 600;
  padding: 12px 24px;
  border-radius: 100px;
  border: 1px solid transparent;
  cursor: pointer;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
  white-space: nowrap;
  transition: all ease-in-out 0.15s;
  outline: none;
  position: relative;
  min-height: 44px;
}
```

### Tamanhos

| Nome | Padding |
|---|---|
| Small | 8px 16px |
| Default | 12px 24px |
| Large | 16px 32px |

### Tokens de estado

| Token | Hex | Uso |
|---|---|---|
| `--color-button-active` | `#0A5BB5` | Active/pressed institucional claro |
| `--color-button-hover-dark` | `#5AABF5` | Hover modo escuro institucional |
| `--color-button-active-dark` | `#1A8FD1` | Active/pressed modo escuro |
| `--color-button-hover-services` | `#D9FF3D` | Hover modo serviços |
| `--color-button-active-services` | `#B8E000` | Active/pressed modo serviços |

### Estados - Modo institucional claro (fundo Frost)

| Estado | Background | Texto | Borda | Extra |
|---|---|---|---|---|
| Default | `#1076DD` | `#FFFFFF` | transparent | - |
| Hover | `#FFFFFF` | `#1076DD` | `1px #1076DD` | - |
| Active | `#0A5BB5` | `#FFFFFF` | transparent | `scale(0.98)` |
| Focus | `#1076DD` | `#FFFFFF` | - | ring `3px #1076DD/40 offset 2px` |
| Disabled | `#d5d7d9` | `#494B4D` | transparent | `cursor: not-allowed` |
| Loading | `#1076DD` | transparent | - | spinner branco · `cursor: wait` |

### Estados - Modo escuro institucional (fundo #303339)

| Estado | Background | Texto | Borda | Extra |
|---|---|---|---|---|
| Default | `#31B3F9` | `#0D1B2E` | transparent | - |
| Hover | `#5AABF5` | `#0D1B2E` | transparent | - |
| Active | `#1A8FD1` | `#0D1B2E` | transparent | `scale(0.98)` |
| Focus | `#31B3F9` | `#0D1B2E` | - | ring `3px #31B3F9/40 offset 2px` |
| Disabled | `#303339` | `#5C6167` | `1px #5C6167` | `cursor: not-allowed` |
| Loading | `#31B3F9` | transparent | - | spinner Midnight · `cursor: wait` |

### Estados - Modo serviços (fundo Midnight)

| Estado | Background | Texto | Borda | Extra |
|---|---|---|---|---|
| Default | `#CDFF07` | `#0D1B2E` | transparent | - |
| Hover | `#D9FF3D` | `#0D1B2E` | transparent | - |
| Active | `#B8E000` | `#0D1B2E` | transparent | `scale(0.98)` |
| Focus | `#CDFF07` | `#0D1B2E` | - | ring `3px #CDFF07/40 offset 2px` |
| Disabled | `#1A2640` | `#5C6167` | transparent | `cursor: not-allowed` |
| Loading | `#CDFF07` | transparent | - | spinner Midnight · `cursor: wait` |

### Botão secundário (outline)

Base: `background: transparent`, `border: 1px solid`, mesma font e tamanhos do primário.

**Modo institucional claro**

| Estado | Background | Texto | Borda |
|---|---|---|---|
| Default | transparent | `#1076DD` | `#1076DD` |
| Hover | `#1076DD` | `#FFFFFF` | `#1076DD` |
| Active | `#0A5BB5` | `#FFFFFF` | `#0A5BB5` |
| Focus | transparent | `#1076DD` | ring `3px #1076DD/40 offset 2px` |
| Disabled | transparent | `#979BA1` | `#BDC0C6` |

**Modo escuro institucional**

| Estado | Background | Texto | Borda |
|---|---|---|---|
| Default | transparent | `#31B3F9` | `#31B3F9` |
| Hover | `#31B3F9` | `#0D1B2E` | `#31B3F9` |
| Active | `#1A8FD1` | `#0D1B2E` | `#1A8FD1` |
| Focus | transparent | `#31B3F9` | ring `3px #31B3F9/40 offset 2px` |
| Disabled | transparent | `#5C6167` | `#303339` |

**Modo serviços**

| Estado | Background | Texto | Borda |
|---|---|---|---|
| Default | transparent | `#CDFF07` | `#CDFF07` |
| Hover | `#CDFF07` | `#0D1B2E` | `#CDFF07` |
| Active | `#B8E000` | `#0D1B2E` | `#B8E000` |
| Focus | transparent | `#CDFF07` | ring `3px #CDFF07/40 offset 2px` |
| Disabled | transparent | `#5C6167` | `#303339` |

### Botão ghost/link

Base: `background: transparent`, `border: none`, underline no hover. Sem padding lateral — ocupa o espaço do texto.

```css
.btn-ghost {
  background: transparent;
  border: none;
  padding: 0;
  font-size: 16px;
  font-weight: 600;
  text-decoration: none;
  transition: all ease-in-out 0.15s;
}
.btn-ghost:hover {
  text-decoration: underline;
  text-underline-offset: 4px;
}
```

| Modo | Texto default | Texto hover | Disabled |
|---|---|---|---|
| Institucional claro | `#1076DD` | `#313642` | `#979BA1` |
| Escuro institucional | `#31B3F9` | `#FFFFFF` | `#5C6167` |
| Serviços | `#CDFF07` | `#FFFFFF` | `#5C6167` |

### Feedback global - todos os modos

| Tipo | Background | Texto | Uso |
|---|---|---|---|
| Success | `#00CD4B` Nature Green | `#0D1B2E` | Ação concluída |
| Error | `#C3355D` Sunset Pink | `#FFFFFF` | Falha, validação |
| Warning | `#FF7A27` Dawn Orange | `#0D1B2E` | Atenção necessária |
| Info | `#31B3F9` Sky Blue | `#0D1B2E` | Informação neutra |
| Loading | `#1076DD` Button Blue | `#FFFFFF` | Processamento |

---

## 9. Inputs e formulários

### Especificação base - todos os modos

| Propriedade | Valor | Observação |
|---|---|---|
| Altura mínima | 44px | Touch target iOS/Android |
| Padding | 12px 16px | vertical · horizontal |
| Font size | 14px | Padrão Nuvemshop |
| Font weight | 400 | Regular |
| Border radius | 8px | Medium do sistema |
| Border width default | 1px | Estado padrão |
| Border width focus/error | 2px | Estados ativos |
| Label font size | 14px | Sempre acima do input |
| Label font weight | 600 | Semibold |
| Mensagem de erro | 12px | Abaixo do input |
| Transição | `border-color, box-shadow 0.2s ease` | Feedback visual suave |

### Tokens de estado

| Token | Valor claro | Valor escuro | Valor serviços |
|---|---|---|---|
| `--input-bg` | `#FFFFFF` | `#1A1D22` | `#0F1F33` |
| `--input-border` | `#BDC0C6` | `#979BA1` | `#5C6167` |
| `--input-border-focus` | `#1076DD` | `#31B3F9` | `#31B3F9` |
| `--input-border-error` | `#C3355D` | `#C3355D` | `#C3355D` |
| `--input-border-success` | `#00CD4B` | `#00CD4B` | `#00CD4B` |
| `--input-label` | `#313642` | `#BDC0C6` | `#BDC0C6` |
| `--input-label-focus` | `#1076DD` | `#31B3F9` | `#31B3F9` |
| `--input-label-error` | `#C3355D` | `#C3355D` | `#C3355D` |
| `--input-placeholder` | `#979BA1` | `#5C6167` | `#5C6167` |
| `--input-disabled-bg` | `#EFF1F4` | `#212328` | `#0A1524` |
| `--input-disabled-border` | `#BDC0C6` | `#303339` | `#303339` |

### Estados - Modo institucional claro

| Estado | Background | Borda | Label | Placeholder | Extra |
|---|---|---|---|---|---|
| Default | `#FFFFFF` | `1px #BDC0C6` | `#313642` | `#979BA1` | - |
| Focus | `#FFFFFF` | `2px #1076DD` | `#1076DD` | `#979BA1` | ring sutil |
| Filled | `#FFFFFF` | `1px #BDC0C6` | `#313642` | - | - |
| Error | `#FFFFFF` | `2px #C3355D` | `#C3355D` | `#979BA1` | mensagem abaixo |
| Disabled | `#EFF1F4` | `1px #BDC0C6` | `#979BA1` | `#BDC0C6` | `cursor: not-allowed` |
| Success | `#FFFFFF` | `2px #00CD4B` | `#313642` | - | ícone check direita |

### Estados - Modo escuro institucional

| Estado | Background | Borda | Label | Placeholder | Extra |
|---|---|---|---|---|---|
| Default | `#1A1D22` | `1px #979BA1` | `#BDC0C6` | `#5C6167` | - |
| Focus | `#1A1D22` | `2px #31B3F9` | `#31B3F9` | `#5C6167` | ring sutil |
| Filled | `#1A1D22` | `1px #979BA1` | `#BDC0C6` | - | - |
| Error | `#1A1D22` | `2px #C3355D` | `#C3355D` | `#5C6167` | mensagem abaixo |
| Disabled | `#212328` | `1px #303339` | `#5C6167` | `#303339` | `cursor: not-allowed` |
| Success | `#1A1D22` | `2px #00CD4B` | `#BDC0C6` | - | ícone check direita |

### Estados - Modo serviços (fundo Midnight)

| Estado | Background | Borda | Label | Placeholder | Extra |
|---|---|---|---|---|---|
| Default | `#0F1F33` | `1px #5C6167` | `#BDC0C6` | `#5C6167` | - |
| Focus | `#0F1F33` | `2px #31B3F9` | `#31B3F9` | `#5C6167` | ring sutil |
| Filled | `#0F1F33` | `1px #5C6167` | `#BDC0C6` | - | - |
| Error | `#0F1F33` | `2px #C3355D` | `#C3355D` | `#5C6167` | mensagem abaixo |
| Disabled | `#0A1524` | `1px #303339` | `#303339` | `#303339` | `cursor: not-allowed` |
| Success | `#0F1F33` | `2px #00CD4B` | `#BDC0C6` | - | ícone check direita |

---

## 10. Overlay patterns

| Contexto | Token | Blur | Z-index | Comportamento |
|---|---|---|---|---|
| Modal | `midnight/55` | `blur(10px)` | 1055 | Clique fora fecha |
| Onboarding | `midnight/80` | nenhum | 1060 | Só fecha por botão |
| Loading/Splash | Frost sólido `#F4F7FB` | nenhum | 1090 | Auto-dismiss |
| Dropdown | transparente | nenhum | 1000 | Clique fora fecha |
| Toast | sem overlay | nenhum | 1090 | Auto-dismiss 3s |
| Drawer/Sidebar | `midnight/40` | `blur(2px)` | 1045 | Clique fora ou swipe fecha |

---

## 11. Efeitos

| Efeito | Valor | Uso |
|---|---|---|
| Blur leve | `blur(5px)` | Nav pills, elementos flutuantes |
| Blur médio | `blur(10px)` | Cards glassmorphism · overlay de modal |
| Border-radius de imagem | 16px | Imagens e containers |

### Overlay de modal

```css
background: rgba(13, 27, 46, 0.55); /* midnight/55 */
backdrop-filter: blur(10px);
-webkit-backdrop-filter: blur(10px);
```

---

## 12. Aspect ratios e tratamento de imagem

### Ratios confirmados

| Nome | Ratio | Dimensões | Uso |
|---|---|---|---|
| Thumb / Widescreen | 16:9 | 1920×1080 | Thumbnails YouTube · banners LP |
| Quadrado | 1:1 | 1080×1080 | Feed social · avatares |
| Retrato | 4:5 | 1080×1350 | Feed Instagram · cards verticais |
| Stories | 9:16 | 1080×1920 | Stories · Reels · conteúdo vertical |

### Tratamento de imagem

| Propriedade | Valor |
|---|---|
| `object-fit` | `cover` |
| `border-radius` | 16px |
| Loading | skeleton shimmer - `background-size: 200% · animation: 1.5s linear infinite` |
| Fallback/erro | `#EFF1F4` + ícone + texto "Imagem indisponível" |
| Estado vazio | Frost + borda dashed `#BDC0C6` + ícone + texto |

> **Em construção:** ratios e estados de imagem para a plataforma de ensino serão documentados durante o redesign. Incluirá cards de curso, banners de módulo, avatares de professor e imagens de certificado.

---

## 13. Breakpoints e grid

### Breakpoints

| Nome | Min-width | Container max |
|---|---|---|
| xs | 0 | fluid |
| sm | 480px | 448px |
| md | 768px | 736px |
| lg | 1024px | 992px |
| xl | 1280px | 1248px |
| xxl | 1440px | 1408px |

### Grid

12 colunas. Gutter: 32px (16px por lado).

### Resoluções alvo LATAM

| Contexto | Resolução |
|---|---|
| Desktop primário | 1366 × 768 |
| Desktop secundário | 1920 × 1080 · 1536 × 864 |
| Mobile dominante | 360 × 800 a 412 × 915 |

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

## 15. Cores semânticas

### 15a - Modo institucional claro

| Contexto | Token | Hex |
|---|---|---|
| Headings | Deep Slate | `#313642` |
| Corpo de texto | Gray 60 | `#5C6167` |
| Corpo forte | Deep Slate | `#313642` |
| Textos secundários | Gray 60 | `#5C6167` |
| Legendas e metadados | Gray 40 | `#979BA1` |
| Links | Button Blue | `#1076DD` |
| Links hover | Deep Slate | `#313642` |
| Borda de input | Gray 20 | `#BDC0C6` |
| Foco de input | Button Blue | `#1076DD` |
| Nav links | Deep Slate | `#313642` |
| Nav link hover | Button Blue | `#1076DD` |
| Fundo de página | Frost | `#F4F7FB` |
| Fundo de card | Pure White | `#FFFFFF` |

### 15b - Modo escuro institucional

Valores exclusivos deste modo - não fazem parte da paleta principal.

| Contexto | Hex | Ratio | WCAG |
|---|---|---|---|
| **Superfícies** | | | |
| Fundo de página | `#212328` | - | - |
| Fundo de card | `#2A2D33` | - | - |
| Fundo de input | `#1A1D22` | - | - |
| **Texto** | | | |
| Headings | `#FFFFFF` | 15.72 | AAA |
| Corpo de texto | `#BDC0C6` Gray 20 | 8.62 | AAA |
| Textos secundários | `#979BA1` Gray 40 | 5.63 | AA |
| Legendas e metadados | `#979BA1` Gray 40 | 5.63 | AA |
| **Ação e navegação** | | | |
| CTA principal fundo | `#31B3F9` Sky Blue | 5.40 botão/fundo | AA |
| CTA principal texto | `#0D1B2E` Midnight | 7.37 texto/botão | AAA |
| CTA secundário fundo | `#2A2D33` | 7.57 | AAA |
| CTA secundário texto | `#BDC0C6` Gray 20 | 7.57 | AAA |
| Links | `#31B3F9` Sky Blue | 6.70 | AA |
| Links hover | `#FFFFFF` | 15.72 | AAA |
| Nav links | `#BDC0C6` Gray 20 | 8.62 | AAA |
| Nav link ativo | `#CDFF07` Lightning Lime | 13.40 | AAA |
| **Bordas e divisores** | | | |
| Borda de input | `#979BA1` Gray 40 | 6.05 | AA |
| Foco de input | `#31B3F9` Sky Blue | 7.20 | AAA |
| Divisores | `#979BA1` Gray 40 | 4.94 | non-text ✓ |

### 15c - Modo serviços

| Contexto | Token | Hex | Ratio | WCAG |
|---|---|---|---|---|
| **Superfícies** | | | | |
| Fundo de página | Midnight | `#0D1B2E` | - | - |
| Fundo de card | Deep Slate | `#313642` | - | - |
| Fundo de card interno | - | `#1A2640` | - | - |
| **Texto** | | | | |
| Headings | Pure White | `#FFFFFF` | 17.31 | AAA |
| Corpo de texto | Gray 20 | `#BDC0C6` | 9.49 | AAA |
| Textos secundários em cards | Gray 20 | `#BDC0C6` | 6.63 | AA |
| Legendas e metadados | Gray 40 | `#979BA1` | 6.20 | AA |
| **Ação e navegação** | | | | |
| CTA principal | Lightning Lime | `#CDFF07` | 14.76 | AAA |
| Texto no CTA principal | Midnight | `#0D1B2E` | 14.76 | AAA |
| CTA secundário | Pure White | `#FFFFFF` | 12.09 | AAA |
| Links | Sky Blue | `#31B3F9` | 7.37 | AAA |
| Links hover | Pure White | `#FFFFFF` | 17.31 | AAA |
| Nav links | Gray 20 | `#BDC0C6` | 9.49 | AAA |
| Nav link ativo | Lightning Lime | `#CDFF07` | 14.76 | AAA |
| **Bordas e divisores** | | | | |
| Borda de input | Gray 40 | `#979BA1` | 5.39 | AA |
| Foco de input | Sky Blue | `#31B3F9` | 6.41 | AA |
| Divisores | Gray 40 | `#979BA1` | 4.33 | non-text ✓ |

### 15d - Bootstrap CSS por modo

Blocos de CSS variables prontos para copiar como ponto de partida. O agente DEVE usar o bloco do modo ativo como primeira ação ao criar qualquer página ou componente.

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

### 15e - Regras negativas por modo

Regras do que **NÃO** fazer em cada modo. O agente DEVE ler esta seção antes de atribuir qualquer cor a qualquer elemento.

**Modo serviços — proibições:**

1. **NUNCA** usar Sky Blue (`#31B3F9`) como `color` de texto. Sky Blue é APENAS ornamental (ícones SVG, `box-shadow`, `radial-gradient`, `border` decorativa). Qualquer `color: #31B3F9` aplicado a texto é erro — a única exceção são links `<a>`.
2. **NUNCA** usar Sky Blue em eyebrows, headings, labels, badges, tags, ou qualquer string renderizada como texto.
3. **NUNCA** usar `40px` como margin ou padding estrutural — 40px (`--sp-10`) é exclusivo para padding INTERNO vertical de card (§4). Para margins entre blocos, usar 32px (`--sp-8`) ou 48px (`--sp-12`).
4. **NUNCA** inventar valores de espaçamento: todo valor DEVE existir na tabela §4. Se não existe, é erro.
5. **NUNCA** usar font-size fora da escala §1: 12, 14, 16, 18, 22, 30, 42, 58, 70px. Qualquer outro valor é erro.
6. Eyebrows e labels de seção usam cor de corpo (`--text-body` / Gray 20 `#BDC0C6`), NÃO accent e NÃO ornamental.

**Modo institucional claro — proibições:**

1. **NUNCA** usar branco puro `#FFFFFF` como fundo de página — usar Frost `#F4F7FB`.
2. **NUNCA** usar Deep Slate `#313642` para legendas e metadados — usar Gray 40 `#979BA1`.
3. **NUNCA** usar Lightning Lime como CTA principal — Lime é acento pontual no modo institucional, não protagonista.

**Todos os modos — proibições:**

1. **NUNCA** usar gradiente em texto, fundo de input, ícones < 24px, botões primários, estados de feedback, ou elementos repetidos em grid (§3.3).
2. **NUNCA** usar bordas para separar cards, slides ou painéis — usar contraste de `background` e/ou `box-shadow` (§18).
3. **NUNCA** usar font-weight 300, 500 ou 700 — apenas 400 (Regular) e 600 (Semibold).

### 15f - Mapeamento componente → token (modo serviços)

Tabela de qual token usar para cada componente. Elimina ambiguidade.

| Componente | Propriedade | Token | Hex |
|---|---|---|---|
| Eyebrow / Label de seção | `color` | Corpo | `#BDC0C6` |
| H1, H2 de seção | `color` | Heading | `#FFFFFF` |
| H3, H4 dentro de card | `color` | Heading | `#FFFFFF` |
| Parágrafo / descrição | `color` | Corpo | `#BDC0C6` |
| Texto secundário em card | `color` | Corpo | `#BDC0C6` |
| Metadado (empresa, data, cargo) | `color` | Metadata | `#979BA1` |
| Tag / Badge | `color` + `background` | Accent | `#CDFF07` + `rgba(205,255,7,0.10)` |
| Ícone decorativo (SVG) | `color` | Ornamental | `#31B3F9` |
| Glow / Luz radial | `background` | Ornamental | `rgba(49,179,249,*)` |
| Botão primário | `background` | Accent | `#CDFF07` |
| Botão primário texto | `color` | Midnight | `#0D1B2E` |
| Botão outline | `color` + `border` | Accent | `#CDFF07` |
| Link `<a>` | `color` | Link | `#31B3F9` |
| Link hover | `color` | Link hover | `#FFFFFF` |
| FAQ símbolo +/− | `color` | Accent | `#CDFF07` |
| FAQ pergunta hover | `color` | Link hover | `#FFFFFF` |
| FAQ pergunta aberta | `color` | Nav ativo | `#CDFF07` |
| Estrelas de rating | `background` | Accent | `#CDFF07` |
| Bullet de lista | `background` | Accent | `#CDFF07` |
| Footer link hover | `color` | Link hover | `#FFFFFF` |
| Input focus ring | `border-color` | Input focus | `#31B3F9` |

---

## 16. Ícones

Usar exclusivamente **NimbusIcons**.

Documentação: https://nimbus.nuvemshop.com.br/documentation/resources/nimbus-icons

Sempre buscar a documentação atualizada antes de usar. Não usar ícones de outras bibliotecas.

---

## 17. Ritmo vertical

O espaçamento vertical segue **proximidade semântica**: headings se aproximam do conteúdo que introduzem e se afastam do conteúdo anterior. Todos os valores usam tokens de espaçamento existentes (seção 4). Referência validada contra o site institucional Nuvemshop em produção.

### Heading → próximo elemento (margin-bottom)

| Heading | → Lead / Subtítulo | → Conteúdo direto | Token lead | Token conteúdo |
|---|---|---|---|---|
| H1 (hero) | 32px | 32px | `--sp-8` | `--sp-8` |
| H2 | 16px | 48px | `--sp-4` | `--sp-12` |
| H3 (card) | 8px | 8px | `--sp-2` | `--sp-2` |
| H4 (card) | 8px | 8px | `--sp-2` | `--sp-2` |

### Lead / Descrição → conteúdo (margin-bottom)

| Par | Valor | Token |
|---|---|---|
| Descrição de seção → grid / conteúdo | 48px | `--sp-12` |
| Descrição de hero → CTA | 32px | `--sp-8` |

### Label / Eyebrow → Heading (margin-bottom do eyebrow)

8px (`--sp-2`) — formam uma unidade visual, espaçamento mínimo.

### Entre parágrafos (margin-bottom)

16px (`--sp-4`).

### Bloco de título de seção → conteúdo principal

O "bloco de título" é o conjunto eyebrow + heading + lead que abre uma seção.

| Contexto | Valor | Token |
|---|---|---|
| Padrão (grid, lista, conteúdo) | 48px | `--sp-12` |

### Dentro de cards

| Par | Valor | Token |
|---|---|---|
| Ícone / imagem → heading do card | 16px | `--sp-4` |
| Heading do card (H3/H4) → texto | 8px | `--sp-2` |
| Texto → CTA do card | 16px | `--sp-4` |
| Entre itens de lista em card | 8px | `--sp-2` |

### Grids e listas

| Contexto | Valor | Token |
|---|---|---|
| Cards em grid (2–4 colunas) | 24px | `--sp-6` |
| Cards em lista vertical (1 coluna) | 16px | `--sp-4` |
| Feature rows (itens com ícone) | 16px | `--sp-4` |

### Micro-espaçamentos internos de componente

| Par | Valor | Token |
|---|---|---|
| Estrelas / rating → texto | 4px | `--sp-1` |
| Subtítulo de contexto → corpo | 4px | `--sp-1` |
| H4 inline → descrição curta | 2px | sem token (mínimo funcional) |
| Label de form → input | 6px | sem token (componente) |

### Regra geral

Usar **apenas tokens** para espaçamento vertical entre elementos semânticos. Valores de 2px e 6px são permitidos apenas dentro de componentes fechados (form fields, ratings, badges) onde o espaçamento é cosmético, não estrutural.

### Referência CSS rápida

Valores prontos para copiar. O agente DEVE usar estes valores, não inventar outros.

```css
/* ─── Eyebrow → Heading ─── */
.eyebrow     { margin-bottom: 0.5rem; }     /*  8px = --sp-2  */

/* ─── Heading → próximo ─── */
.hero-title  { margin-bottom: 2rem; }        /* 32px = --sp-8  (H1 → lead) */
.sec-title   { margin-bottom: 1rem; }        /* 16px = --sp-4  (H2 → lead/desc) */
.card-title  { margin-bottom: 0.5rem; }      /*  8px = --sp-2  (H3/H4 → texto) */

/* ─── Descrição → conteúdo ─── */
.hero-lead   { margin-bottom: 2rem; }        /* 32px = --sp-8  (lead → CTA) */
.sec-desc    { margin-bottom: 1rem; }        /* 16px = --sp-4  (entre parágrafos) */
.content-grid { margin-top: 3rem; }          /* 48px = --sp-12 (título bloco → grid) */

/* ─── Dentro de card ─── */
.card-icon   { margin-bottom: 1rem; }        /* 16px = --sp-4  (ícone → heading) */
.card-title  { margin-bottom: 0.5rem; }      /*  8px = --sp-2  (heading → texto) */
.card-text   { margin-bottom: 1rem; }        /* 16px = --sp-4  (texto → CTA) */
.list-item   { margin-bottom: 0.5rem; }      /*  8px = --sp-2  (entre itens de lista) */

/* ─── Grid gap ─── */
.card-grid   { gap: 1.5rem; }               /* 24px = --sp-6  (cards em grid) */
.card-list   { gap: 1rem; }                 /* 16px = --sp-4  (cards em lista) */

/* ─── Seção ─── */
.section     { padding-block: 7.5rem; }     /* 120px = padrão de seção */
```

---

## 18. Superfícies e separação visual

### Princípio

A separação entre elementos é feita por **contraste de fundo**, não por bordas. Cards, slides, painéis e containers se destacam do fundo pela diferença de cor de superfície e, quando necessário, por sombra.

### Hierarquia de superfícies — modo institucional claro

| Camada | Cor | Token | Papel |
|---|---|---|---|
| Fundo de página | Frost `#F4F7FB` | `--frost` | Base geral |
| Card / painel | Pure White `#FFFFFF` | `--card-bg` | Conteúdo elevado |
| Card interno / destaque | Frost `#F4F7FB` ou Gray 10 `#EFF1F4` | `--card-inner` | Área dentro de card que precisa de contraste |

### Quando usar bordas

| Contexto | Borda permitida |
|---|---|
| Tabelas (`<table>`) | `1px solid var(--divider)` nas células |
| Inputs e selects (§9) | `1px solid var(--input-border)` |
| Dividers horizontais explícitos | `1px solid var(--divider)` ou `<hr>` |
| Botão secundário/outline (§8) | `1px solid` conforme tokens de estado |

### Onde NÃO usar bordas

Cards, slides de carrossel, painéis de conteúdo, containers de feature, blocos de pricing, grids de logo, tiles de galeria. Nesses elementos, usar contraste de `background` e/ou `box-shadow` para separação visual.

### Ícones

NimbusIcons são usados diretamente, com cor via token semântico (`--accent`, `--text-secondary`, etc.). Por padrão, sem container decorativo (sem `div` com `background` + `border-radius` atrás do ícone). Containers são aceitáveis quando o contexto exige área de toque aumentada ou agrupamento visual intencional.

---

## 19. Tabelas

### Princípio

Tabelas usam **opacidade relativa sobre `slate`** em vez de cores fixas. Isso garante que o mesmo código funcione nos três modos cromáticos sem ajustes — slate é escuro no modo claro e claro no modo escuro, então qualquer percentual de opacidade gera contraste proporcional ao contexto.

### Estrutura de camadas

| Camada | Token | Opacidade | Propósito |
|---|---|---|---|
| Container (borda) | `slate/10` | 10% | Delimita a tabela, sutil mas visível |
| Header (fundo) | `slate/[0.07]` | 7% | Distingue cabeçalho do corpo |
| Faixa zebra (linhas pares) | `slate/[0.03]` | 3% | Guia horizontal de leitura |
| Linhas ímpares | transparente | 0% | Herda fundo do card/página |
| Divisor entre linhas | `slate/[0.06]` | 6% | Separa linhas sem peso visual |

### Tipografia

| Elemento | Font size | Peso | Cor |
|---|---|---|---|
| Cabeçalho (`<th>`) | 16px (`text-base`) | 600 (Semibold) | `text-g60` — diferenciado do conteúdo por peso e cor, não por tamanho |
| Célula de corpo (`<td>`) | 16px (`text-base`) | 400 (Regular) | `text-slate` — cor principal do modo |
| Célula de código / hex | 14px (`text-sm`) | 400 mono | `text-g60` — diferenciação tipográfica |

### Espaçamento

| Propriedade | Valor | Observação |
|---|---|---|
| Padding de célula | `px-5 py-3.5` (20px × 14px) | Mais respiro que o padrão 16×12 |
| Border radius do container | 16px (`rounded-2xl`) | Alinhado ao token Large (§5) |
| Gap no preview de cor | 12px (`gap-3`) | Entre swatch e label |

### Swatch de preview

Quando a tabela exibe cores (tabelas semânticas), cada linha inclui um preview com:

| Elemento | Especificação |
|---|---|
| Swatch | `w-6 h-6 rounded-md` (24×24px, radius 6px) |
| Borda do swatch | `border border-slate/10` — visível mesmo em cores claras |
| Label "Aa" | `text-sm font-semibold px-2.5 py-1 rounded-md` sobre fundo do modo |

### Regras de aplicação

1. **Nunca usar cores fixas** (`bg-white`, `bg-frost`, `bg-g10`) em faixas alternadas ou headers de tabela. Sempre usar opacidade sobre `slate`.
2. **A última linha** não tem divisor inferior: `last:border-b-0`.
3. **Faixas começam com a mais escura**: linhas pares (índice 0, 2, 4...) recebem `bg-slate/[0.03]`, ímpares ficam transparentes.
4. **Cabeçalho diferencia por peso e cor**, não por tamanho — mesmo 16px que o corpo, mas `font-semibold` + `text-g60` em vez de regular + `text-slate`.
5. **Coluna WCAG** é condicional: só aparece se pelo menos um token da tabela tiver propriedade `ratio`. Tokens sem ratio exibem "—".
6. **Border-collapse**: usar `border-collapse` na `<table>` para evitar gaps duplos entre divisores.

### Referência CSS (Tailwind)

```html
<!-- Container -->
<div class="rounded-2xl overflow-x-auto border border-slate/10">
  <table class="w-full text-base border-collapse">

    <!-- Header -->
    <thead>
      <tr class="bg-slate/[0.07]">
        <th class="text-left px-5 py-3.5 text-base font-semibold text-g60 border-b border-slate/10">
          Coluna
        </th>
      </tr>
    </thead>

    <!-- Body -->
    <tbody>
      <tr class="bg-slate/[0.03] border-b border-slate/[0.06] last:border-b-0">
        <td class="px-5 py-3.5 text-slate">Conteúdo</td>
      </tr>
      <tr class="border-b border-slate/[0.06] last:border-b-0">
        <td class="px-5 py-3.5 text-slate">Conteúdo</td>
      </tr>
    </tbody>

  </table>
</div>
```

### Racional

O uso de opacidade sobre um único token (`slate`) cria um sistema de 3 níveis de profundidade (7%, 3%, 0%) que se adapta automaticamente. No modo claro, slate (#313642) é escuro — as opacidades geram tons frios sutis. No modo escuro, slate se inverte — as mesmas opacidades geram claridade sutil sobre o fundo escuro. Zero configuração por modo.

---

## 20. Logo

### Variantes disponíveis

| Variante | Arquivo | Uso |
|---|---|---|
| Logo completo colorido | `logo-colorido-ecommerce-na-pratica.svg` | Modo claro — uso padrão quando há espaço horizontal |
| Logo completo branco | `logo-branco-ecommerce-na-pratica.svg` | Modos escuro e serviços — sobre fundos escuros |
| Símbolo azul | `simbolo-azul-ecommerce-na-pratica.svg` | Modo claro — espaços reduzidos (nav, favicon, sidebar) |
| Símbolo branco | `simbolo-branco-ecommerce-na-pratica.svg` | Modos escuro e serviços — espaços reduzidos sobre fundos escuros |
| Avatar azul/branco | `avatar-azul-branco-ecommerce-na-pratica.svg` | Avatares circulares, perfis de redes sociais, ícones de app |

Assets disponíveis no Google Drive:
- [Logo completo](https://drive.google.com/drive/folders/1V1KQvy2448V4XFcuL_2Zos70EwiaJMiJ?usp=drive_link)
- [Símbolo](https://drive.google.com/drive/folders/1tU3TomLqy_s32LfQvOEMn4byeUyUp3d6?usp=drive_link)
- [Avatar](https://drive.google.com/drive/folders/1BNSVv6kGcYFKFaYG9kMyuLd177RZ0t_w?usp=drive_link)

### Seleção automática por modo cromático

| Modo | Logo completo | Símbolo |
|---|---|---|
| Institucional claro | Colorido | Azul |
| Escuro institucional | Branco | Branco |
| Serviços | Branco | Branco |

**Regra:** ao inserir o logo, identificar o modo cromático ativo e usar automaticamente a versão correta (colorido/azul para fundos claros, branco para fundos escuros).

### Seleção por contexto

| Contexto | Variante |
|---|---|
| Header de LP, hero, rodapé, material impresso | Logo completo |
| Navbar, sidebar, favicon, ícone de app, breadcrumb | Símbolo |
| Perfil de rede social, avatar de chat, ícone redondo | Avatar |

**Regra:** quando o contexto exigir logo do EnP, perguntar ao usuário "logo completo ou apenas o símbolo?" caso o contexto não torne a escolha óbvia. Em espaços com largura inferior a 120px, usar automaticamente o símbolo.

### Área de respiro

Espaço livre mínimo ao redor do logo: **metade da altura do símbolo** em cada direção. Nenhum elemento gráfico, texto ou borda pode invadir essa área.

### Uso incorreto

1. **Não distorcer ou esticar** — manter proporções originais
2. **Não alterar cores do logo** — usar apenas as versões oficiais
3. **Não adicionar efeitos** — sem sombra, brilho, contorno ou gradiente sobre o logo
4. **Não rotacionar** — o logo deve estar sempre na orientação original
5. **Não usar sobre fundos que comprometam legibilidade** — evitar fundos com padrão, foto sem overlay ou cores que reduzam contraste
6. **Não usar versão colorida sobre fundo escuro** — usar a versão branca

---

## 21. Wireframes

### Sobre

O Design System inclui uma biblioteca de wireframes HTML prontos para uso como blocos de construção de landing pages. Cada wireframe é um arquivo HTML estático com tokens CSS do sistema, pronto para adaptação.

### Instrução para o agente

**Antes de criar qualquer seção de landing page do zero, consulte os wireframes existentes.** O catálogo está indexado em `src/lib/tokens.ts` na constante `wireframeCategories`. Os arquivos HTML ficam em `public/wireframes/`.

Fluxo de uso:
1. Identificar qual tipo de seção o usuário precisa (hero, features, pricing, etc.)
2. Consultar o catálogo abaixo para encontrar o wireframe mais adequado
3. Ler o HTML do wireframe (`public/wireframes/<arquivo>.html`)
4. Adaptar o conteúdo, tokens e modo cromático ao contexto do projeto
5. Nunca copiar o HTML cru — sempre converter para o framework do projeto (React, Next.js, etc.)

### Catálogo de categorias

#### Seções primárias

| Template | Qtd | Prioridade | Arquivo | Descrição |
|---|---|---|---|---|
| Hero | 10 | Crítica | `hero-top10-institucional.html` | Top 10 por conversão mobile |
| Features | 5 | Crítica | `features.html` | Stats, steps, tabs, checklist grid, deep content |
| Testimonial | 5 | Crítica | `testimonial.html` | Carousel, grid, stat+quote, masonry, single case |
| Pricing | 5 | Alta | `pricing.html` | 3 colunas, toggle, single plan, value stack, +FAQ |
| CTA | 5 | Crítica | `cta.html` | Dark centered, dual, social proof, image, banner strip |

#### Conteúdo e navegação

| Template | Qtd | Prioridade | Arquivo | Descrição |
|---|---|---|---|---|
| Headers | 6 | Alta | `headers.html` | Large (2), medium (2), small (2) — páginas internas |
| FAQs | 2 | Alta | `faqs.html` | Single column accordion, tabbed accordion |
| Navigation | 1 | Ref. | `navigation.html` | Logo + links + CTA — referência estrutural |

#### Conversão e captura

| Template | Qtd | Prioridade | Arquivo | Descrição |
|---|---|---|---|---|
| Banners | 4 | Alta | `banners.html` | Email capture, announcement, cookie, top bar |
| Signup / Login | 2 | Média | `signup.html` | Split form, centered form |
| Contact | 1 | Alta | `contact.html` | Simple form — entrada de leads para consultoria |

#### Prova e credibilidade

| Template | Qtd | Prioridade | Arquivo | Descrição |
|---|---|---|---|---|
| Integrations | 2 | Alta | `integrations.html` | Logo strip + headline, integration cards |
| Comparison | 1 | Média | `comparison.html` | Comparison table — EnP vs. sem método |
| Gallery | 2 | Média | `gallery.html` | Masonry grid, image carousel |
| Logo | 2 | Baixa | `logo.html` | Static logo grid, marquee — pós D2C Summit |

#### Estrutura e utilidades

| Template | Qtd | Prioridade | Arquivo | Descrição |
|---|---|---|---|---|
| Footer | 2 | Alta | `footer-section.html` | Four-column footer, compact footer |
| Legal | 1 | Base | `legal.html` | Legal page — termos e privacidade LGPD |
| Transitions | 1 | Baixa | `transitions.html` | Section transition — gradiente entre blocos |

### Regras

1. **Wireframes são ponto de partida, não produto final.** Adaptar sempre ao contexto, conteúdo e modo cromático do projeto.
2. **Prioridade Crítica = usar sempre que possível.** São os blocos com maior impacto em conversão.
3. **Respeitar tokens do DS.** Os wireframes já usam variáveis CSS do sistema — ao converter para React/Next.js, mapear para os tokens Tailwind equivalentes.
4. **Combinar wireframes livremente.** Uma LP típica usa: Navigation + Hero + Features + Testimonial + Pricing + CTA + Footer.

---

## 22. Checklist de validação pós-build

Após concluir qualquer interface EnP, o agente DEVE verificar cada item abaixo. Se qualquer item falhar, corrigir antes de declarar o trabalho concluído.

### Cores

- [ ] O modo cromático declarado na inicialização (§0) foi aplicado corretamente
- [ ] Nenhum texto usa Sky Blue em modo serviços (exceto links `<a>`)
- [ ] Eyebrows usam cor de corpo (`--text-body`), não accent nem ornamental
- [ ] Headings são `--text-heading`, corpo é `--text-body`, metadados são `--text-meta`
- [ ] Tags e badges usam accent (Lime em serviços, Button Blue em institucional)
- [ ] Hover de links é `--link-hover` (White em escuro/serviços, Deep Slate em claro)
- [ ] Ícones SVG podem usar `--ornamental` — nenhum outro texto pode
- [ ] Nenhuma cor hardcoded existe fora da paleta do modo ativo (§2 + §15)

### Tipografia

- [ ] Todos os `font-size` usam variáveis da escala §1 — nunca valores soltos
- [ ] H1 = 58px, H2 = 42px, H3 = 30px, H4 = 22px (desktop) com `clamp()` para mobile
- [ ] Eyebrow = 12px, uppercase, `letter-spacing: 0.10em`, weight 600
- [ ] Body = 16px, Lead = 18px, Caption = 14px, Small = 12px
- [ ] Apenas pesos 400 e 600 — nenhum 300, 500 ou 700
- [ ] Plus Jakarta Sans como única fonte — nenhuma fonte secundária

### Ritmo vertical

- [ ] Todo espaçamento é múltiplo de 4px (base DS §4)
- [ ] Eyebrow → heading = 8px (`--sp-2`)
- [ ] H2 → lead = 16px (`--sp-4`)
- [ ] H1 hero → lead = 32px (`--sp-8`)
- [ ] Lead hero → CTA = 32px (`--sp-8`)
- [ ] Bloco de título → grid/conteúdo = 48px (`--sp-12`)
- [ ] Dentro de card: ícone → heading = 16px, heading → texto = 8px
- [ ] Itens de lista = 8px (`--sp-2`)
- [ ] Grid gap = 24px (`--sp-6`)
- [ ] Padding de seção = 120px

### Semântica HTML

- [ ] Títulos de card usam `<h3>` ou `<h4>`, nunca `<p>` ou `<span>`
- [ ] Hierarquia de headings é sequencial (h1 → h2 → h3, sem pular)
- [ ] Seções usam `<section>` com `id` para scroll

### Superfícies

- [ ] Cards, painéis e containers NÃO usam `border` para separação (§18)
- [ ] Separação visual feita por contraste de `background` e/ou `box-shadow`
- [ ] Bordas permitidas apenas em: tabelas, inputs, dividers explícitos, botão outline

