/datum/keybinding/human/quick_equip
	hotkey_keys = list("E")
	full_name = "Quick equip"
	description = "Quickly puts an item in the best slot available"

/datum/keybinding/human/quick_equip_belt
	hotkey_keys = list("ShiftE")
	full_name = "Quick equip belt"
	description = "Put held thing in belt or take out most recent thing from belt"

/datum/keybinding/human/quick_equip_belt/quick_equip_bag
	hotkey_keys = list("ShiftB")
	full_name = "Quick equip bag"
	description = "Put held thing in backpack or take out most recent thing from backpack"

/datum/keybinding/human/quick_equip_belt/quick_equip_suit_storage
	hotkey_keys = list("ShiftQ")
	full_name = "Quick equip suit storage slot"
	description = "Put held thing in suit storage slot item or take out most recent thing from suit storage slot item"

/datum/keybinding/human/quick_equip_belt/quick_equip_lpocket
	hotkey_keys = list("Ctrl1")
	full_name = "Quick equip left pocket"
	description = "Put in or take out an item in left pocket"
	slot_item_name = "left pocket"

/datum/keybinding/human/quick_equip_belt/quick_equip_rpocket
	hotkey_keys = list("Ctrl2")
	full_name = "Quick equip right pocket"
	description = "Put in or take out an item in right pocket"
