/datum/tgui_say/alter_entry(payload)
	/// No OOC leaks
	if(payload["channel"] == WHIS_CHANNEL)
		return pick(hurt_phrases)
	. = ..()

/datum/tgui_say/delegate_speech(entry, channel)
	switch(channel)
		if(WHIS_CHANNEL)
			client.mob.whisper_verb(entry)
			return TRUE
	. = ..()
