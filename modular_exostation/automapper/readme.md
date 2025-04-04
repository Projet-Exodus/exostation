## Base de la configuration du repo

Module ID: AUTOMAPPER

### Description:

Tous les fichiers changés ou créés pour l'arborescence de base du repository et sa gestion

### Procs ou fichiers de TG changés :

- `code/controllers/subsystem/mapping.dm` : multiples ajouts et dependencies

### Overrides modulaires :

- N/A
<!-- Si vous ajoutez un nouvel override modulaire (d'un fichier ou d'un extrait de code) pour votre module, listez-les ici. Les fichiers de code devraient spécifier quels procs ils changent, au cas où de multiples modules utilisent le même fichier.
Exemple :
- `modular_exostation/master_files/sound/my_cool_sound.ogg`
- `modular_exostation/master_files/code/my_modular_override.dm`: `proc/overriden_proc`, `var/overriden_var`
-->

### Defines:

- NA/A

### Fichiers inclus qui ne sont pas contenus dans ce module :
- `_maps/exostation/automapper` : dossier non-modulaire

### Crédits:
Adaptation par Thravalgur
Code original par Gandalf2k15
Port de fonctionnalités de Skyrat/NovaSector/TaleStation/Bandastation


## A propos
Cet automapper a été créé dans le but de rendre la construction de cartes beaucoup plus simple pour les cartes modulaires, cela devrait dire moins de réinitialisations manuelles de maps (idéalement, jamais). Il comprend deux types d'automapping, l'automapper par zone (simple area automapper) et l'automapper par modèles (template automapper).

### Simple Area Automapper
Cet automapper vérifie une zone pour y trouver une tuile unique convenable pour y faire spawner un objet. Il utilise un heatmapping "intelligent" pour chpisir l'emplacement, avec un algorithme pour décider où placer l'objet en évitant de bloquer un couloir ou une porte.

### Template Automapper
Cet automapper a été créé pour charger des modèles par dessus des maps existantes en utilisant un fichier template et une entrée dans le fichier config toml.
