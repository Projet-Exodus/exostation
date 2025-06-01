/obj/structure/ore_vent
	var/drone_vent_name = null
	var/miner_count = null

/**
 * Prise en compte du nombre de mineurs, rééquilibrage de la défense d'un node
 */
/obj/structure/ore_vent/start_wave_defense()
	update_miner_count()
	AddComponent(\
		/datum/component/spawner, \
		spawn_types = defending_mobs, \
		spawn_time = (10 SECONDS + ((10 - miner_count) SECONDS * (boulder_size/5))), \
		max_spawned = (4 + miner_count + (boulder_size/5)), \
		max_spawn_per_attempt = (boulder_size/5), \
		spawn_text = "emerges to assault", \
		spawn_distance = 4, \
		spawn_distance_exclude = 3, \
	)
	COOLDOWN_START(src, wave_cooldown, wave_timer)
	addtimer(CALLBACK(src, PROC_REF(handle_wave_conclusion)), wave_timer)
	icon_state = icon_state_tapped
	update_appearance(UPDATE_ICON_STATE)

/obj/structure/ore_vent/proc/update_miner_count()
	for(var/mob/living/miner in range(20, src))
		miner_count++

/**
 * Alerte des drones sur les ore vents
 */
/mob/living/basic/node_drone/arrive(obj/structure/ore_vent/parent_vent)
	. = ..()
	if(isnull(attached_vent.drone_vent_name))
		generate_vent_name(parent_vent)

	aas_config_announce(/datum/aas_config_entry/node_start_excavation, list("VENT_NAME" = attached_vent.drone_vent_name), null, list(RADIO_CHANNEL_SUPPLY))

/mob/living/basic/node_drone/pre_escape(success)
	if(success)
		if(isnull(attached_vent.drone_vent_name))
			generate_vent_name(attached_vent)

		aas_config_announce(/datum/aas_config_entry/node_end_excavation, list("VENT_NAME" = attached_vent.drone_vent_name), null, list(RADIO_CHANNEL_SUPPLY))
	. = ..()

/mob/living/basic/node_drone/proc/generate_vent_name(obj/structure/ore_vent/vent)
	var/vent_name = ""
	for(var/datum/material/resource as anything in vent.mineral_breakdown)
		var/letters = html_decode(initial(resource.name))
		vent_name = "[vent_name][letters[1]]"

	vent.drone_vent_name = "[vent.boulder_size]-[uppertext(vent_name)]"

/datum/aas_config_entry/node_start_excavation
	name = "Cargo Notification: Node drone starting operation"
	general_tooltip = "Announces when a miner starts to excavate an ore vent."
	announcement_lines_map = list(
		"Message" = "Node drone network report : Ore vent %VENT_NAME : Démarrage de l'excavation."
	)
	vars_and_tooltips_map = list(
		"VENT_NAME" = "Will be replaced with the vent's ore information and size made up into a name",
	)

/datum/aas_config_entry/node_end_excavation
	name = "Cargo Notification: Node drone ending operation"
	general_tooltip = "Announces when a miner ends an ore vent excavation, be it a success or failure."
	announcement_lines_map = list(
		"Message" = "Node drone network report : Ore vent %VENT_NAME : Démarrage de l'excavation."
	)
	vars_and_tooltips_map = list(
		"VENT_NAME" = "Will be replaced with the vent's ore information and size made up into a name",
	)
