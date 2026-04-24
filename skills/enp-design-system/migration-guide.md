# EnP Design System — Guia de Migração

> Para projetos existentes que precisam adotar o Design System do EnP.

---

## Quando usar este guia

- Projeto já tem interface funcional mas não segue o DS do EnP
- Redesign parcial — precisa alinhar ao DS sem reescrever tudo
- Novo membro da equipe aplicando o DS pela primeira vez em código existente

---

## Passo 1: Auditoria de cores

Antes de alterar qualquer coisa, mapear todas as cores em uso no projeto.

### O que procurar

1. **Cores hardcoded** em arquivos CSS, SCSS, Tailwind config, style props, ou inline styles
2. **Variáveis CSS** ou tokens que não correspondem à paleta do DS (§2 do SKILL.md)
3. **Cores em JavaScript/TypeScript** — hex strings em componentes de gráficos, chart configs, etc.

### Como mapear

Para cada cor encontrada, classificar:

| Classificação | Ação |
|---|---|
| Existe no DS com mesmo uso | Substituir pelo token DS |
| Existe no DS com uso diferente | Verificar se o uso atual é compatível |
| Não existe no DS | Verificar se é cor de extensão (§2.3) ou erro — reportar ao usuário |
| Cor do Tailwind padrão | Substituir pelo token DS equivalente |

### Cores comuns que precisam de substituição

| Antes (comum) | Depois (DS) | Token |
|---|---|---|
| `#000000` black | `#313642` Deep Slate | `--text-heading` |
| `#FFFFFF` em fundo de página | `#F4F7FB` Frost | `--bg-page` |
| `#374151` gray-700 | `#313642` Deep Slate | `--text-heading` |
| `#6B7280` gray-500 | `#5C6167` Gray 60 | `--text-body` |
| `#9CA3AF` gray-400 | `#979BA1` Gray 40 | `--text-meta` |
| `#D1D5DB` gray-300 | `#BDC0C6` Gray 20 | `--divider` |
| `#3B82F6` blue-500 | `#1076DD` Button Blue | `--accent` |
| `#EF4444` red-500 | `#C3355D` Sunset Pink | feedback error |
| `#22C55E` green-500 | `#00CD4B` Nature Green | feedback success |
| `#F97316` orange-500 | `#FF7A27` Dawn Orange | feedback warning |

---

## Passo 2: Definir o modo cromático

Cada página ou seção do projeto precisa de um modo definido. Verificar:

1. **Fundo da página** — qual cor está sendo usada?
   - Claro/branco → Institucional claro
   - Escuro → Escuro institucional ou Serviços
2. **Se escuro**, qual é o CTA?
   - Azul claro (Sky Blue) → Escuro institucional
   - Verde-limão (Lightning Lime) → Serviços

---

## Passo 3: Instalar o bootstrap CSS

Copiar o bloco de variáveis CSS do modo correto (§15d do SKILL.md) como base. Substituir qualquer sistema de tokens existente ou adicionar como camada raiz.

---

## Passo 4: Migrar superfícies

### Bordas → Contraste de fundo

O DS usa contraste de fundo para separar elementos visuais, não bordas (§18). Substituir:

```css
/* ANTES */
.card { border: 1px solid #e5e7eb; background: white; }

/* DEPOIS */
.card { background: var(--bg-card); border-radius: 16px; }
```

Bordas são permitidas apenas em: tabelas, inputs, dividers explícitos e botão outline.

---

## Passo 5: Migrar tipografia

1. Instalar Plus Jakarta Sans (ver §1 do SKILL.md)
2. Remover qualquer outra fonte
3. Mapear todos os `font-size` para a escala do DS
4. Reduzir pesos para 400 e 600 apenas
5. Remover itálicos

---

## Passo 6: Migrar espaçamento

Todo espaçamento deve ser múltiplo de 4px. Arredondar valores existentes para o múltiplo mais próximo.

| Antes | Depois | Token |
|---|---|---|
| 10px | 8px | `--sp-2` |
| 15px | 16px | `--sp-4` |
| 20px | 24px | `--sp-6` |
| 25px | 24px | `--sp-6` |
| 30px | 32px | `--sp-8` |
| 50px | 48px | `--sp-12` |

---

## Passo 7: Migrar componentes

Para cada componente interativo, consultar o arquivo de referência relevante:

| Componente | Referência |
|---|---|
| Botões | `component-states.md` → Botões |
| Inputs/Forms | `component-states.md` → Inputs |
| Tabelas | `content-rules.md` → Tabelas |
| Modais/Overlays | `component-states.md` → Overlay patterns |
| Logo | SKILL.md §20 |

---

## Passo 8: Validar

Após a migração, executar o checklist de validação pós-build (§22 do SKILL.md). Focar especialmente em:

1. Nenhuma cor hardcoded fora da paleta
2. Nenhuma cor inventada ou aproximada
3. Superfícies usando contraste, não bordas
4. Escala tipográfica respeitada
5. Espaçamento em múltiplos de 4px

---

## Migração progressiva

Não é necessário migrar tudo de uma vez. Estratégia recomendada:

1. **Primeiro:** instalar bootstrap CSS e migrar cores globais (fundo de página, texto principal)
2. **Segundo:** migrar superfícies (cards, painéis) — remover bordas, usar contraste
3. **Terceiro:** migrar tipografia e espaçamento
4. **Quarto:** migrar componentes interativos (botões, inputs, tabelas)
5. **Quinto:** validação final com checklist
