https://github.com/Projet-Exodus/Exostation/pull/<!--PR Number-->

## Holomap

Module ID: HOLOMAPS

### Description :

Holomaps intégrées aux PDA, aux IA et aux robots.
Engineering holomaps (pour voir l'emplacement des air alarms en alerte).

### Procs ou fichiers de TG changés :

- `code\modules\modular_computers\computers\item\pda.dm` : `Initialize(mapload)` : ajout de `return INITIALIZE_HINT_LATELOAD`

### Overrides modulaires :

- N/A

### Defines :

- `_exodefines/code/holomap.dm`
- `_exodefines/code/holomap_global_lists.dm`

### Fichiers inclus qui ne sont pas contenus dans ce module :

- N/A

### Crédits :
Thravalgur (port de la fonctionnalité pour Exostation)
Bobbanz1 et DeltaFire15 (NSV13)
RimiNosha (Port original dans les downstreams de tg)
Woodratt (Polaris), DietyLink (Création originale du module Holomap) (/vg/station)
