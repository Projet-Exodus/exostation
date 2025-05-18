https://github.com/Projet-Exodus/Exostation/pull/40

## Exo-Minage

Module ID: EXOMINING

### Description :

Diverses modifications (rééquilibrage, qol) pour le minage.

### Procs ou fichiers de TG changés :

- `code\modules\mob\living\simple_animal\hostile\megafauna\legion.dm` : ajout du sous-type `/obj/structure/closet/crate/necropolis/tendril/legion`
- `code\modules\mob\living\basic\lavaland\bileworm\bileworm_actions.dm` : ajout de `target.AddElement(/datum/element/safer_stomach)`
- `code\datums\components\chasm.dm` : remplacement par le proc `on_living_fallen` dans le proc `/datum/component/chasm/proc/drop(atom/movable/dropped_thing)` pour la condition `else if(isliving(dropped_thing))`
- `code\game\objects\structures\lavaland\ore_vent.dm` : édition du proc `start_wave_defense()`

### Overrides modulaires :

- `\code\game\objects\structures\icemoon\cave_entrance.dm` : proc `/obj/effect/collapsing_demonic_portal/drop_loot()` override dans `icebox_demonic_portal.dm`
- `code\modules\mining\equipment\kheiral_cuffs.dm` : procs `/obj/item/kheiral_cuffs/Initialize(mapload)`, `/obj/item/kheiral_cuffs/connect_kheiral_network(mob/living/user)`, `/obj/item/kheiral_cuffs/remove_kheiral_network(mob/user)` overrides dans `kheiral_cuffs_alert.dm`
- `code\datums\components\chasm.dm` : proc `/obj/effect/abstract/chasm_storage/proc/on_revive(mob/living/escapee)` overrides dans `safer_climb_chasm.dm`
- `code\game\turfs\open\lava.dm` : vars de `/turf/open/lava` dans `safer_lava.dm`

### Defines :

- N/A

### Fichiers inclus qui ne sont pas contenus dans ce module :

- N/A

### Crédits :
Thràvalgur : adaptations pour Exostation & adaptation des ore_vents
Crédits des PR d'origine :
IrisStation : coffre du Legion, alerte de travail avec les drones des ore vents (Gboster-0)
Orbstation : safer climb chasm (Jacquerel, Profakos), alerte sur les kheiral cuffs avec voucher set (VioletN), safer stomach pour les bileworms et les legions, icebox demonic portal et megafauna dormante (Jacquerel),
