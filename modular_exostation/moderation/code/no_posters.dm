//Delete these poster if it ever appears and replace it with a random one.
// Override code\game\objects\effects\posters\poster.dm & code\game\objects\effects\posters\contraband.dm
/obj/structure/sign/poster/contraband/got_wood/Initialize(mapload, vol)
	. = ..()
	new /obj/structure/sign/poster/contraband/random(loc)
	return INITIALIZE_HINT_QDEL

/obj/structure/sign/poster/contraband/free_tonto/Initialize(mapload, vol)
	. = ..()
	new /obj/structure/sign/poster/contraband/random(loc)
	return INITIALIZE_HINT_QDEL

//Never spawn these posters randomly either
// Override code\game\objects\effects\posters\poster.dm
/obj/structure/sign/poster/random
	blacklisted_types = list(
		/obj/structure/sign/poster/traitor,
		/obj/structure/sign/poster/abductor,
		/obj/structure/sign/poster/contraband/got_wood,
		/obj/structure/sign/poster/contraband/free_tonto,
		/obj/structure/sign/poster/contraband/lusty_xenomorph,
		/obj/structure/sign/poster/contraband/busty_backdoor_xeno_babes_6,
		/obj/structure/sign/poster/contraband/lizard
	)
// Override code\game\objects\effects\posters\poster.dm & code\game\objects\effects\posters\contraband.dm
/obj/structure/sign/poster/contraband/random
	blacklisted_types = list(
		/obj/structure/sign/poster/contraband/got_wood,
		/obj/structure/sign/poster/contraband/free_tonto,
		/obj/structure/sign/poster/contraband/lusty_xenomorph,
		/obj/structure/sign/poster/contraband/busty_backdoor_xeno_babes_6,
		/obj/structure/sign/poster/contraband/lizard
	)

