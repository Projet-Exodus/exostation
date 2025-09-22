// Removing a fatphobic smite... Replaces it with one that completely empties them of nutrition.
// Override code\modules\admin\smites\fat.dm
/datum/smite/fat
	name = "Make hungry"

/datum/smite/fat/effect(client/user, mob/living/target)
	. = ..()
	target.set_nutrition(0)

// Renaming fatphobic machine
// Override code\game\machinery\fat_sucker.dm + 2 remplacements non modulaires
/obj/machinery/fat_sucker
	name = "nutritional recycler"
	desc = "Convertit en toute sécurité les nutriments absorbés par le sujet en viande délicieuse."
// Override code\game\objects\items\circuitboards\machines\machine_circuitboards.dm
/obj/item/circuitboard/machine/fat_sucker
	name = "Nutritional Recycler"

// Override code\modules\research\designs\machine_designs.dm
/datum/design/board/fat_sucker
	name = "Nutritional Recycler Board"
	desc = "The circuit board for a nutritional recycler."

// Drinks - Override : code\modules\reagents\chemistry\reagents\drinks\glass_styles\mixed_alcohol.dm - Sera sûrement déplacé plus tard dans les traductions
/datum/glass_style/drinking_glass/fernet_cola
	desc = "Une bouteille de coca à demi sciée remplie de Fernet Cola. Rien de meilleur pour bien digérer !"

// Mood - Override code\datums\mood_events\needs_events.dm - Sera sûrement déplacé plus tard dans les traductions
/datum/mood_event/fat
	description = "<B>J'ai vraiment trop mangé... Mon ventre est balloné et je fais une indigestion.</B>"

// Quirk - Override code\datums\quirks\positive_quirks\voracious.dm - Sera déplacé plus tard dans les traductions
/datum/quirk/voracious
	name = "Voracious"
	desc = "Nothing gets between you and your food. You eat faster and can binge on junk food !"
