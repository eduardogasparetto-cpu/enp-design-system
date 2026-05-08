# `data/` — exportação machine-readable da skill

Esta pasta NÃO é instalada nas máquinas dos usuários. O `install.sh` copia só `skills/<name>/`. Os zips em `upload-claude-ai/` empacotam só `skills/<name>/`. `data/` vive aqui pra ser consumida por aplicações externas (notavelmente o site `https://marca.ecommercenapratica.com/`).

## Arquivos

| Arquivo | Espelha | Conteúdo |
|---|---|---|
| `tokens.json` | `skills/enp-design-system/SKILL.md` §1, §2, §4, §5, §13, §14 | Cores (hex+OKLCH), tipografia, spacing, radius, breakpoints, z-index |
| `icons.json` | `skills/enp-app-guidelines/icons.md` | Mapeamento semântico Lucide → Nimbus por função |
| `components.json` | `skills/enp-app-guidelines/SKILL.md` §2-11 | Anatomia + variantes + estados de AppShell, Page, Card, Tabs, FormField, Modal, etc |
| `voice.json` | `skills/enp-clarify/SKILL.md` | Voz EnP 60/40, vocabulário positivo/negativo, fórmula de erro |

## Regra de manutenção

Os JSONs são **derivados** do markdown nas skills. Atualização manual no mesmo PR que toca a spec correspondente. Se o markdown muda, o JSON espelha imediatamente.

Próxima evolução prevista (v3.3.0): script de geração + CI check que reprova merge se markdown e JSON divergirem.

## Consumo externo

URL pública (raw):

```
https://raw.githubusercontent.com/eduardogasparetto-cpu/enp-design-system/main/data/tokens.json
https://raw.githubusercontent.com/eduardogasparetto-cpu/enp-design-system/main/data/icons.json
https://raw.githubusercontent.com/eduardogasparetto-cpu/enp-design-system/main/data/components.json
https://raw.githubusercontent.com/eduardogasparetto-cpu/enp-design-system/main/data/voice.json
```

Cada arquivo carrega um campo `version` que casa com a versão da skill no momento do export (ex.: `"version": "3.2.0"`).

## Hierarquia de autoridade

A skill é a fonte da verdade. Os JSONs são exportações fiéis. O site `marca.ecommercenapratica.com` é vitrine pública — quando renderizar conteúdo destes JSONs, deve declarar isso no header da página ("Vitrine pública. Spec canônica vive em `enp-design-system/skills/`."). Em qualquer ambiguidade entre o site e a skill, **a skill vence**.
