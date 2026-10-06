//singulo spawner 3000
/datum/twitch_event/clang
	event_name = "Immovable Rod Everyone"
	event_duration = 1 SECONDS
	event_flags = TWITCH_AFFECTS_ALL | CLEAR_TARGETS_AFTER_EFFECTS
	id_tag = T_EVENT_ROD_EVERYONE
	announce = TRUE //the crew gets to know of their fate

/datum/twitch_event/clang/apply_effects()
	for(var/target in targets) //send a rod at the turf of all targets, not making it target them directly because thats just death
		var/turf/target_turf = get_turf(target)
		if(!target_turf)
			return
		new /obj/effect/immovablerod(spaceDebrisStartLoc(pick(GLOB.cardinals), target_turf.z), target)

