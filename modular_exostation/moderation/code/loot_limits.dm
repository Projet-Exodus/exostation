// Override \code\modules\mining\lavaland\mining_loot\megafauna\hierophant.dm
/obj/item/hierophant_club
	var/static/active_hiero_clubs = null

/obj/item/hierophant_club/Initialize(mapload)
	. = ..()
	active_hiero_clubs++
	if(active_hiero_clubs > 3)
		return INITIALIZE_HINT_QDEL

/obj/item/hierophant_club/Destroy(force)
	if(active_hiero_clubs > 3)
		new /obj/item/clothing/accessory/pandora_hope(loc)

	active_hiero_clubs--
	return ..()

// Override code\modules\mining\lavaland\mining_loot\megafauna\ash_drake.dm
/obj/item/lava_staff
	var/static/active_lava_staffs = null

/obj/item/lava_staff/Initialize(mapload)
	. = ..()
	active_lava_staffs++
	if(active_lava_staffs > 2)
		return INITIALIZE_HINT_QDEL

/obj/item/lava_staff/Destroy(force)
	if(active_lava_staffs > 2)
		if(prob(50))
			new /obj/item/crusher_trophy/legionnaire_spine(loc)
		else
			new /obj/item/crusher_trophy/broodmother_tongue(loc)

	active_lava_staffs--
	return ..()

// Override code\game\objects\structures\crates_lockers\crates\abandoned_crates\abandoned_crates_loot.dm (pas fait)

// Override code\game\objects\structures\icemoon\cave_entrance.dm

/obj/effect/collapsing_demonic_portal/drop_loot()
	visible_message(span_warning("Something slips out of [src]!"))
	var/loot = rand(1, 27)
	switch(loot)
		if(1)
			new /obj/item/clothing/neck/cloak/wolf_coat(loc)
			new /obj/item/gun/magic/wand/teleport(loc)
		if(2)
			new /obj/item/clothing/glasses/godeye(loc)
		if(3)
			new /obj/item/reagent_containers/cup/bottle/potion/flight(loc)
		if(4)
			new /obj/item/organ/heart/cursed/wizard(loc)
		if(5)
			new /obj/item/jacobs_ladder(loc)
		if(6)
			new /obj/item/rod_of_asclepius(loc)
		if(7)
			new /obj/item/warp_cube/red(loc)
		if(8)
			new /obj/item/wisp_lantern(loc)
		if(9)
			new /obj/item/immortality_talisman(loc)
		if(10)
			new /obj/item/book/granter/action/spell/summonitem(loc)
		if(11)
			new /obj/item/clothing/neck/necklace/memento_mori(loc)
		if(12)
			new /obj/item/borg/upgrade/modkit/lifesteal(loc)
			new /obj/item/bedsheet/cult(loc)
		if(13)
			new /obj/item/disk/design_disk/modkit_disc/mob_and_turf_aoe(loc)
		if(14)
			new /obj/item/disk/design_disk/modkit_disc/bounty(loc)
		if(15)
			new /obj/item/slimepotion/sentience(loc)
			new /obj/item/ship_in_a_bottle(loc)
			new /obj/item/oar(loc)
		if(16)
			new /obj/item/shared_storage/red(loc)
		if(17)
			new /obj/item/clothing/gloves/fingerless/punch_mitts(loc)
			new /obj/item/clothing/head/cowboy(loc)
		if(18)
			new /obj/item/soulstone/anybody(loc)
		if(19)
			new /obj/item/disk/design_disk/modkit_disc/resonator_blast(loc)
		if(20)
			new /obj/item/disk/design_disk/modkit_disc/rapid_repeater(loc)
		if(21)
			new /obj/item/slimepotion/transference(loc)
		if(22)
			new /obj/item/slime_extract/adamantine(loc)
		if(23)
			new /obj/item/weldingtool/abductor(loc)
		if(24)
			new /obj/item/book_of_babel(loc)
		if(25)
			new /obj/item/guardian_creator/miner(loc)
		if(26)
			new /obj/item/clothing/shoes/winterboots/ice_boots(loc)
		if(27)
			new /obj/item/book/granter/action/spell/sacredflame(loc)
