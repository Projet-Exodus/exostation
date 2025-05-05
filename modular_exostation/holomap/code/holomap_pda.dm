/obj/item/modular_computer/pda/LateInitialize()
	apply_holomap()

/obj/item/modular_computer/pda/proc/apply_holomap()
	AddComponent(/datum/component/holomap)

/obj/item/modular_computer/pda/heads/ce/apply_holomap()
	AddComponent(/datum/component/holomap/engineering)

/obj/item/modular_computer/pda/atmos/apply_holomap()
	AddComponent(/datum/component/holomap/engineering)

/obj/item/modular_computer/pda/engineering/apply_holomap()
	AddComponent(/datum/component/holomap/engineering)

/obj/item/modular_computer/pda/silicon/apply_holomap()
	AddComponent(/datum/component/holomap/engineering)

/obj/item/modular_computer/pda/proc/remove_holomap()
	RemoveComponentSource(/datum/component/holomap)

/obj/item/modular_computer/pda/heads/ce/remove_holomap()
	RemoveComponentSource(/datum/component/holomap/engineering)

/obj/item/modular_computer/pda/atmos/remove_holomap()
	RemoveComponentSource(/datum/component/holomap/engineering)

/obj/item/modular_computer/pda/engineering/remove_holomap()
	RemoveComponentSource(/datum/component/holomap/engineering)

/obj/item/modular_computer/pda/silicon/remove_holomap()
	RemoveComponentSource(/datum/component/holomap/engineering)
