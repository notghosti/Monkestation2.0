/**Dizziness
 * Increases stealth
 * Lowers resistance
 * Decreases stage speed considerably
 * Slightly reduces transmissibility
 * Intense Level
 * Bonus: Shakes the affected mob's screen for short periods.
 */

/datum/symptom/dizzy // Not the egg

	name = "Dizziness"
	desc = "The virus causes inflammation of the vestibular system, leading to bouts of dizziness."
	illness = "Motion Sickness"
	level = 4
	severity = 2
	base_message_chance = 50
	max_multiplier = 3


/datum/symptom/dizzy/Start(datum/disease/acute/A)
	. = ..()
	if(!.)
		return

/datum/symptom/dizzy/Activate(datum/disease/acute/A)
	. = ..()
	if(!.)
		return
	var/mob/living/M = A.affected_mob
	switch(multiplier)
		if(1)
			if(prob(base_message_chance) && !suppress_warning)
				to_chat(M, span_warning("[pick("You feel dizzy.", "Your head spins.")]"))
		else
			to_chat(M, span_userdanger("A wave of dizziness washes over you!"))
			M.adjust_dizzy_up_to(1 MINUTES, 140 SECONDS)
			if(multiplier > 2)
				M.set_drugginess(80 SECONDS)
