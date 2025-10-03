https://github.com/Projet-Exodus/Exostation/pull/<!--PR Number-->

## Lore - Flavor text, records, etc.

Module ID: EXOLORE

### Description :

Ce module ajoute un onglet Lore à la création des personnages, pour rajouter un âge chronologique, une description courte et une description longue, des entrées de leur dossier général, leur dossier médical et leur dossier de sécurité.

### Procs ou fichiers de TG changés :

- `code\datums\records\manifest.dm` : `/datum/manifest/proc/inject`, `new /datum/record/crew` (ajout de variables)
- `code\datums\records\record.dm` : `/datum/record/crew/New` (ajout de variables), `/datum/record/locked/New` (ajout de variables), `/datum/record/crew/proc/get_rapsheet` (ajout d'élements de texte)
- `code\game\machinery\hologram.dm` : `/obj/machinery/holopad/proc/activate_holo(mob/living/user)` (ajout de l'overlay temporary flavor text)
- `code\game\machinery\computer\records\medical.dm` : `/obj/machinery/computer/records/medical/ui_data(mob/user)` (ajout dans la liste `var/list/records`)
- `code\game\machinery\computer\records\security.dm` : `/obj/machinery/computer/records/security/ui_data(mob/user)` (ajout dans la liste `var/list/records`)
- `code\modules\admin\admin_verbs.dm` : `GLOB.manifest.inject(character)` (ajout de character.client)
- `code\modules\admin\verbs\admingame.dm` : `GLOB.manifest.inject(character)` (ajout de character.client)
- `code\modules\mob\dead\new_player\new_player.dm` : `GLOB.manifest.inject(humanc)` (ajout de `person_client = humanc.client`)
- `code\modules\mob\living\carbon\examine.dm` : `/mob/living/carbon/examine(mob/user)` (ajout des descriptions supplémentaires)
- `code\modules\mob\living\silicon\ai\examine.dm` : `/mob/living/silicon/ai/examine(mob/user)` (ajout des descriptions supplémentaires)
- `code\modules\mob\living\silicon\robot\examine.dm` : `/mob/living/silicon/robot/examine(mob/user)` (ajout des descriptions supplémentaires)

**Fichiers TGUI**

- `tgui\packages\tgui\interfaces\MedicalRecords\RecordView.tsx`
- `tgui\packages\tgui\interfaces\MedicalRecords\types.ts`
- `tgui\packages\tgui\interfaces\PreferencesMenu\types.ts`
- `tgui\packages\tgui\interfaces\PreferencesMenu\CharacterPreferences\index.tsx`
- `tgui\packages\tgui\interfaces\PreferencesMenu\CharacterPreferences\MainPage.tsx`
- `tgui\packages\tgui\interfaces\PreferencesMenu\preferences\features\base.tsx`
- `tgui\packages\tgui\interfaces\PreferencesMenu\preferences\features\character_preferences\age.tsx`
- `tgui\packages\tgui\interfaces\SecurityRecords\RecordView.tsx`
- `tgui\packages\tgui\interfaces\SecurityRecords\types.ts`
- `tgui\packages\tgui-panel\styles\tgchat\chat-dark.scss`
- `tgui\packages\tgui-panel\styles\tgchat\chat-light.scss`

### Overrides modulaires :

- `code/game/atom_examine.dm`
- `code/modules/mob/living/carbon/human/human.dm`
- `code/modules/mob/living/silicon/robot/robot.dm`
- `code/modules/mob/living/silicon/ai/ai.dm`
- ``

### Defines :

- `code\__DEFINES\~exodefines\preferences.dm`
- `code\__DEFINES\~exodefines\span.dm`
- `code\__DEFINES\~exodefines\traits.dm`
- `code/modular_exostation/_exodefines/lore.dm`

### Fichiers inclus qui ne sont pas contenus dans ce module :

**Fichiers TGUI**

- `tgui\packages\tgui\interfaces\PreferencesMenu\ExoLorePage.tsx`
- `tgui\packages\tgui\interfaces\PreferencesMenu\ExoSinglePreference.tsx`
- `tgui\packages\tgui\interfaces\PreferencesMenu\preferences\features\exostation_preferences\lore.tsx`

### Mise en forme : span

**Defines**

- `code\__DEFINES\~exodefines\span.dm`

**Fichiers TGUI**

- `tgui\packages\tgui-panel\styles\tgchat\chat-dark.scss`
- `tgui\packages\tgui-panel\styles\tgchat\chat-light.scss`

### Crédits :

Thràvalgur
Ephemeralis, Nerev4r, Pink-MB (DopplerShift PR [64](https://github.com/DopplerShift13/DopplerShift/pull/64), [262](https://github.com/DopplerShift13/DopplerShift/pull/262), [349](https://github.com/DopplerShift13/DopplerShift/pull/349), [586](https://github.com/DopplerShift13/DopplerShift/pull/586))
