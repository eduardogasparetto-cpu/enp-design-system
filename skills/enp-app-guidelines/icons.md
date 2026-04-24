# EnP App Guidelines — Mapeamento de Ícones (Referência)

> Arquivo de referência do `enp-app-guidelines`. Consulte o `SKILL.md` principal para regras de uso.

---

## Biblioteca padrão

**Lucide** ([lucide.dev](https://lucide.dev)) é o padrão único de ícones do DS EnP. Vale pra qualquer contexto: HTML puro, apresentações, Vue, Astro, React, e-mail estático, slides, qualquer coisa.

Nimbus (`@nimbus-ds/icons`) **coexiste** dentro do ecossistema Nuvemshop: em qualquer projeto (React ou não) que já consuma Nimbus, continuar com Nimbus pra manter consistência com a UI existente e evitar retrabalho. Nimbus **não é fallback** de Lucide — é a biblioteca que já vive naqueles códigos.

| Contexto | Biblioteca |
|---|---|
| Novo projeto, qualquer framework | **Lucide** |
| HTML puro, apresentações, slides | **Lucide** |
| React / Vue / Astro fora do ecossistema Nuvemshop | **Lucide** |
| Projeto dentro do ecossistema Nuvemshop que já usa Nimbus | **Nimbus** (continuar) |

## Navegação e cópia

Interface visual oficial pra buscar e copiar SVG:

**https://marca.ecommercenapratica.com/icones**

Tem busca em português, categorias e clique copia o SVG. Pra ícones fora do catálogo, consultar [lucide.dev](https://lucide.dev) e buscar pelo nome mais próximo da função.

## Tamanhos

| Nome | Pixels | Uso |
|---|---|---|
| Small | 16px | Inline com texto, badges |
| Medium | 18-20px | Nav items, botões com ícone |
| Large | 24px | Headers, ações destacadas |

---

## Mapeamento semântico

Coluna **Lucide** é o nome canônico. Coluna **Nimbus** é equivalência pra quem trabalha em código Nuvemshop existente.

### Navegação

| Função | Lucide | Nimbus |
|---|---|---|
| Home / Dashboard | `house` | `HomeIcon` |
| Monitor | `monitor` | `DesktopIcon` |
| Páginas | `file-text` | `FileIcon` |
| Aquisição / Canais | `globe` | `GlobeIcon` |
| Audiência / Usuários | `users` | `EcosystemIcon` |
| Temporal / Histórico | `clock` | `ClockIcon` |
| Benchmarks / Métricas | `chart-column-big` | `BarChartIcon` |
| Relatórios | `clipboard-list` | `InvoiceIcon` |
| Chat / IA | `message-circle` | `ChatDotsIcon` |
| Configurações | `settings` | `CogIcon` |
| Loja online | `store` | `OnlineStoreIcon` |
| Apps | `layout-grid` | `AppsIcon` |

### Ações

| Função | Lucide | Nimbus |
|---|---|---|
| Analisar / Buscar | `search` | `BrowserSearchIcon` |
| Atualizar | `refresh-cw` | `HistoryIcon` |
| Download | `download` | `DownloadIcon` |
| Filtrar | `funnel` | `FilterIcon` |
| Editar | `pencil` | `PencilIcon` |
| Excluir | `trash-2` | `TrashIcon` |
| Copiar | `copy` | `CopyIcon` |
| Link externo | `external-link` | `ExternalLinkIcon` |
| Adicionar | `plus` | `PlusIcon` |
| Fechar | `x` | `CloseIcon` |
| Menu hamburger | `menu` | `MenuIcon` |
| Expandir/Colapsar | `chevron-down` | `ChevronDownIcon` |
| Navegar (breadcrumb) | `chevron-right` | `ChevronRightIcon` |
| Arrastar | `grip-vertical` | `DragDotsIcon` |
| Visualizar | `eye` | `EyeIcon` |
| Ocultar | `eye-off` | `EyeOffIcon` |

### Status e feedback

| Função | Lucide | Nimbus |
|---|---|---|
| Sucesso | `circle-check` | `CheckCircleIcon` |
| Erro | `circle-x` | `ExclamationCircleIcon` |
| Alerta | `triangle-alert` | `ExclamationTriangleIcon` |
| Informação | `info` | `InfoCircleIcon` |
| Loading | `loader-circle` (animado) | `SpinnerIcon` |
| Notificação | `bell` | `NotificationIcon` |

### Conteúdo

| Função | Lucide | Nimbus |
|---|---|---|
| Calendário | `calendar` | `CalendarIcon` |
| Imagem | `image` | `PictureIcon` |
| Código | `code` | `CodeIcon` |
| E-mail | `mail` | `MailIcon` |
| Dinheiro / Receita | `dollar-sign` | `MoneyIcon` |
| Cartão de crédito | `credit-card` | `CreditCardIcon` |
| Desconto | `percent` | `DiscountCircleIcon` |
| Presente / Oferta | `gift` | `GiftBoxIcon` |
| Segurança / Lock | `lock` | `LockIcon` |
| Usuário | `user` | `IdCardIcon` |
| Logout | `log-out` | `LogOutIcon` |

---

## Regras

1. Ícones são monocromáticos — cor via token semântico do DS, nunca cor fixa
2. Sem container decorativo por padrão (sem `div` com background atrás do ícone)
3. Em botões com ícone: ícone à esquerda do texto, gap 8px
4. Ícone sozinho (icon-button): área de toque mínima 44x44px
5. Se o ícone semântico não existir nas tabelas acima, buscar em Lucide pelo nome mais próximo da função ([lucide.dev](https://lucide.dev) ou https://marca.ecommercenapratica.com/icones). Em código Nuvemshop que já usa Nimbus, continuar com Nimbus se tiver equivalente.
