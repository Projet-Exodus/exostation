/obj/item/modular_computer/pda/
	var/datum/component/holomap/holo_base = null //holomap component
	var/datum/action/toggle_holomap/useless //Useless thingy meant for to be used for nothing more than deleting the action if it already exists

/obj/item/modular_computer/pda/LateInitialize()
	apply_holomap()

/obj/item/modular_computer/pda/proc/apply_holomap()
	if(holo_base)
		holo_base.RemoveComponent()
		QDEL_NULL(holo_base)
	AddComponent(/datum/component/holomap)

/obj/item/modular_computer/pda/heads/ce/apply_holomap()
	if(holo_base)
		holo_base.RemoveComponent()
		QDEL_NULL(holo_base)
	AddComponent(/datum/component/holomap/engineering)

/obj/item/modular_computer/pda/atmos/apply_holomap()
	if(holo_base)
		holo_base.RemoveComponent()
		QDEL_NULL(holo_base)
	AddComponent(/datum/component/holomap/engineering)

/obj/item/modular_computer/pda/engineering/apply_holomap()
	if(holo_base)
		holo_base.RemoveComponent()
		QDEL_NULL(holo_base)
	AddComponent(/datum/component/holomap/engineering)

/obj/item/modular_computer/pda/silicon/apply_holomap()
	if(holo_base)
		holo_base.RemoveComponent()
		QDEL_NULL(holo_base)
	AddComponent(/datum/component/holomap/engineering)

/obj/item/modular_computer/pda/Destroy()
. = ..()
	remove_holomap()

/obj/item/modular_computer/pda/proc/remove_holomap()
	RemoveComponentSource(source, /datum/component/holomap)
	RemoveComponentSource(source, /datum/component/holomap/engineering)
