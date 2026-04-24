# EnP Design System — Cores Semânticas (Referência)

> Arquivo de referência do `enp-design-system`. Consulte o `SKILL.md` principal para protocolo de inicialização e regras negativas.

---

## 15a — Modo institucional claro

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

---

## 15b — Modo escuro institucional

Valores exclusivos deste modo — não fazem parte da paleta principal.

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

---

## 15c — Modo serviços

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

## 15f — Mapeamento componente → token (modo serviços)

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
