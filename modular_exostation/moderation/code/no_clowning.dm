// Non constructible pour éviter le spam - Override code\datums\components\crafting\robot.dm
/datum/crafting_recipe/honkbot
	non_craftable = TRUE

// Override \code\modules\clothing\shoes\bananashoes.dm : devrait laisser la version des clown operatives en place
/obj/item/clothing/shoes/clown_shoes/banana_shoes
	var/static/active_banana_shoes = 1

/obj/item/clothing/shoes/clown_shoes/banana_shoes/Initialize(mapload)
	. = ..()
	if(!is_type_in_list(src, list(/obj/item/clothing/shoes/clown_shoes/combat)))
		active_banana_shoes++
		if(active_banana_shoes > 1)
			return INITIALIZE_HINT_QDEL

/obj/item/clothing/shoes/clown_shoes/banana_shoes/Destroy(force)
	if(active_banana_shoes > 1)
		new /obj/item/clothing/shoes/clown_shoes(loc)
	active_banana_shoes--
	return ..()

// Overrides code\modules\projectiles\guns\magic\staff.dm
/obj/item/gun/magic/staff/honk
	var/static/active_staff_honk = 1

/obj/item/gun/magic/staff/honk/Initialize(mapload)
	. = ..()
	active_staff_honk++
	if(active_staff_honk > 1)
		return INITIALIZE_HINT_QDEL

/obj/item/gun/magic/staff/honk/Destroy(force)
	if(active_staff_honk > 1)
		new	/obj/item/gun/magic/staff/babel(loc)
	active_staff_honk--
	return ..()

// Ne devraient pas apparaître en jeu mais on ne sait jamais
// Override code\game\objects\items\grenades\spawnergrenade.dm
/obj/item/grenade/spawnergrenade/clown/Initialize(mapload)
	. = ..()
	spawner_type -= list(/mob/living/basic/clown/fleshclown, /mob/living/basic/clown/clownhulk, /mob/living/basic/clown/longface, /mob/living/basic/clown/clownhulk/chlown, /mob/living/basic/clown/clownhulk/honkmunculus, /mob/living/basic/clown/mutant/glutton)

/obj/item/grenade/spawnergrenade/clown_broken
	var/static/active_grenade_clown_broken = 1

/obj/item/grenade/spawnergrenade/clown_broken/Initialize(mapload)
	. = ..()
	active_grenade_clown_broken++
	if(active_grenade_clown_broken > 1)
		return INITIALIZE_HINT_QDEL

/obj/item/grenade/spawnergrenade/clown_broken/Destroy(force)
	if(active_grenade_clown_broken > 1)
		new	/obj/item/grenade/spawnergrenade/clown(loc)
	active_grenade_clown_broken--
	return ..()

// Override code\game\objects\structures\spawner.dm
/obj/structure/spawner/clown/Initialize(mapload)
	. = ..()
	mob_types -= list(
		/mob/living/basic/clown/clownhulk,
		/mob/living/basic/clown/clownhulk/chlown,
		/mob/living/basic/clown/clownhulk/honkmunculus,
		/mob/living/basic/clown/fleshclown,
		/mob/living/basic/clown/mutant/glutton,
		/mob/living/basic/clown/longface,
	)
// Override code\modules\antagonists\wizard\equipment\artefact.dm
/obj/item/veilrender/honkrender/honkhulkrender
	var/static/active_honkhulkrender = 1

/obj/item/veilrender/honkrender/honkhulkrender/Initialize(mapload)
	. = ..()
	active_honkhulkrender++
	if(active_honkhulkrender > 1)
		return INITIALIZE_HINT_QDEL

/obj/item/veilrender/honkrender/honkhulkrender/Destroy(force)
	if(active_honkhulkrender > 1)
		new	/obj/item/veilrender/honkrender(loc)
	active_honkhulkrender--
	return ..()
