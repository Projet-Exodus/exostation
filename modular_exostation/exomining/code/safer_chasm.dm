// Tomber dans un gouffre blesse mais permet de commencer à grimper en dehors
/datum/component/chasm/proc/on_living_fallen(mob/living/fallen_mob)
	fallen_mob.apply_damage(20)
	var/mob/living/carbon/carbon_mob = fallen_mob
	if (istype(carbon_mob))
		var/obj/item/bodypart/wound_part = pick(carbon_mob.bodyparts)
		if (IS_ORGANIC_LIMB(wound_part))
			wound_part.force_wound_upwards(/datum/wound/blunt/bone/moderate)
	try_climb_out(fallen_mob)

// Start trying to climb out of this goddamn chasm
/datum/component/chasm/proc/try_climb_out(mob/living/fallen_mob)
	if (fallen_mob.stat == DEAD)
		fallen_mob.investigate_log("a fait une chute mortelle dans un gouffre.", INVESTIGATE_DEATHS)
		return
	to_chat(fallen_mob, span_warning("Vous commencez à vous extraire du gouffre !"))
	if (!do_after(fallen_mob, 10 SECONDS, get_turf(fallen_mob),
		IGNORE_HELD_ITEM | IGNORE_INCAPACITATED | IGNORE_SLOWDOWNS, extra_checks = CALLBACK(src, PROC_REF(is_alive), fallen_mob)))
		try_climb_out(fallen_mob) // If you're not dead you're not giving in
		return
	storage.on_revive(fallen_mob) // This seems silly but it does what we want it to do

// Returns false if you died
/datum/component/chasm/proc/is_alive(mob/living/fallen_mob)
	return fallen_mob.stat != DEAD

// Override to climb calmly out of a chasm instead of hurling yourself in a random direction
/obj/effect/abstract/chasm_storage/on_revive(mob/living/escapee)
	SIGNAL_HANDLER
	var/turf/turf = get_turf(src)

	if(!turf.GetComponent(/datum/component/chasm))
		return ..() // Fall back to break through the floor by flinging

	var/turf/escape_turf = get_nearest_safe_turf(turf)
	if (!escape_turf)
		return ..() // Fall back to flinging

	turf.visible_message(span_boldwarning("Après une longue escalade, [escapee] émerge du gouffre !"))
	escapee.forceMove(escape_turf)
	escapee.Paralyze(5 SECONDS, TRUE)
	UnregisterSignal(escapee, COMSIG_LIVING_REVIVE)

/obj/effect/abstract/chasm_storage/proc/get_nearest_safe_turf(atom/chasm)
	var/list/nearby_open_turfs = list()
	for (var/turf/open/sanctuary in orange(3, chasm))
		if (sanctuary.is_blocked_turf(exclude_mobs = FALSE) || ischasm(sanctuary) || islava(sanctuary))
			continue
		nearby_open_turfs += sanctuary

	if (!length(nearby_open_turfs))
		return null
	return get_closest_atom(/turf/, nearby_open_turfs, chasm)
