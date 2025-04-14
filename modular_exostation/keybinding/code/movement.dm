/datum/keybinding/movement
	category = CATEGORY_MOVEMENT
	weight = WEIGHT_HIGHEST

/datum/keybinding/movement/north
	hotkey_keys = list("Z", "North") // Original W
	full_name = "Aller au Nord"
	description = "Déplace votre personnage vers le Nord (devant)"

/datum/keybinding/movement/south
	hotkey_keys = list("S", "South")
	full_name = "Aller au Sud"
	description = "Déplace votre personnage vers le Sud (derrière)"

/datum/keybinding/movement/west
	hotkey_keys = list("Q", "West") // Original A
	full_name = "Aller à l'Ouest"
	description = "Déplace votre personnage vers l'Ouest (à gauche)"

/datum/keybinding/movement/east
	hotkey_keys = list("D", "East")
	full_name = "Aller à l'Est"
	description = "Déplace votre personnage vers l'Est (à droite)"

/datum/keybinding/movement/zlevel_upwards
	hotkey_keys = list("Northeast") // PGUP
	full_name = "Aller en haut"
	description = "Déplace votre personnage vers l'étage supérieur si possible"

/datum/keybinding/movement/zlevel_downwards
	hotkey_keys = list("Southeast") // PGDOWN
	full_name = "Aller en bas"
	description = "Déplace votre personnage vers l'étage inférieur si possible"
