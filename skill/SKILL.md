---
name: enp-design-system
description: Design system specification for Ecommerce na Prática (EnP). Use this skill when building any interface, component, landing page, email, social asset, or tool for EnP. Contains all visual tokens, color modes, typography, spacing, gradients, buttons, states, overlays, aspect ratios, transitions and semantic color tables validated for WCAG contrast. Always consult this skill before generating any EnP visual output.
version: 2.0.0
updated: 2026-03-22
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

O que permaneceu igual: Plus Jakarta Sans, sistema de espaçamento base 4px, border radius, breakpoints e grid de 12 colunas, escala de z-index, transições base e ícones NimbusIcons.

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
| H3 | 30px | 24px | 600 | -0.02em | 1.2 | Títulos de card, itens, subseções |
| H4 | 22px | 20px | 600 | -0.01em | 1.3 | Cabeçalhos de card, preços, nomes |
| Lead/Intro | 18px | 16px | 400 | 0 | 1.5 | Primeiro parágrafo após H1 ou H2 |
| Body | 16px | 16px | 400 | 0 | 1.5 | Parágrafos, descrições, interface, botões |
| Body longo | 18px | 16px | 400 | 0 | 1.5 | Blog, escola, materiais educacionais |
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

Valores exclusivos de contexto de sobreposição. Não usar como cores de fundo sólido.

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

---

## 16. Ícones

Usar exclusivamente **NimbusIcons**.

Documentação: https://nimbus.nuvemshop.com.br/documentation/resources/nimbus-icons

Sempre buscar a documentação atualizada antes de usar. Não usar ícones de outras bibliotecas.

