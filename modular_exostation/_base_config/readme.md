## Base de la configuration du repo

Module ID: BASE_CONFIG

### Description :

Tous les fichiers changés ou créés pour l'arborescence de base du repository et sa gestion

### Procs ou fichiers de TG changés :

Codeowners
- `.github/CODEOWNERS` : fichier remplacé

Templates
- `.github/ISSUE_TEMPLATE/bug_report_form.yml` : fichier remplacé
- `.github/ISSUE_TEMPLATE/config.yml` : fichier remplacé
- `.github/PULL_REQUEST_TEMPLATE.md` : fichier remplacé

Disabled workflows
- `.github/workflows/gbp_collect.yml`
- `.github/workflows/gbp.yml`
- `.github/workflows/stale.yml`

Modules & CI
- `.github/workflows/run_linters.yml` : ajout de `tools/exostation_check_grep.sh`
- `code/_compile_options.dm` : édition de `#define PRELOAD_RSC 0`
- `tools/build/build.js` : ajout de `modular_exostation/**`
- `tgstation.dme` : ajout de `modular_exostation.dme`

Config
- `config/admins.txt` : ajout de Thravalgur comme admin par défaut et du staff
- `config/config.txt` : ajout de `$include exostation/exostation_secrets.txt` et `$ include exostation/exostation_config.txt`, réglages de configuration
- `config/dbconfig.txt` : réglages de configuration
- `config/game_options.txt` : réglages de configuration
- `.gitignore` : ajout de `config/exostation_secrets.txt`
- `config/maps.txt` : configuration des maps par défaut
- `code\modules\client\preferences\security_department.dm` : permet de choisir son département à surveiller en sécurité même en commençant au brig
Config blacklist
- `config/iceruinblacklist.txt`
- `config/lavaruinblacklist.txt`
- `config/spaceruinblacklist.txt`
- `config/unbyableshuttles.txt`

### Overrides modulaires :

- N/A
<!-- Si vous ajoutez un nouvel override modulaire (d'un fichier ou d'un extrait de code) pour votre module, listez-les ici. Les fichiers de code devraient spécifier quels procs ils changent, au cas où de multiples modules utilisent le même fichier.
Exemple :
- `modular_exostation/master_files/sound/my_cool_sound.ogg`
- `modular_exostation/master_files/code/my_modular_override.dm`: `proc/overriden_proc`, `var/overriden_var`
-->

### Defines :

- N/A
<!-- Si vous avez besoin d'ajouter des defines, mentionnez les fichiers où vous avez ajouté ces defines, ainsi que le nom de ces defines. -->

### Fichiers inclus qui ne sont pas contenus dans ce module :

Templates
- `.github/ISSUE_TEMPLATE/planification.yml` : fichier créé

Autolaber
- `.github/workflows/exostation_label.yml` : fichier créé
- `.github/labeler.yml` : fichier créé

Modules & CI
- `tools/exostation_check_grep.sh` : fichier créé

Config
- `exostation/exostation_config.txt` : fichier créé
- `exostation/exostation_secrets.txt` : fichier créé (non inclus)
- `config/exo_motd.txt` : fichier créé

### Crédits :
Général : Thravalgur
Modularité : inspiration et ports des codebases SS220, Skyrat/NovaSector, FulpStation, orbstation, BubberStation, MappleStation...
