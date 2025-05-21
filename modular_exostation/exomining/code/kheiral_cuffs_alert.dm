/obj/item/kheiral_cuffs/
/// Used to allow the cuffs to send alerts over the radio
	var/obj/item/radio/headset/radio
	/// List of radio channels to send the alert out on when the wearer dies off the station Z-level
	var/list/alert_channels = list(RADIO_CHANNEL_MEDICAL, RADIO_CHANNEL_SUPPLY)

/obj/item/kheiral_cuffs/Initialize(mapload)
	. = ..()
	radio = new /obj/item/radio/headset/silicon/ai(src)

/obj/item/kheiral_cuffs/connect_kheiral_network(mob/living/user)
	..()
	RegisterSignal(user, COMSIG_LIVING_DEATH, PROC_REF(send_death_alert))

/obj/item/kheiral_cuffs/remove_kheiral_network(mob/user)
	..()
	UnregisterSignal(user, COMSIG_LIVING_DEATH)

/// Registered to the COMSIG_LIVING_DEATH signal. Sends out an alert over alert_channels when the wearer dies.
/obj/item/kheiral_cuffs/proc/send_death_alert(mob/living/wearer, gibbed)
	var/area/location = get_area(wearer)
	for(var/radio_channel as anything in alert_channels)
		radio.talk_into(src, "Alerte minage ! [wearer ? wearer : "Quelqu'un"] a [gibbed ? "eu le corps détruit" : "été tué"] à [location ? location : "un emplacement inconnu"] !", radio_channel)
