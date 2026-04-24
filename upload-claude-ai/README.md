# Subir as skills na sua conta Claude

Esta pasta tem os 5 arquivos `.zip` prontos pra você subir no **claude.ai**, pra que as skills fiquem disponíveis na sua conta em qualquer dispositivo (celular, outro computador, Claude no browser), não só no Claude Code da sua máquina.

> Se você só usa Claude Code em uma máquina e já rodou o instalador descrito no README principal, pode ignorar essa pasta.

## Passo a passo

1. Baixe os 5 arquivos `.zip` desta pasta pra sua máquina.
2. Abra [claude.ai](https://claude.ai) no navegador e faça login.
3. Clique no seu avatar (canto inferior esquerdo) → **Settings**.
4. Na lateral, vai em **Capabilities** → **Skills**.
5. Clique em **Create skill**.
6. Arraste o arquivo `enp-design-system.zip` pra janela que abriu.
7. Nome e descrição vão preencher sozinhos. Confirme e salve.
8. Repita os passos 5–7 pros outros 4 arquivos, nesta ordem:
   - `enp-app-guidelines.zip`
   - `enp-audit.zip`
   - `enp-polish.zip`
   - `enp-clarify.zip`
9. Feche e abra o Claude Code pra ele sincronizar.

Pronto. As 5 skills agora aparecem em qualquer Claude logado na sua conta.

## Quando sair uma versão nova

Quando você vir aviso de versão nova no `#ds-enp`:

1. Abra claude.ai → Settings → Capabilities → Skills.
2. Apague as skills antigas (as que começam com `enp-`).
3. Volte nesta pasta, baixe os novos `.zip`.
4. Faça os passos acima de novo.

## Diferença entre este método e o `install.sh`

- **`install.sh`** (README principal): instala na sua máquina. Vale só ali.
- **Esta pasta**: sobe na sua conta Claude. Vale em qualquer lugar que você logar.

Você pode usar os dois, ou só um. Se usar os dois, o Claude Code vai mostrar as skills duplicadas na lista — funciona, mas pode atrapalhar o autocomplete.
