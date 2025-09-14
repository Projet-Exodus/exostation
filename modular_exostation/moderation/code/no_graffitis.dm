//Removing the questionable stuff modularly : code\game\objects\items\crayons.dm

/obj/item/toy/crayon/Initialize(mapload)
	. = ..()

	graffiti -= list(
		"prolizard",
		"antilizard",
	)

	graffiti_large_h -= list(
		"furrypride",
		"yiffhell",
	)
