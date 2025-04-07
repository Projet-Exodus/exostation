/datum/keybinding/mob/stop_pulling
	hotkey_keys = list("H", "Delete")
	full_name = "Stop pulling"
	description = ""

/datum/keybinding/mob/swap_hands
	hotkey_keys = list("X")
	full_name = "Swap hands"
	description = ""

/datum/keybinding/mob/activate_inhand
	hotkey_keys = list("Unbound") //Original Z
	name = "activate_inhand"
	full_name = "Activate in-hand"
	description = "Uses whatever item you have inhand"

/datum/keybinding/mob/drop_item
	hotkey_keys = list("A") //Original Q
	name = "drop_item"
	full_name = "Drop Item"
	description = ""
	keybind_signal = COMSIG_KB_MOB_DROPITEM_DOWN

/datum/keybinding/mob/target/head_cycle
	hotkey_keys = list("Numpad8")
	full_name = "Target: Cycle Head"
	description = "Pressing this key targets the head, and continued presses will cycle to the eyes and mouth. This will impact where you hit people, and can be used for surgery."

/datum/keybinding/mob/target/head
	hotkey_keys = list("Unbound")
	full_name = "Target: Head"
	description = "Pressing this key targets the head. This will impact where you hit people, and can be used for surgery."

/datum/keybinding/mob/target/eyes
	hotkey_keys = list("Numpad7")
	name = "target_eyes"
	full_name = "Target: Eyes"
	description = "Pressing this key targets the eyes. This will impact where you hit people, and can be used for surgery."
	keybind_signal = COMSIG_KB_MOB_TARGETEYES_DOWN

/datum/keybinding/mob/target/mouth
	hotkey_keys = list("Numpad9")
	full_name = "Target: Mouth"
	description = "Pressing this key targets the mouth. This will impact where you hit people, and can be used for surgery."

/datum/keybinding/mob/target/r_arm
	hotkey_keys = list("Numpad4")
	full_name = "Target: right arm"
	description = "Pressing this key targets the right arm. This will impact where you hit people, and can be used for surgery."

/datum/keybinding/mob/target/body_chest
	hotkey_keys = list("Numpad5")
	full_name = "Target: Body"
	description = "Pressing this key targets the body. This will impact where you hit people, and can be used for surgery."

/datum/keybinding/mob/target/left_arm
	hotkey_keys = list("Numpad6")
	full_name = "Target: left arm"
	description = "Pressing this key targets the body. This will impact where you hit people, and can be used for surgery."

/datum/keybinding/mob/target/right_leg
	hotkey_keys = list("Numpad1")
	full_name = "Target: Right leg"
	description = "Pressing this key targets the right leg. This will impact where you hit people, and can be used for surgery."

/datum/keybinding/mob/target/body_groin
	hotkey_keys = list("Numpad2")
	full_name = "Target: Groin"
	description = "Pressing this key targets the groin. This will impact where you hit people, and can be used for surgery."

/datum/keybinding/mob/target/left_leg
	hotkey_keys = list("Numpad3")
	full_name = "Target: left leg"
	description = "Pressing this key targets the left leg. This will impact where you hit people, and can be used for surgery."

/datum/keybinding/mob/prevent_movement
	hotkey_keys = list("Alt")
	full_name = "Block movement"
	description = "Prevents you from moving"

/datum/keybinding/living/view_pet_data
	hotkey_keys = list("Shift")
	full_name = "View Pet Commands"
	description = "Hold down to see all the commands you can give your pets!"
