# Comment fonctionne le code spécifique à Exostation ?

Exostation se base sur le code de /tg/station, mais y apporte des modifications qui lui sont propres ou qui sont empruntées à d'autres codebases, conformément à leur licence.
Afin de permettre d'intégrer plus facilement les mises à jour vers le code de /tg/station et de réduire le nombre de conflits relatifs au code, les changements apportés sont majoritairement modulaires.

Il est à noter que les changements liés à la traduction de certains éléments en français ne seront que partiellement modulaires.

## Modularité

La **modularisation** est le fait d'introduire des changements ou des ajouts sans toucher au contenu de base des fichiers ou des dossiers provenant de /tg/station, en les regroupant dans un ou des dossiers spécifiques, ici le dossier **`modular_exostation/`**, qui sera aussi indépendant que possible du code principal.

### Comment créer un module

- Trouver un nom et un ID pour le module : `EXO_CHANGELOGS` ou `ANIMAUX_DE_COMPAGNIE` en majuscules, qui servira pour la documentation future. Ce nom et cet ID doivent rester identiques à chaque occurence afin de faciliter la recherche sensible à la casse.
- Créer le dossier en copiant la structure du dossier : `modular_exostation/example`. Un sous-dossier icons et/ou sounds peut être ajouté si nécessaire. Les sons et images que l'on retrouverait dans plusieurs modules sont à placer dans un module spécifique.
- Remplir le readme, ajouter des commentaires pour documenter les modifications apportées au code de /tg/ et les éventuels ajouts liés à d'autres modules.

## Ajouts, retraits ou changements non-modulaires

Les ajouts, retraits ou changements qui ne peuvent pas être modularisés ou qui seraient difficile à mettre à jour en étant modularisés devront être renseignés et marqués par des commentaires spécifiant où les changements commencent et s'arrêtent, ainsi qu'à quel module ils se rattachent.

Une seule ligne avec un ajout, une suppression ou un changement :
`// EXOSTATION EDIT (ADDITION/REMOVAL/CHANGE) - ID du module + Commentaire`
Plusieurs lignes ajoutées, supprimées ou changées, avoir une ligne START et une ligne END :
`// EXOSTATION EDIT (ADDITION/REMOVAL/CHANGE) START - ID du module + Commentaire`
`// EXOSTATION EDIT (ADDITION/REMOVAL/CHANGE) END`
Le but de la modularisation est de faciliter le suivi des modifications et des fonctionnalités ajoutées, pour pouvoir intégrer les mises à jour vers TG sans risquer la suppression accidentelle de ces éléments personnalisés.
Toutes les Pull Requests qui touchent à un fichier de /tg/ ou qui utilisent les sprites/sons de /tg/ doivent remplir le readme.md dans le fichier du module concerné, qui explique ce qui a été fait.

Indications pour mettre des commentaires dans le code (fichiers en .dm)

```byond
// Commentaires
```

```byond
/**
* Commentaires sur plusieurs lignes
*/
```

Quand les commentaires en // ne sont pas possibles :

```js
<SomeThing someProp="whatever" /* FONCTIONE */ />
```

```js
{
	/* EXOSTATION EDIT ADDITION START */
}
<SomeThing>someProp="whatever"</SomeThing>;
{
	/* EXOSTATION EDIT ADDITION END */
}
```

## Fichiers spécifiques

### Defines

Les "defines" (définitions) ont besoin d'être placées dans le .dme avant les fichiers où elles sont utilisées pour être chargées au bon moment. Cela inclut les "helpers", certaines constantes ("symbolic constants"), etc.
De ce fait, un fichier de définitions placé dans le dossier `modular_exostation` sera chargé avant nos fichiers, mais après les fichiers de TG. Si le define est utilisé en dehors de nos fichiers modulaires, cela posera un problème.
Pour cette raison, toutes les définitions qui sont utilisées en dehors des modules **doivent** être déclarées dans un sous-dossier appelé `~exodefines`, dans le dossier `code/__DEFINES` et incluses dans `tgstation.dme`.
Pour les définitions utilisées dans les modules, elles doivent être déclarées dans le module `modular_exostation/_exodefines`.
Pour les définitions utilisées dans un seul fichier, les déclarer en début de fichier, puis `#undef MY_DEFINE` à la fin du fichier, pour éviter toute confusion.

### Cartes

Les cartes (maps) sont en dehors du dossier `modular_exostation`, et peuvent appartenir à l'un de ces trois cas :

- Ce sont des stations et des navettes (shuttles), le code qui charge les cartes nécessite qu'elles soient dans l'arborescence avec les autres stations et navettes; Les fichiers .json et .dmm files doivent donc aller dans le dossier `_maps` comme si c'était des cartes non-personnalisées.
- Ce sont des ruines ou toute autre chose n'appartenant pas aux deux catégories pré-citées : ells sont dans le dossier `_maps/exomaps` pour que l'outil UpdatePaths puisse les trouver et les modifier sans avoir besoin de modifier le script.

- Ce sont des cartes modèles (templates) utilisés par automapper pour rajouter des pièces à des cartes existantes : elles sont dans le dossier `_maps/exomaps/automapper`. Nous ne modifions pas directement les cartes de /tg/. Nous

### Fichiers TGUI

En raison de la façon dont TG gère TGUI, tous les fichiers tgui se trouvent dans le répertoire `/tgui/packages/tgui/interfaces` et ses sous-répertoires ; il n'existe pas de dossier spécifique pour les interfaces utilisateur d'Exostation.

**IMPORTANT ! Lorsque vous créez un nouveau fichier TGUI de toutes pièces, veuillez ajouter ce qui suit tout en haut du fichier (ligne 1) :**

```js
// FICHIER INTERFACE EXODUS - MODULE
```
