https://github.com/Projet-Exodus/Exostation/pull/11
https://github.com/Projet-Exodus/Exostation/pull/25


## Local Fixes

Module ID: LOCAL_FIXES

### Description :

Solutions temporaires pour des problèmes ou bugs présents upstream

### Procs ou fichiers de TG changés :

**Pour les screentips :**

- `code/datums/screentips/screentips.dm` : édition de #define HINT_ICON_FILE
- `code/game/atom/_atom.dm` : ne pas désactiver les icônes de screentips

**Pour les unit tests :**
- Déplacement de `code/modules/unit_tests/area_contents.dm` vers `modular_exostation/local_fixes/disabled_code/area_contents.dm`
- Désactivation de `area_contents` dans `code/modules/unit_tests/_unit_tests.dm`

### Overrides modulaires :

**Pour les screentips :**

- `icons/ui/screentips/cursor_hints.dmi` : pas modulaire, via un edit

### Defines :

- N/A

### Fichiers inclus qui ne sont pas contenus dans ce module :

- N/A

### Crédits :
Thràvalgur
