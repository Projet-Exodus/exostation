/datum/modpack/exemple
	/// A string name for the modpack. Used for looking up other modpacks in init.
	name = "Exemple modpack"
	/// A string desc for the modpack. Can be used for modpack verb list as description.
	desc = "Ce modpack est utilisé pour : exemple"
	/// A string with authors of this modpack.
	author = "XXX"

/datum/modpack/exemple/pre_initialize()
	. = ..()

/datum/modpack/exemple/initialize()
	. = ..()

/datum/modpack/exemple/post_initialize()
	. = ..()
