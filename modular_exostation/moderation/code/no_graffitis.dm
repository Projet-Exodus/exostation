//Removing the questionable stuff modularly : code\game\objects\items\crayons.dm

/obj/item/toy/crayon/Initialize(mapload)
	. = ..()

	graffiti -= list(
		"amyjon",
		"cyka",
		"matt",
		"uboa"
	)

	graffiti_large_h -= list(
		"furrypride",
		"yiffhell",
	)
