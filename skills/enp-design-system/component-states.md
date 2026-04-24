# EnP Design System — Estados de Componentes (Referência)

> Arquivo de referência do `enp-design-system`. Consulte o `SKILL.md` principal para protocolo de inicialização e bootstrap CSS.

---

## Botões

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

### Primário — Modo institucional claro (fundo Frost)

| Estado | Background | Texto | Borda | Extra |
|---|---|---|---|---|
| Default | `#1076DD` | `#FFFFFF` | transparent | - |
| Hover | `#FFFFFF` | `#1076DD` | `1px #1076DD` | - |
| Active | `#0A5BB5` | `#FFFFFF` | transparent | `scale(0.98)` |
| Focus | `#1076DD` | `#FFFFFF` | - | ring `3px #1076DD/40 offset 2px` |
| Disabled | `#d5d7d9` | `#494B4D` | transparent | `cursor: not-allowed` |
| Loading | `#1076DD` | transparent | - | spinner branco · `cursor: wait` |

### Primário — Modo escuro institucional (fundo #303339)

| Estado | Background | Texto | Borda | Extra |
|---|---|---|---|---|
| Default | `#31B3F9` | `#0D1B2E` | transparent | - |
| Hover | `#5AABF5` | `#0D1B2E` | transparent | - |
| Active | `#1A8FD1` | `#0D1B2E` | transparent | `scale(0.98)` |
| Focus | `#31B3F9` | `#0D1B2E` | - | ring `3px #31B3F9/40 offset 2px` |
| Disabled | `#303339` | `#5C6167` | `1px #5C6167` | `cursor: not-allowed` |
| Loading | `#31B3F9` | transparent | - | spinner Midnight · `cursor: wait` |

### Primário — Modo serviços (fundo Midnight)

| Estado | Background | Texto | Borda | Extra |
|---|---|---|---|---|
| Default | `#CDFF07` | `#0D1B2E` | transparent | - |
| Hover | `#D9FF3D` | `#0D1B2E` | transparent | - |
| Active | `#B8E000` | `#0D1B2E` | transparent | `scale(0.98)` |
| Focus | `#CDFF07` | `#0D1B2E` | - | ring `3px #CDFF07/40 offset 2px` |
| Disabled | `#1A2640` | `#5C6167` | transparent | `cursor: not-allowed` |
| Loading | `#CDFF07` | transparent | - | spinner Midnight · `cursor: wait` |

### Secundário (outline)

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

### Ghost/link

Base: `background: transparent`, `border: none`, underline no hover.

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

### Feedback global — todos os modos

| Tipo | Background | Texto | Uso |
|---|---|---|---|
| Success | `#00CD4B` Nature Green | `#0D1B2E` | Ação concluída |
| Error | `#C3355D` Sunset Pink | `#FFFFFF` | Falha, validação |
| Warning | `#FF7A27` Dawn Orange | `#0D1B2E` | Atenção necessária |
| Info | `#31B3F9` Sky Blue | `#0D1B2E` | Informação neutra |
| Loading | `#1076DD` Button Blue | `#FFFFFF` | Processamento |

---

## Inputs e formulários

### Especificação base — todos os modos

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

### Modo institucional claro

| Estado | Background | Borda | Label | Placeholder | Extra |
|---|---|---|---|---|---|
| Default | `#FFFFFF` | `1px #BDC0C6` | `#313642` | `#979BA1` | - |
| Focus | `#FFFFFF` | `2px #1076DD` | `#1076DD` | `#979BA1` | ring sutil |
| Filled | `#FFFFFF` | `1px #BDC0C6` | `#313642` | - | - |
| Error | `#FFFFFF` | `2px #C3355D` | `#C3355D` | `#979BA1` | mensagem abaixo |
| Disabled | `#EFF1F4` | `1px #BDC0C6` | `#979BA1` | `#BDC0C6` | `cursor: not-allowed` |
| Success | `#FFFFFF` | `2px #00CD4B` | `#313642` | - | ícone check direita |

### Modo escuro institucional

| Estado | Background | Borda | Label | Placeholder | Extra |
|---|---|---|---|---|---|
| Default | `#1A1D22` | `1px #979BA1` | `#BDC0C6` | `#5C6167` | - |
| Focus | `#1A1D22` | `2px #31B3F9` | `#31B3F9` | `#5C6167` | ring sutil |
| Filled | `#1A1D22` | `1px #979BA1` | `#BDC0C6` | - | - |
| Error | `#1A1D22` | `2px #C3355D` | `#C3355D` | `#5C6167` | mensagem abaixo |
| Disabled | `#212328` | `1px #303339` | `#5C6167` | `#303339` | `cursor: not-allowed` |
| Success | `#1A1D22` | `2px #00CD4B` | `#BDC0C6` | - | ícone check direita |

### Modo serviços (fundo Midnight)

| Estado | Background | Borda | Label | Placeholder | Extra |
|---|---|---|---|---|---|
| Default | `#0F1F33` | `1px #5C6167` | `#BDC0C6` | `#5C6167` | - |
| Focus | `#0F1F33` | `2px #31B3F9` | `#31B3F9` | `#5C6167` | ring sutil |
| Filled | `#0F1F33` | `1px #5C6167` | `#BDC0C6` | - | - |
| Error | `#0F1F33` | `2px #C3355D` | `#C3355D` | `#5C6167` | mensagem abaixo |
| Disabled | `#0A1524` | `1px #303339` | `#303339` | `#303339` | `cursor: not-allowed` |
| Success | `#0F1F33` | `2px #00CD4B` | `#BDC0C6` | - | ícone check direita |

---

## Overlay patterns

| Contexto | Token | Blur | Z-index | Comportamento |
|---|---|---|---|---|
| Modal | `midnight/55` | `blur(10px)` | 1055 | Clique fora fecha |
| Onboarding | `midnight/80` | nenhum | 1060 | Só fecha por botão |
| Loading/Splash | Frost sólido `#F4F7FB` | nenhum | 1090 | Auto-dismiss |
| Dropdown | transparente | nenhum | 1000 | Clique fora fecha |
| Toast | sem overlay | nenhum | 1090 | Auto-dismiss 3s |
| Drawer/Sidebar | `midnight/40` | `blur(2px)` | 1045 | Clique fora ou swipe fecha |

### Overlay de modal (CSS)

```css
background: rgba(13, 27, 46, 0.55); /* midnight/55 */
backdrop-filter: blur(10px);
-webkit-backdrop-filter: blur(10px);
```
