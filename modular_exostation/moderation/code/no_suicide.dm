// Disables the "suicide" client verb entirely.
/mob/living/can_suicide()
	to_chat(src, span_warning("Le verbe suicide est désactivé sur Exostation."))
	return FALSE
