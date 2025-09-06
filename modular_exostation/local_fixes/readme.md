https://github.com/Projet-Exodus/Exostation/pull/11 (réglé)
https://github.com/Projet-Exodus/Exostation/pull/25

## Local Fixes

Module ID: LOCAL_FIXES

### Description :

Solutions temporaires pour des problèmes ou bugs présents upstream

### Procs ou fichiers de TG changés :

**Pour les unit tests :**

- Déplacement de `code/modules/unit_tests/area_contents.dm` vers `modular_exostation/local_fixes/disabled_code/area_contents.dm`
- Désactivation de `area_contents` dans `code/modules/unit_tests/_unit_tests.dm` : pas de commentaire possible, mais aurat dû figurer avant ligne 97 //EXOSTATION EDIT REMOVAL : LOCAL_FIXES Test qui n'est pas cohérent : conflits avec Holomap ? ORIGINAL include "area_contents.dm"

### Overrides modulaires :

### Defines :

- N/A

### Fichiers inclus qui ne sont pas contenus dans ce module :

- N/A

### Crédits :

Thràvalgur
