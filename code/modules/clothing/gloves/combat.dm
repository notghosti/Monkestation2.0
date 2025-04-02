/obj/item/clothing/gloves/combat
	name = "combat gloves"
	desc = "These tactical gloves are fireproof and electrically insulated."
	icon_state = "black"
	greyscale_colors = "#2f2e31"
	siemens_coefficient = 0
	strip_delay = 80

	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT

	max_heat_protection_temperature = GLOVES_MAX_TEMP_PROTECT
	resistance_flags = NONE
	armor_type = /datum/armor/gloves_combat

/datum/armor/gloves_combat
	bio = 90
	fire = 80
	acid = 50

/obj/item/clothing/gloves/combat/wizard
	name = "enchanted gloves"
	desc = "These gloves have been enchanted with a spell that makes them electrically insulated and fireproof."
	icon_state = "wizard"
	greyscale_colors = null
	inhand_icon_state = null

/obj/item/clothing/gloves/tackler/combat/insulated/admiral // Reskin for Abraxis's Admiral set
	icon_state = "admiral"
	worn_icon = 'monkestation/icons/mob/clothing/gloves.dmi'
	icon = 'monkestation/icons/obj/clothing/gloves.dmi'
	alternate_worn_layer = ABOVE_SUIT_LAYER

/obj/item/clothing/gloves/admiral // Loadout version of the Abraxis Centcom Admiral gloves
	name = "black gloves"
	icon_state = "admiral"
	worn_icon = 'monkestation/icons/mob/clothing/gloves.dmi'
	icon = 'monkestation/icons/obj/clothing/gloves.dmi'
	alternate_worn_layer = ABOVE_SUIT_LAYER
