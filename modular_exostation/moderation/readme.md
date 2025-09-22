https://github.com/Projet-Exodus/Exostation/pull/48

## Modération

Module ID: MODERATION

### Description :

Diverses modifications (suppressions, modifications) de modération.

### Procs ou fichiers de TG changés :

**Retraits par commentaire**

Clowns et bananium

- `code\game\objects\effects\anomalies\anomalies_dimensional_themes.dm` : pas d'anomalie au bananium
- `code\modules\cargo\packs\imports.dm` : pas de commande de bananium
- `code\modules\mob_spawn\corpses\mining_corpses.dm` : pas de corps de clown
- `code\game\objects\effects\spawners\random\decoration.dm` : pas de statue en bananium
- `code\game\objects\structures\icemoon\cave_entrance.dm` pas de probabilité de bananium
- `code\modules\mining\lavaland\mining_loot\megafauna\colossus.dm` : plus de cristal de résurrection en clown

Verbes et menus

- `code\modules\escape_menu\home_page.dm` : plus d'accès direct au verbe suicide
- `code\datums\spawners_menu.dm` : retrait des ghost roles afin de privilégier les actions autour de la station

Grossophobie

- `code\modules\reagents\chemistry\reagents\food_reagents.dm` : pas d'effet mortel à l'extrait de menthe (`/datum/reagent/consumable/mintextract/on_mob_life(mob/living/carbon/affected_mob, seconds_per_tick, times_fired)`)
- `code\game\machinery\fat_sucker.dm` : remplacements de textes

Religion

- `code\modules\library\bibles.dm` : noms & images
- `code\modules\jobs\job_types\chaplain\chaplain.dm` : retrait de typesde religions pré-enregistrés
- `code\modules\jobs\job_types\chaplain\chaplain_nullrod.dm` : retrait de types de nullrod
- `strings\names\religion.txt` : noms proposés aléatoirement

**Edits non-modulaires**

Bananium

- `code\modules\research\xenobiology\crossbreeding\charged.dm` : pas de spawn de bananium, le slime pyrite spawn à la place des bluespace bananas
- `code\modules\meteors\meteor_types.dm` : pas de météore au bananium, il contient à la place des bluespace bananas

Grossophobie

- `code\game\machinery\fat_sucker.dm` : remplacement de la phrase grossophobe

Psychologie

- `code\datums\mood.dm` : remplacement de sanity par stress

Verbes et menus

- `code\_onclick\hud\ghost.dm` : accès simplifié au verbe Respawn pour les observateurs et les morts - Retrait des mini-jeux

### Overrides modulaires :

**_Voir les commentaires des fichiers du module pour les overrides modulaires_**

### Defines :

- N/A

### Fichiers inclus qui ne sont pas contenus dans ce module :

- N/A

### Crédits :

Thràvalgur
Emprunts aux changements faits par TaleStation, Orbstation et Dopplershift13
