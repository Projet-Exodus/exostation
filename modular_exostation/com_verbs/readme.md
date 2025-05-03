https://github.com/Projet-Exodus/Exostation/pull/9

## LOOC

Module ID: LOOC

### Description :

Ajout d'un canal LOOC.

### Procs ou fichiers de TG changés :
- `code/datums/chatmessage.dm`
- `tgui\packages\tgui-panel\styles\tgchat\chat-dark.scss`
- `tgui\packages\tgui-panel\styles\tgchat\chat-light.scss`
- `\tgui\packages\tgui-say\ChannelIterator.test.ts`
- `\tgui\packages\tgui-say\ChannelIterator.ts`
- `\tgui\packages\tgui-say\styles\colors.scss`

**Fichiers de base contenant des éléments de looc**
- `code/_DEFINES/span.dm`
- `code/_globalvars/admin.dm`
- `tgui\packages\tgui-panel\styles\tgchat\chat-dark.scss`
- `tgui\packages\tgui-panel\styles\tgchat\chat-light.scss`

### Overrides modulaires :

- `/datum/tgui_say/delegate_speech(entry, channel)`
- `/datum/tgui_say/alter_entry(payload)`

### Defines :
- `modular_exostation/_exodefines/code/LOOC.dm`

### Fichiers inclus qui ne sont pas contenus dans ce module :

- `tgui\packages\tgui\interfaces\PreferencesMenu\preferences\features\game_preferences\looc.tsx`

### Crédits :
Thràvalgur (port de la version de Bandastation par larentoun)
