/*
* Parrot commands : Skyrat/Nova port
*/

/mob/living/basic/parrot
	/// Whether the parrot is on a human's shoulder or not
	var/buckled_to_human

/mob/living/basic/parrot/proc/check_command(message, speaker)
	return FALSE // Simply return false for non-Poly parrots

/mob/living/basic/parrot/poly/check_command(message, speaker)
	var/mob/living/carbon/human/human_target = speaker
	if(!istype(human_target))
		return FALSE
	if(!(human_target.mind?.assigned_role.title == JOB_CHIEF_ENGINEER))
		return FALSE
	if(!(findtext(message, "poly")))
		return FALSE
	if (findtext(message, "perch") || findtext(message, "up") || findtext(message, "monte") || findtext(message, "viens"))
		command_perch(speaker)
		return TRUE
	else if(findtext(message, "off") || findtext(message, "down") || findtext(message, "descend") || findtext(message, "pars"))
		command_hop_off(speaker)
		return TRUE
	else
		return FALSE

/mob/living/basic/parrot/toggle_perched(perched)
	. = ..()
	if(!perched)
		buckled_to_human = FALSE

/mob/living/basic/parrot/poly/proc/command_perch(mob/living/carbon/human/human_target)
	if(!buckled)
		buckled_to_human = FALSE
	if(LAZYLEN(human_target.buckled_mobs) >= human_target.max_buckled_mobs)
		return
	if(buckled_to_human)
		manual_emote("regarde [human_target] avec un air confus, en piaillant doucement.")
		return
	if(get_dist(src, human_target) > 1 || buckled) // Only adjacent
		manual_emote("incline la tête vers [human_target], avant de crier bruyamment et de rester sur place.")
		return
	manual_emote("vient se percher docilement sur l'épaule de [human_target], battant des ailes un moment avant de se poser pour de bon.")
	if(start_perching(human_target))
		buckled_to_human = TRUE

/mob/living/basic/parrot/poly/proc/command_hop_off(mob/living/carbon/human/human_target)
	if(!buckled)
		buckled_to_human = FALSE
	if(!buckled_to_human || !buckled)
		manual_emote("regarde [human_target] avec un air confus, en piaillant doucment.")
		return

	if(buckled)
		to_chat(src, span_notice("YoVous n'êtes plus perché sur [human_target]."))
		buckled.unbuckle_mob(src, TRUE)
		manual_emote("crie et s'envole de [human_target], volant au loin.")
