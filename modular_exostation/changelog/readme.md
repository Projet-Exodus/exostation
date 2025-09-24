## Base de la configuration du repo

Module ID: EXO_CHANGELOG

### Description :

Tous les fichiers changés ou créés pour l'arborescence de base du repository et sa gestion

### Procs ou fichiers de TG changés :

- `.github/workflows/compile_changelogs.yml` : édition du fichier de destination `modular_exostation/changelogs`
- `code/_onclick/hud/new_player.dm` : édition du changelog affiché `usr.client?.exo_changelog()`
- `code/modules/client/client_procs.dm` : édition du changelog vérifié `if(prefs.last_exo_changelog != GLOB.exo_changelog_hash)`
- `code/modules/client/preferences_savefile.dm` : ajout de `savefile.set_entry("last_exo_changelog", last_exo_changelog)`
- `code/modules/client/preferences.dm` : ajout de `var/last_exo_changelog = ""`
- `interface/interface.dm` : renommage de "Changelogs" en "/TG/ Changelogs"
- `code\modules\escape_menu\home_page.dm` : ajout du bouton pour les changelogs d'Exostation
- `tools/ci/check_changelogs.sh` : édition du fichier de destination `modular_exostation/changelogs`
- `tools/pull_request_hooks/autoChangelog.js` : édition du fichier de destination `modular_exostation/changelogs`
- `tools/makeChangelog.bat` : édition du fichier de destination `modular_exostation/changelogs`
- `tools/ss13_genchangelog.py` : ajout de `allow_unicode=True`

### Overrides modulaires :

- N/A

### Defines :

- N/A

### Fichiers inclus qui ne sont pas contenus dans ce module :

- `modular_exostation/changelogs` : dossier des changelogs archivés
- `tgui/packages/tgui/interfaces/ExoChangelog.jsx` : création du fichier des changelogs

### Crédits :

Thravalgur
Port de fonctionnalités des codebases Bandastation (Maxiemar) et FulpStation (QuiteLiterallyAnything, FernandoJ8), adaptation du changelog de /tg/ (celotajstg)
