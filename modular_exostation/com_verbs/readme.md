https://github.com/Projet-Exodus/Exostation/pull/9
https://github.com/Projet-Exodus/Exostation/pull/22

## Verbes de communication additionnels : LOOC et Whisper

Module ID: COM_VERBS

### Description :

Ajout d'un canal LOOC : chat OOC de proximité. Ajout d'un canal Whis, similaire au canal Me mais pour chuchoter plutôt que pour emote.

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

- `/datum/tgui_say/delegate_speech(entry, channel)` : proc réutilisé
- `/datum/tgui_say/alter_entry(payload)` : proc réutilisé

### Defines :

- `modular_exostation/_exodefines/code/com_verbs.dm`

### Fichiers inclus qui ne sont pas contenus dans ce module :

- `tgui\packages\tgui\interfaces\PreferencesMenu\preferences\features\exostation_preferences\looc.tsx`

### Crédits :

Thràvalgur (port de la version de Bandastation par larentoun)
