/// Station side

/area/station/bitrunning
	name = "Bitrunning"

/area/station/bitrunning/den
	name = "Bitrunning Den"
	desc = "Office of bitrunners, houses their equipment."
	icon_state = "bit_den"

/// VDOM

/area/virtual_domain
	name = "Virtual Domain"
	icon_state = "bit_ruin"
	icon = 'icons/area/areas_station.dmi'
	area_flags = UNIQUE_AREA | NOTELEPORT | ABDUCTOR_PROOF | EVENT_PROTECTED | HIDDEN_AREA
	has_gravity = STANDARD_GRAVITY

/area/virtual_domain/powered
	name = "Virtual Domain Ruins"
	requires_power = FALSE
	static_lighting = FALSE
	base_lighting_alpha = 255

/area/virtual_domain/fullbright
	static_lighting = FALSE
	base_lighting_alpha = 255

/// Safehouse

/area/virtual_domain/safehouse
	name = "Virtual Domain Safehouse"
	area_flags = UNIQUE_AREA | NOTELEPORT | ABDUCTOR_PROOF | EVENT_PROTECTED | VIRTUAL_SAFE_AREA
	icon_state = "bit_safe"
	requires_power = FALSE
	sound_environment = SOUND_ENVIRONMENT_ROOM

/// Custom subtypes

/area/lavaland/surface/outdoors/virtual_domain
	name = "Virtual Domain Lava Ruins"
	icon_state = "bit_ruin"
	area_flags = UNIQUE_AREA | NOTELEPORT | ABDUCTOR_PROOF | EVENT_PROTECTED | HIDDEN_AREA

/area/icemoon/underground/explored/virtual_domain
	name = "Virtual Domain Ice Ruins"
	icon_state = "bit_ice"
	area_flags = UNIQUE_AREA | NOTELEPORT | ABDUCTOR_PROOF | EVENT_PROTECTED | HIDDEN_AREA

/area/ruin/space/has_grav/powered/virtual_domain
	name = "Virtual Domain Space Ruins"
	icon = 'icons/area/areas_station.dmi'
	icon_state = "bit_space"
	area_flags = UNIQUE_AREA | NOTELEPORT | ABDUCTOR_PROOF | EVENT_PROTECTED | HIDDEN_AREA

/area/space/virtual_domain
	name = "Virtual Domain Space"
	icon = 'icons/area/areas_station.dmi'
	icon_state = "bit_space"
	area_flags = UNIQUE_AREA | NOTELEPORT | EVENT_PROTECTED | HIDDEN_AREA | ABDUCTOR_PROOF

///Areas that virtual entities should not be in

/area/virtual_domain/protected_space
	name = "Virtual Domain Safe Zone"
	area_flags =  UNIQUE_AREA | NOTELEPORT | ABDUCTOR_PROOF | EVENT_PROTECTED | VIRTUAL_SAFE_AREA
	icon_state = "bit_safe"

/area/virtual_domain/protected_space/fullbright
	static_lighting = FALSE
	base_lighting_alpha = 255
