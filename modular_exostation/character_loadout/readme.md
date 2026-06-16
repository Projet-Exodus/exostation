<!-- Ce fichier doit être copié-collé à la racine de votre dossier de module en tant que readme.md -->

https://github.com/Projet-Exodus/Exostation/pull/<!--PR Number-->

## Character loadout

Module ID: CHAR_LOADOUT

### Description :

Fonctionnalités supplémentaires du loadout.

### Procs ou fichiers de TG changés :

- `code\modules\loadout\categories\accessories.dm`
- `code\modules\loadout\categories\glasses.dm`
- `code\modules\loadout\categories\heads.dm`
- `code\modules\loadout\categories\inhands.dm`
- `code\modules\loadout\categories\pocket.dm`
- `code\modules\loadout\loadout_helpers.dm`
- `code\modules\loadout\loadout_items.dm`
- `tgui\packages\tgui\interfaces\PreferencesMenu\types.ts`
- `tgui\packages\tgui\interfaces\PreferencesMenu\CharacterPreferences\loadout\base.ts`
- `tgui\packages\tgui\interfaces\PreferencesMenu\CharacterPreferences\loadout\index.tsx`
- `tgui\packages\tgui\interfaces\PreferencesMenu\CharacterPreferences\loadout\ItemDisplay.tsx`
- `tgui\packages\tgui\interfaces\PreferencesMenu\CharacterPreferences\loadout\ModifyPanel.tsx`
- `tgui\packages\tgui\interfaces\PreferencesMenu\types.ts`

### Overrides modulaires :

- `code\game\objects\items\storage\briefcase.dm` : dans `modular_exostation\character_loadout\code\loadout_briefcase.dm`

### Defines :

- `code\__DEFINES\~exodefines\loadout.dm`

### Fichiers inclus qui ne sont pas contenus dans ce module :

- `tgui\packages\tgui\interfaces\PreferencesMenu\preferences\features\exostation_preferences\loadout_override_preference.tsx`

### Crédits :

"Multiple loadout presets" : Port de fonctionnalité de Bubberstation (RimiNosha), par Thravalgur
"Place all in case" : Port de fonctionnalité de Dopplershift (Ephemeralis) repris d'un autre serveur, par Thravalgur
