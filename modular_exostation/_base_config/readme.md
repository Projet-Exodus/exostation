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
- `.github/workflows/run_linters.yml` : ajout de `modular_exostation/tools/exostation_check_grep.sh`
- `.github/workflows/discord_pr_announce.yml` : remplacement de l'avatar
- `code/_compile_options.dm` : édition de `#define PRELOAD_RSC 0`
- `tools/deploy.sh` : ajout de `modular_exostation` et exclusions pour les tests
- `tools/build/build.ts` : ajout de `modular_exostation/**`
- `tgstation.dme` : ajout de `modular_exostation.dme`

Config
- `.gitignore` : ajout de `config/exostation_secrets.txt`
- `config/admins.txt` : ajout de Thravalgur comme admin par défaut et du staff
- `config/config.txt` : ajout de `$include exostation/exostation_secrets.txt` et `$ include exostation/exostation_config.txt`, réglages de configuration
- `config/dbconfig.txt` : réglages de configuration
- `config/game_options.txt` : réglages de configuration
- `config/maps.txt` : configuration des maps par défaut
- `config/jobconfig.toml` : config des jobs
- `config/silicons_laws.txt` : config des lois IA/cyborgs

Config blacklist
- `config/iceruinblacklist.txt`
- `config/lavaruinblacklist.txt`
- `config/spaceruinblacklist.txt`
- `config/unbyableshuttles.txt`

Apparence
- `interface/skin.dmf` : changement de l'icône

Marche par défaut :
- `code/modules/mob/living/living_defines.dm` : édition de `var/move_intent`

### Overrides modulaires :

- N/A

### Defines :
- N/A

### Fichiers inclus qui ne sont pas contenus dans ce module :

Templates
- `.github/ISSUE_TEMPLATE/planification.yml` : fichier créé

Autolaber
- `.github/workflows/exostation_label.yml` : fichier créé
- `.github/labeler.yml` : fichier créé

Modules & CI
- `modular_exostation/tools/exostation_check_grep.sh` : fichier créé

Config
- `exostation/exostation_config.txt` : fichier créé
- `exostation/exostation_secrets.txt` : fichier créé (non inclus)
- `config/exo_motd.txt` : fichier créé

### Crédits :
Général : Thravalgur
Modularité : inspiration et ports des codebases SS220 (Bandastation), Skyrat/NovaSector, FulpStation, orbstation, BubberStation, MappleStation...
