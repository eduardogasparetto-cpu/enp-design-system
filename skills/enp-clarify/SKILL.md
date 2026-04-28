---
name: enp-clarify
description: >-
  Passe específico de microcopy em interfaces e peças EnP para alinhar com a
  voz EnP (60% empático + 40% exigente, guia pragmático). Reescreve botões,
  mensagens de erro, empty states, loading, confirmações, labels, títulos e
  CTAs com vocabulário concreto, sem "passo a passo", sem "metodologia
  estruturada", sem urgência artificial. Triggers: "clarify", "melhorar copy",
  "revisar texto", "voz EnP", "deixar mais EnP", "copy confusa", "microcopy",
  "mensagens da interface", "labels", "CTA fraco", "erro genérico". Disparado
  automaticamente ao final de qualquer geração via enp-design-system ou
  enp-app-guidelines, como último passo da sequência audit → polish → clarify.
version: 3.2.0
updated: 2026-04-28
requires: [enp-design-system, enp-app-guidelines]
---

# EnP — Clarify

Passe de microcopy para alinhar textos à voz EnP.

## O que este command é

Reescrita de **textos de interface**: botões, labels, erros, empty states, loading, confirmações, tooltips, toasts, headers de card.

## O que NÃO é

- Copywriting de marketing/landing (voz EnP humana com contexto estratégico).
- Revisão gramatical.
- Tradução.

## Voz EnP em uma frase

Guia pragmático, 60% empático + 40% exigente. Base experiente, técnico-acessível. Afirma o que EnP é hoje, nunca combate o que foi.

## Cinco princípios operacionais

1. **Falar no positivo**. Apontar o caminho, não o buraco.
2. **Imperativo em copy de conversão**. "Baixar checklist", não "Para baixar, clique aqui".
3. **Nomear o problema com precisão**. "Email precisa incluir @" em vez de "Valor inválido".
4. **Perguntar o estado emocional do usuário antes de escrever**.
5. **Reconhecer sem inflar**. Todo reconhecimento carrega direção concreta.

## Vocabulário

**Evitar**:
- "Metodologia estruturada" → "método claro" / "método validado"
- "Passo a passo" → "sequência de 4 etapas" / "caminho"
- "Aplicável" → "usado em" / "que funciona em"
- Emojis direcionais (→, 👉, ⚡ sem função)
- Urgência artificial ("Últimas vagas!")
- "Clique aqui" / "Saiba mais" / "OK" / "Enviar" / "Cancelar"
- "Ops!" / "Oops!"
- "Você errou" / "Sua culpa"
- Title Case em títulos

**Preferir**:
- Verbo + objeto em CTA
- Ações reversas nomeadas ("Voltar para edição", "Manter projeto")
- Linguagem concreta e cotidiana
- Números específicos
- Reconhecimento com próximo passo

## Protocolo

### Passo 1 — Carregar contexto

Ler `enp-app-guidelines/SKILL.md` (§5 Card copy, §8 FormField erro, §11 empty state, §15 voz EnP aplicada).

Perguntar se não estiver claro:
- Qual peça? (app, landing, email)
- Qual audiência? (lojista iniciante, lojista escalando, parceiro)
- Qual momento emocional?

### Passo 2 — Varrer textos

Listar todo texto visível: títulos, labels, placeholders, botões, links, mensagens (sucesso, erro, warning, info), empty states, loading, toasts, tooltips, `aria-label`.

### Passo 3 — Diagnosticar

Três perguntas por texto:
1. Serve ao momento do usuário?
2. Está na voz EnP?
3. Tem ação concreta?

Marcar cada um como `OK` ou `REWRITE`.

### Passo 4 — Reescrever

**Botão primário**

| Antes | Depois |
|---|---|
| "Enviar" | "Criar conta" |
| "OK" | "Confirmar exclusão" |
| "Saiba mais" | "Ver plano completo" |
| "Clique aqui" | "Baixar guia" |

**Botão secundário / escape**

| Antes | Depois |
|---|---|
| "Cancelar" | "Voltar" / "Manter edição" |
| "Não" | "Manter projeto" |

**Erro de validação** (fórmula: o que + exemplo ou caminho)

| Antes | Depois |
|---|---|
| "Valor inválido" | "Esse campo precisa de um e-mail. Exemplo: nome@dominio.com" |
| "Campo obrigatório" | "Preencha o nome do projeto" |
| "Erro" | "Esse e-mail já está cadastrado. Entrar na conta?" |

**Empty state** (3 beats)

| Antes | Depois |
|---|---|
| "Sem resultados" | "Nenhum projeto por aqui. Crie o primeiro para acompanhar suas entregas." [CTA: Criar projeto] |
| "Nada encontrado" | "Busca sem resultados. Tente outro termo ou remova filtros." |

**Loading**

| Antes | Depois |
|---|---|
| "Carregando..." | "Salvando rascunho..." |
| "Aguarde" | "Processando análise (cerca de 20s)" |

**Confirmação destrutiva**

| Elemento | Antes | Depois |
|---|---|---|
| Título | "Tem certeza?" | "Excluir projeto?" |
| Descrição | "Esta ação não pode ser desfeita" | "Essa ação é permanente. O projeto e o histórico somem." |
| Botão destrutivo | "Sim" | "Excluir permanentemente" |
| Botão escape | "Não" | "Manter projeto" |

**Títulos**

| Antes | Depois |
|---|---|
| "Meus Projetos" | "Meus projetos" |
| "CONFIGURAÇÕES" | "Configurações" |

### Passo 5 — Relatório

```markdown
# Clarify EnP — [nome]

## Textos revisados: X
## Reescritos: Y

### Mudanças principais

#### [Categoria]
- [arquivo:linha]
  - Antes: "[texto]"
  - Depois: "[texto]"
  - Por quê: [princípio aplicado]
```

## Regras do clarify

- **Não inventar fatos**. Se o texto diz "Processando em 20s" e não sei se é 20s, manter ou remover o número.
- **Não mudar intenção**. Botão destrutivo continua destrutivo. Clarify refina, não redireciona.
- **Preservar o domínio do usuário**. Termos de e-commerce (loja, checkout, SKU) ficam.
- **Reconhecer o que já está bem**. `OK` é resposta válida.
- **Forward-looking**. Nunca contrastar com "o antigo EnP" ou "o mercado de cursos".
