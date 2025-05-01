/obj/item/modular_computer/pda/
	var/datum/component/holomap/holo_base = null //holomap component
	var/datum/action/toggle_holomap/useless //Useless thingy meant for to be used for nothing more than deleting the action if it already exists

/obj/item/modular_computer/pda/LateInitialize()
	apply_holomap()

/obj/item/modular_computer/pda/proc/apply_holomap()
	AddComponent(/datum/component/holomap)
