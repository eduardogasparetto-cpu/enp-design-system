---
name: enp-polish
description: >-
  Finishing pass de alinhamento, spacing, consistência micro e detalhes finais
  em peças EnP antes de shippar. Corrige desalinhamentos, inconsistência de
  spacing, hierarquia visual incompleta, estados de componente não-aparados.
  Diferente do enp-audit (que aponta problemas), este aplica correções.
  Triggers: "polish", "polir", "ajustes finais", "pre-launch review", "algo
  está estranho", "fica quase bom mas", "finishing pass", "ajustar
  micro-detalhes", "consistência", "antes de entregar". Disparado
  automaticamente ao final de qualquer geração via enp-design-system ou
  enp-app-guidelines, na sequência audit → polish → clarify.
version: 3.2.0
updated: 2026-04-28
requires: [enp-design-system, enp-app-guidelines]
---

# EnP — Polish

Passe final de consistência e micro-detalhe antes da entrega.

## Diferença para `enp-audit`

- `enp-audit` identifica violações, não mexe no código.
- `enp-polish` aplica correções.

Rodar `enp-audit` primeiro para mapear, `enp-polish` depois para consertar.

## Escopo

NÃO refaz design. Ajusta:

- Alinhamento óptico
- Spacing consistente (múltiplos de 4, escala DS §4)
- Hierarquia de texto coerente com escala DS §1
- Estados de componente faltando (hover, focus-visible, active)
- Sombras e bordas fora do token
- Transições faltantes
- Inconsistência de casing
- Micro-copy solto

## Protocolo

### Passo 1 — Carregar DS

Ler:
- `enp-design-system/SKILL.md`
- `enp-design-system/content-rules.md`
- `enp-app-guidelines/SKILL.md` se for app

### Passo 2 — Scan por inconsistência

**Spacing**
- Valores fora da escala §4 (10px, 22px, 50px). Trocar para o mais próximo da escala.
- Padding/margin inconsistente entre elementos equivalentes. Uniformizar.
- Gap fora do ritmo vertical do DS.

**Tipografia**
- Font-size fora da escala §1. Trocar.
- Pesos 300, 500, 700 em Plus Jakarta Sans. Trocar para 400 ou 600.
- Line-height fora da tabela §1.
- Letter-spacing fora da tabela §1.

**Cores**
- Hex fora da paleta. Trocar pelo token.
- `rgba` com opacidade fora dos tokens §2.5.

**Bordas e sombras**
- `border-radius` fora dos tokens §5.
- `box-shadow` fora dos padrões §18.
- Borda separando card. Remover, usar contraste.

**Estados**
- Interativo sem hover. Adicionar.
- Interativo sem `:focus-visible`. Adicionar anel da cor accent.
- Sem transition. Adicionar do componente.

**Copy**
- "Clique aqui", "Saiba mais", "OK", "Cancelar" genéricos. Reescrever com verbo + objeto.
- Title Case. Trocar para sentence case.
- Palavras banidas ("metodologia estruturada", "passo a passo"). Substituir.

**Motion**
- `transition` animando layout (`width`, `height`). Refatorar para `transform`/`opacity`.
- Sem `prefers-reduced-motion`. Adicionar.

### Passo 3 — Aplicar correções

Para cada item:
1. Propor diff (antes/depois) no relatório.
2. Aplicar no código.
3. Manter comentário `/* polish: [antigo] → [DS token] */` quando houver hex hardcoded rastreável.

### Passo 4 — Verificar que nada quebrou

- Contraste WCAG ainda passa?
- Mobile ainda funciona?
- Interativos ainda funcionais?

### Passo 5 — Relatório

```markdown
# Polish EnP — [nome]

## Mudanças aplicadas

### Spacing
- [arquivo:linha]: `padding: 22px` → `padding: 24px` (escala §4)

### Tipografia
- [arquivo:linha]: `font-weight: 500` → `font-weight: 600` (pesos §1)

### Estados
- [arquivo:linha]: adicionado `:focus-visible` em `.btn`

### Copy
- [arquivo:linha]: "Saiba mais" → "Ver plano completo"

## Total: X mudanças aplicadas
```

## Regras do polish

- **Não refazer design**. Se o nível macro está errado, polish não resolve.
- **Não inventar**. Toda correção aponta para um token ou regra do DS.
- **Preservar a intenção**. Não uniformizar por uniformizar.
- **Nunca mudar identidade**. Polish garante que Button Blue é Button Blue, não troca por outro azul.
