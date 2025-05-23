GLOBAL_VAR_INIT(looc_allowed, TRUE)

/datum/tgui_say/alter_entry(payload)
	/// No OOC leaks
	if(payload["channel"] == LOOC_CHANNEL)
		return pick(hurt_phrases)
	. = ..()

/datum/tgui_say/delegate_speech(entry, channel)
	if(channel == LOOC_CHANNEL)
		client.looc(entry)
		return TRUE
	. = ..()

#define LOOC_RANGE 7

/client/verb/looc(msg as text)
	set name = "LOOC"
	set desc = "Local OOC, vu seulement par les personnes que vous voyez."
	set category = "OOC"

	looc_message(msg)

/client/verb/looc_wallpierce(msg as text)
	set name = "LOOC (Perce-mur)"
	set desc = "Local OOC, vu par quiconque à 7 carreaux de vous."
	set category = "OOC"

	looc_message(msg, TRUE)

/client/proc/looc_message(msg, wall_pierce)
	if(GLOB.say_disabled)
		to_chat(usr, span_danger("Le LOOC a été désactivé par les admins."))
		return

	if(!mob)
		return

	msg = copytext_char(sanitize(msg), 1, MAX_MESSAGE_LEN)
	if(!msg)
		return

	if(!holder)
		if(!GLOB.looc_allowed)
			to_chat(src, span_danger("LOOC is globally muted."))
			return
		if(handle_spam_prevention(msg, MUTE_OOC))
			return
		if(findtext(msg, "byond://"))
			to_chat(src, span_boldannounce("<B>La publicité pour les autres serveurs n'est pas autorisé.</B>"))
			log_admin("[key_name(src)] has attempted to advertise in LOOC: [msg]")
			return
		if(prefs.muted & MUTE_LOOC)
			to_chat(src, span_danger("You cannot use LOOC (muted)."))
			return
		if(mob.stat == DEAD)
			to_chat(src, span_danger("You cannot use LOOC while dead."))
			return
		if(istype(mob, /mob/dead))
			to_chat(src, span_danger("You cannot use LOOC while ghosting."))
			return

	msg = emoji_parse(msg)

	mob.log_talk(msg,LOG_OOC, tag="LOOC")
	var/list/heard
	if(wall_pierce)
		heard = get_hearers_in_range(LOOC_RANGE, mob.get_top_level_mob())
	else
		heard = get_hearers_in_view(LOOC_RANGE, mob.get_top_level_mob())

	//so the ai can post looc text
	if(istype(mob, /mob/living/silicon/ai))
		var/mob/living/silicon/ai/ai = mob
		if(wall_pierce)
			heard = get_hearers_in_range(LOOC_RANGE, ai.eyeobj)
		else
			heard = get_hearers_in_view(LOOC_RANGE, ai.eyeobj)
	//so the ai can see looc text
	for(var/mob/living/silicon/ai/ai as anything in GLOB.ai_list)
		if(ai.client && !(ai in heard) && (ai.eyeobj in heard))
			heard += ai

	var/list/admin_seen = list()
	for(var/mob/hearing in heard)
		if(!hearing.client)
			continue

		if(hearing.client.prefs.read_preference(/datum/preference/toggle/enable_runechat) && isliving(mob))
			hearing.create_chat_message(speaker = mob, raw_message = msg, spans = list("looc"))

		var/client/hearing_client = hearing.client
		if (hearing_client.holder)
			admin_seen[hearing_client] = TRUE
			continue //they are handled after that

		if (isobserver(hearing))
			continue //Also handled later.

		to_chat(hearing_client, span_looc(span_prefix("LOOC[wall_pierce ? " (WALL PIERCE)" : ""]:</span> <EM>[mob.name]:</EM> <span class='message'>[msg]")))

	for(var/cli in GLOB.admins)
		var/client/cli_client = cli
		if (admin_seen[cli_client])
			to_chat(cli_client, span_looc("[ADMIN_FLW(usr)] <span class='prefix'>LOOC[wall_pierce ? " (WALL PIERCE)" : ""]:</span> <EM>[key]/[mob.name]:</EM> <span class='message'>[msg]</span>"))
		else if (cli_client.prefs.read_preference(/datum/preference/toggle/see_looc))
			to_chat(cli_client, span_looc("[ADMIN_FLW(usr)] <span class='prefix'>(R)LOOC[wall_pierce ? " (WALL PIERCE)" : ""]:</span> <EM>[key]/[mob.name]:</EM> <span class='message'>[msg]</span>"))

#undef LOOC_RANGE

/mob/proc/get_top_level_mob()
	if(ismob(loc) && (loc != src))
		var/mob/M = loc
		return M.get_top_level_mob()
	return src
