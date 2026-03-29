# EnP Design System — Wireframes (Referência)

> Arquivo de referência do `enp-design-system`. Consulte o `SKILL.md` principal para protocolo de inicialização e tokens.

---

## Sobre

O Design System inclui uma biblioteca de wireframes HTML prontos para uso como blocos de construção de landing pages. Cada wireframe é um arquivo HTML estático com tokens CSS do sistema, pronto para adaptação.

## Instrução para o agente

**Antes de criar qualquer seção de landing page do zero, consulte os wireframes existentes.** O catálogo está indexado em `src/lib/tokens.ts` na constante `wireframeCategories`. Os arquivos HTML ficam em `public/wireframes/`.

Fluxo de uso:
1. Identificar qual tipo de seção o usuário precisa (hero, features, pricing, etc.)
2. Consultar o catálogo abaixo para encontrar o wireframe mais adequado
3. Ler o HTML do wireframe (`public/wireframes/<arquivo>.html`)
4. Adaptar o conteúdo, tokens e modo cromático ao contexto do projeto
5. Nunca copiar o HTML cru — sempre converter para o framework do projeto (React, Next.js, etc.)

## Catálogo de categorias

### Seções primárias

| Template | Qtd | Prioridade | Arquivo | Descrição |
|---|---|---|---|---|
| Hero | 10 | Critica | `hero-top10-institucional.html` | Top 10 por conversão mobile |
| Features | 5 | Critica | `features.html` | Stats, steps, tabs, checklist grid, deep content |
| Testimonial | 5 | Critica | `testimonial.html` | Carousel, grid, stat+quote, masonry, single case |
| Pricing | 5 | Alta | `pricing.html` | 3 colunas, toggle, single plan, value stack, +FAQ |
| CTA | 5 | Critica | `cta.html` | Dark centered, dual, social proof, image, banner strip |

### Conteúdo e navegação

| Template | Qtd | Prioridade | Arquivo | Descrição |
|---|---|---|---|---|
| Headers | 6 | Alta | `headers.html` | Large (2), medium (2), small (2) — páginas internas |
| FAQs | 2 | Alta | `faqs.html` | Single column accordion, tabbed accordion |
| Navigation | 1 | Ref. | `navigation.html` | Logo + links + CTA — referência estrutural |

### Conversão e captura

| Template | Qtd | Prioridade | Arquivo | Descrição |
|---|---|---|---|---|
| Banners | 4 | Alta | `banners.html` | Email capture, announcement, cookie, top bar |
| Signup / Login | 2 | Média | `signup.html` | Split form, centered form |
| Contact | 1 | Alta | `contact.html` | Simple form — entrada de leads para consultoria |

### Prova e credibilidade

| Template | Qtd | Prioridade | Arquivo | Descrição |
|---|---|---|---|---|
| Integrations | 2 | Alta | `integrations.html` | Logo strip + headline, integration cards |
| Comparison | 1 | Média | `comparison.html` | Comparison table — EnP vs. sem método |
| Gallery | 2 | Média | `gallery.html` | Masonry grid, image carousel |
| Logo | 2 | Baixa | `logo.html` | Static logo grid, marquee — pós D2C Summit |

### Estrutura e utilidades

| Template | Qtd | Prioridade | Arquivo | Descrição |
|---|---|---|---|---|
| Footer | 2 | Alta | `footer-section.html` | Four-column footer, compact footer |
| Legal | 1 | Base | `legal.html` | Legal page — termos e privacidade LGPD |
| Transitions | 1 | Baixa | `transitions.html` | Section transition — gradiente entre blocos |

## Regras

1. **Wireframes são ponto de partida, não produto final.** Adaptar sempre ao contexto, conteúdo e modo cromático.
2. **Prioridade Critica = usar sempre que possível.** São os blocos com maior impacto em conversão.
3. **Respeitar tokens do DS.** Os wireframes já usam variáveis CSS do sistema — ao converter para React/Next.js, mapear para os tokens Tailwind equivalentes.
4. **Combinar wireframes livremente.** Uma LP típica usa: Navigation + Hero + Features + Testimonial + Pricing + CTA + Footer.
