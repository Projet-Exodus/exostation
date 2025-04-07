/datum/keybinding/living/resist
	hotkey_keys = list("R") //Original B
	name = "resist"
	full_name = "Resist"
	description = "Break free of your current state. Handcuffed? on fire? Resist!"
	keybind_signal = COMSIG_KB_LIVING_RESIST_DOWN

/datum/keybinding/living/look_up
	hotkey_keys = list(",") //Original L
	full_name = "Look Up"
	description = "Look up at the next z-level.  Only works if directly below open space."

/datum/keybinding/living/look_down
	hotkey_keys = list(";") //Original ;
	full_name = "Look Down"
	description = "Look down at the previous z-level.  Only works if directly above open space."

/datum/keybinding/living/rest
	hotkey_keys = list("B") //Original U
	full_name = "Rest"
	description = "Lay down, or get up."

/datum/keybinding/living/toggle_combat_mode
	hotkey_keys = list("F")
	full_name = "Toggle Combat Mode"
	description = "Toggles combat mode. Like Help/Harm but cooler."

/datum/keybinding/living/enable_combat_mode
	hotkey_keys = list("4")
	full_name = "Enable Combat Mode"
	description = "Enable combat mode."

/datum/keybinding/living/disable_combat_mode
	hotkey_keys = list("1")
	full_name = "Disable Combat Mode"
	description = "Disable combat mode."

/datum/keybinding/living/toggle_move_intent
	hotkey_keys = list("Unbound") //Original C
	full_name = "Hold to toggle move intent"
	description = "Held down to cycle to the other move intent, release to cycle back"

/datum/keybinding/living/toggle_move_intent_alternative
	hotkey_keys = list("Unbound")
	full_name = "press to cycle move intent"
	description = "Pressing this cycle to the opposite move intent, does not cycle back"
