---
name: enp-audit
description: >-
  Validação pós-hoc de interfaces e peças EnP contra os tokens do DS, regras
  negativas, WCAG AA, e postura institucional. Roda checagem técnica
  (contraste, tokens corretos, anti-patterns) e qualitativa (voz EnP,
  hierarquia, ressonância com reposicionamento). Use quando o usuário pedir
  "audita", "revisa", "valida contra o DS", "confere se está on-brand",
  "check antes de shippar", ou quando quiser relatório P0-P3 de violações.
  Não substitui o DS, valida contra ele. Triggers: "audit", "auditar",
  "validar", "revisar DS", "checar tokens", "antes de shippar", "pre-flight".
version: 1.0.0
updated: 2026-04-23
requires: [enp-design-system, enp-app-guidelines]
---

# EnP — Audit

Validação pós-hoc contra os tokens e regras do DS EnP.

## Quando rodar

Ao final de uma entrega, antes de shippar, ou quando surgir dúvida se uma peça está aderente. Não rodar no meio de criação — o audit pressupõe código existente.

## Escopo

Dois eixos no mesmo relatório, com severidade P0-P3:
- **Técnico**: tokens, WCAG, anti-patterns, estrutura.
- **Qualitativo**: hierarquia, voz, ressonância com a postura institucional.

## Protocolo

### Passo 1 — Carregar o DS EnP

Ler obrigatoriamente:
- `enp-design-system/SKILL.md` (tokens, modos, regras negativas)
- `enp-design-system/semantic-colors.md` (WCAG validado)
- `enp-design-system/content-rules.md` (motion, gradientes, sombras)
- `enp-app-guidelines/SKILL.md` se a peça for aplicação

Não confiar na memória. Cada run começa com leitura.

### Passo 2 — Identificar a peça

Tipo (LP, app, email, slide, social), modo cromático ativo, stack. Se o modo cromático não está óbvio, perguntar antes de auditar.

### Passo 3 — Checagens técnicas

**Cores e tokens**
- [ ] Cores dentro da §2 do DS?
- [ ] Nenhuma cor hardcoded fora da paleta?
- [ ] Nenhum gray puro ou preto puro?
- [ ] Derivações via `color-mix` onde aplicável (§15d)?

**Tipografia**
- [ ] Plus Jakarta Sans como única família?
- [ ] Apenas pesos 400 e 600?
- [ ] Font-sizes da escala §1?
- [ ] Sem itálico em peças institucionais?

**Espaçamento**
- [ ] Todo valor múltiplo de 4?
- [ ] Dentro da escala §4?

**Estrutura**
- [ ] Cards separados por contraste, não borda (§18)?
- [ ] Sombras seguem padrão §18?
- [ ] Border-radius dos tokens §5?

**Motion**
- [ ] Só `transform` e `opacity`?
- [ ] `prefers-reduced-motion` presente?
- [ ] Durações e curvas da tabela do DS?
- [ ] Sem bounce/elastic?

**Acessibilidade (WCAG AA)**
- [ ] Contraste normal ≥ 4.5:1?
- [ ] Contraste grande ≥ 3:1?
- [ ] `:focus-visible` em todo interativo?
- [ ] Touch targets ≥ 44x44?
- [ ] `alt` descritivo?
- [ ] `aria-label` em botões de ícone?
- [ ] Skip link presente em aplicações?

**Anti-patterns**
- [ ] Sem texto em gradiente?
- [ ] Sem urgência artificial?
- [ ] Sem emojis direcionais?
- [ ] Sem fontes genéricas fora do fallback?
- [ ] Sem `position: absolute` em dropdown dentro de `overflow: hidden`?

**Regras negativas por modo**
- Modo serviços: Sky Blue não é cor de texto (só ornamental)
- Modo institucional claro: branco puro não é fundo de página
- Todos os modos: sem gradiente em inputs, ícones <24px, botões primários, feedback states

### Passo 4 — Checagens qualitativas

**Hierarquia**
- Elemento mais importante é o mais notável?
- Há rotas claras de leitura?
- Seções respiram?

**Voz EnP**
- Copy evita "passo a passo", "metodologia estruturada", "aplicável"?
- Botões verbo + objeto?
- Erros nomeiam o problema com precisão?
- Empty states em 3 beats?
- Nenhum "Clique aqui"?
- Títulos em sentence case?

**Postura institucional**
- Nada de urgência artificial?
- Nada de ar infoproduto?
- Tom de guia pragmático?
- Forward-looking?

### Passo 5 — Relatório

```markdown
# Audit EnP — [nome]

**Data**: [data]
**Tipo**: [LP / app / email / social]
**Modo cromático**: [modo]
**Score**: X/100

## P0 — Bloqueantes
1. [Violação] — [arquivo:linha] — [regra violada] — [correção]

## P1 — Alta prioridade
...

## P2 — Média prioridade
...

## P3 — Nice to have
...

## O que está bem
- [Aspecto positivo]

## Recomendação
[Ship / Ajustar P0 e P1 antes / Volta para prancha]
```

### Severidades

- **P0**: quebra identidade ou acessibilidade (cor fora da paleta, contraste <3:1, foco invisível).
- **P1**: desvio relevante (motion sem reduced-motion, botão "OK" em confirmação, empty sem ação).
- **P2**: polimento (token `color-mix` poderia substituir hex, stagger sem cap).
- **P3**: sugestão opcional.

## Regras do audit

- **Não reescrever** no lugar. Audit aponta, correção é separada (`enp-polish` ou `enp-clarify` depois).
- **Não inventar** regras. Se uma prática é boa mas não está no DS, virar P3 com sugestão de adicionar.
- **Não ser permissivo** com "só dessa vez".
- **Reconhecer o que está bem**. Audit não é caça ao erro.
