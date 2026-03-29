# EnP Design System — Regras de Conteúdo (Referência)

> Arquivo de referência do `enp-design-system`. Consulte o `SKILL.md` principal para protocolo de inicialização e tokens semânticos.

---

## Gradientes

### Institucionais

| Nome | CSS | Uso |
|---|---|---|
| Base limpa | `linear-gradient(180deg, #FFFFFF 0%, #F4F7FB 100%)` | Cards longos e modais com respiração vertical |
| Frio sutil | `linear-gradient(180deg, #F4F7FB 0%, #EBF3FD 50%, #D4E8FA 100%)` | Fundos de seção com temperatura sem azul explícito |
| Âncora → Frost | `linear-gradient(180deg, #1076DD 0%, #5BA8EF 50%, #F4F7FB 100%)` | Heroes com transição integrada ao fundo de página |
| Âncora → Sky | `linear-gradient(135deg, #1076DD 0%, #31B3F9 100%)` | Banners, heroes e seções de destaque |
| Âncora → Midnight | `linear-gradient(180deg, #1076DD 0%, #0A5BB5 50%, #0D1B2E 100%)` | Heroes escuros, transição para território de serviços |

### Serviços

| Nome | CSS | Uso |
|---|---|---|
| Luz de rodapé Sky | `linear-gradient(180deg, #31B3F9 0%, #313642 100%)` | Cards de feature com luz Sky emergindo da base |
| Card de conversão | `linear-gradient(180deg, #313642 0%, #1A2640 100%)` | Blocos de CTA internos e cards de oferta |
| Hero de serviços | `linear-gradient(180deg, #31B3F9 0%, #0D1B2E 100%)` | Fundo de heroes e páginas |
| Transição escura neutra | `linear-gradient(180deg, #303339 0%, #0D1B2E 100%)` | Fade de fundo neutro para profundo |
| Fundo de página longo | `linear-gradient(180deg, #0D1B2E 0%, #1A2E4A 100%)` | Páginas inteiras de serviços |
| Profundidade com dupla luz | `linear-gradient(135deg, #31B3F9 0%, #CDFF07 50%, #0D1B2E 100%)` | Heroes premium com profundidade máxima |

### Regras negativas de gradiente

**Nunca usar gradiente em:**
- Texto corrido — parágrafos e labels sempre cor sólida
- Backgrounds de formulário — inputs, textareas e fieldsets sempre fundo sólido
- Ícones abaixo de 24px — gradientes perdem legibilidade em escala pequena
- Botões de ação primária — cor sólida para máximo contraste e clareza de CTA
- Estados de feedback (error, success, warning) — sempre cores sólidas
- Elementos repetidos em grid — cards em lista com fundo sólido ou glass
- Modo claro com baixo contraste — gradientes sutis sobre Frost podem não passar WCAG AA

**Usar gradiente apenas em:**
- Heroes e banners de seção conforme tokens acima
- Glass cards sobre fundo escuro com backdrop-filter usando tokens white/10 a white/40
- Elementos decorativos de marca — bordas de jornada, separadores de modo
- Destaques com alta hierarquia visual — um elemento por seção

---

## Sombras

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

## Transições

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
| Splash fill (marca) | `clip-path` | 2s | `ease-in-out` · preenchimento bottom→top |
| Splash fade-out | `opacity` | 0.3s | Ease Out Expo · após fill completo |

---

## Efeitos

| Efeito | Valor | Uso |
|---|---|---|
| Blur leve | `blur(5px)` | Nav pills, elementos flutuantes |
| Blur médio | `blur(10px)` | Cards glassmorphism · overlay de modal |
| Border-radius de imagem | 16px | Imagens e containers |

---

## Aspect ratios e tratamento de imagem

### Ratios confirmados

| Nome | Ratio | Dimensões | Uso |
|---|---|---|---|
| Thumb / Widescreen | 16:9 | 1920x1080 | Thumbnails YouTube · banners LP |
| Quadrado | 1:1 | 1080x1080 | Feed social · avatares |
| Retrato | 4:5 | 1080x1350 | Feed Instagram · cards verticais |
| Stories | 9:16 | 1080x1920 | Stories · Reels · conteúdo vertical |

### Tratamento de imagem

| Propriedade | Valor |
|---|---|
| `object-fit` | `cover` |
| `border-radius` | 16px |
| Loading | skeleton shimmer — `background-size: 200% · animation: 1.5s linear infinite` |
| Fallback/erro | `#EFF1F4` + ícone + texto "Imagem indisponível" |
| Estado vazio | Frost + borda dashed `#BDC0C6` + ícone + texto |

