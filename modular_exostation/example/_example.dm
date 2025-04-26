/datum/modpack/example
	/// A string name for the modpack. Used for looking up other modpacks in init.
	name = "Example modpack"
	/// A string desc for the modpack. Can be used for modpack verb list as description.
	desc = "This is an example modpack"
	/// A string with authors of this modpack.
	author = "XXX"

/datum/modpack/example/pre_initialize()
	. = ..()

/datum/modpack/example/initialize()
	. = ..()

/datum/modpack/example/post_initialize()
	. = ..()
