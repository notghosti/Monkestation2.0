/datum/ai_project/nightvision
	name = "Nightvision Camera Upgrade"
	description = "By referencing previous imagary of the area and adjusting contrast of camera footage, we can approximate imagery in otherwise pitch-black areas."
	research_cost = 3
	ram_required = 2000
	category = AI_PROJECT_SURVEILLANCE

/datum/ai_project/nightvision/run_project(force_run = FALSE)
	. = ..()
	if(!.)
		return .
	if(ai.lighting_cutoff >= LIGHTING_CUTOFF_REAL_LOW) // If the ai has equal better vision than this for some ungodly reason then dont run it.
		to_chat(ai, span_notice("Camera network nightvision imagery already running more efficantly than project; preventing redudant processing."))
		return .
	ai.lighting_cutoff = LIGHTING_CUTOFF_REAL_LOW
	ai.update_sight()


/datum/ai_project/nightvision/stop()
	if(!(ai.lighting_cutoff > LIGHTING_CUTOFF_REAL_LOW))
		ai.lighting_cutoff = LIGHTING_CUTOFF_VISIBLE
		ai.update_sight()
	return ..()

