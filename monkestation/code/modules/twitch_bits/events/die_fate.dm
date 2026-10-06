/datum/twitch_event/free_wiz
	event_name = "Change Everyone's Fate"
	event_duration = 1 SECONDS
	event_flags = TWITCH_AFFECTS_ALL
	id_tag = T_EVENT_EVERYONE_DIE_FATE
	token_cost = 5002 // :)
	///do we force rolling the die or not
	var/forced_roll = FALSE

/datum/twitch_event/free_wiz/apply_effects()
	for(var/target in targets)
		var/mob/living/future_wiz = target
		var/obj/item/dice/d20/fate/one_use/the_die = new(get_turf(future_wiz))
		future_wiz.put_in_hands(the_die)
		if(forced_roll)
			to_chat(future_wiz, span_userdanger("Something apears in your hand and- oh no you fumbled it. That can't be good."))
			addtimer(CALLBACK(the_die, TYPE_PROC_REF(/obj/item/dice, diceroll), future_wiz), 0.5 SECONDS)
