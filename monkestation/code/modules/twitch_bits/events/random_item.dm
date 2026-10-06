/datum/twitch_event/give_smsword
	event_name = "Give Everyone Random Item"
	event_duration = 1 SECONDS
	event_flags = TWITCH_AFFECTS_ALL
	id_tag = T_EVENT_GIVE_EVERYONE_ITEM

/datum/twitch_event/give_smsword/apply_effects()
	for(var/target in targets)
		var/mob/living/debug_uplink_reciever = target
		var/obj/item/gamer_item = pick(subtypesof(/obj/item))
		gamer_item = new gamer_item()
		debug_uplink_reciever.put_in_hands(gamer_item)