---

## Ritmo vertical

O espaçamento vertical segue **proximidade semântica**: headings se aproximam do conteúdo que introduzem e se afastam do conteúdo anterior. Todos os valores usam tokens de espaçamento existentes (§4 do SKILL.md principal).

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

### Label / Eyebrow → Heading

8px (`--sp-2`) — formam uma unidade visual, espaçamento mínimo.

### Entre parágrafos

16px (`--sp-4`).

### Bloco de título de seção → conteúdo principal

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

### Referência CSS rápida

```css
/* --- Eyebrow -> Heading --- */
.eyebrow     { margin-bottom: 0.5rem; }     /*  8px = --sp-2  */

/* --- Heading -> proximo --- */
.hero-title  { margin-bottom: 2rem; }        /* 32px = --sp-8  (H1 -> lead) */
.sec-title   { margin-bottom: 1rem; }        /* 16px = --sp-4  (H2 -> lead/desc) */
.card-title  { margin-bottom: 0.5rem; }      /*  8px = --sp-2  (H3/H4 -> texto) */

/* --- Descricao -> conteudo --- */
.hero-lead   { margin-bottom: 2rem; }        /* 32px = --sp-8  (lead -> CTA) */
.sec-desc    { margin-bottom: 1rem; }        /* 16px = --sp-4  (entre paragrafos) */
.content-grid { margin-top: 3rem; }          /* 48px = --sp-12 (titulo bloco -> grid) */

/* --- Dentro de card --- */
.card-icon   { margin-bottom: 1rem; }        /* 16px = --sp-4  (icone -> heading) */
.card-title  { margin-bottom: 0.5rem; }      /*  8px = --sp-2  (heading -> texto) */
.card-text   { margin-bottom: 1rem; }        /* 16px = --sp-4  (texto -> CTA) */
.list-item   { margin-bottom: 0.5rem; }      /*  8px = --sp-2  (entre itens de lista) */

/* --- Grid gap --- */
.card-grid   { gap: 1.5rem; }               /* 24px = --sp-6  (cards em grid) */
.card-list   { gap: 1rem; }                 /* 16px = --sp-4  (cards em lista) */

/* --- Secao --- */
.section     { padding-block: 7.5rem; }     /* 120px = padrao de secao */
```

---

## Tabelas

### Princípio

Tabelas usam **opacidade relativa sobre `slate`** em vez de cores fixas. O mesmo código funciona nos três modos cromáticos — slate é escuro no modo claro e claro no modo escuro, qualquer percentual de opacidade gera contraste proporcional ao contexto.

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
| Cabeçalho (`<th>`) | 16px | 600 (Semibold) | `text-g60` |
| Célula de corpo (`<td>`) | 16px | 400 (Regular) | `text-slate` |
| Célula de código / hex | 14px | 400 mono | `text-g60` |

### Espaçamento

| Propriedade | Valor |
|---|---|
| Padding de célula | `px-5 py-3.5` (20px x 14px) |
| Border radius do container | 16px (`rounded-2xl`) |
| Gap no preview de cor | 12px (`gap-3`) |

### Referência HTML (Tailwind)

```html
<div class="rounded-2xl overflow-x-auto border border-slate/10">
  <table class="w-full text-base border-collapse">
    <thead>
      <tr class="bg-slate/[0.07]">
        <th class="text-left px-5 py-3.5 text-base font-semibold text-g60 border-b border-slate/10">
          Coluna
        </th>
      </tr>
    </thead>
    <tbody>
      <tr class="bg-slate/[0.03] border-b border-slate/[0.06] last:border-b-0">
        <td class="px-5 py-3.5 text-slate">Conteudo</td>
      </tr>
      <tr class="border-b border-slate/[0.06] last:border-b-0">
        <td class="px-5 py-3.5 text-slate">Conteudo</td>
      </tr>
    </tbody>
  </table>
</div>
```

### Regras de aplicação

1. **Nunca usar cores fixas** em faixas alternadas ou headers de tabela. Sempre opacidade sobre `slate`.
2. **A última linha** não tem divisor inferior: `last:border-b-0`.
3. **Faixas começam com a mais escura**: linhas pares (0, 2, 4...) recebem `bg-slate/[0.03]`, ímpares ficam transparentes.
4. **Cabeçalho diferencia por peso e cor**, não por tamanho.
5. **Coluna WCAG** é condicional: só aparece se pelo menos um token da tabela tiver propriedade `ratio`.
6. **Border-collapse**: usar `border-collapse` na `<table>`.
