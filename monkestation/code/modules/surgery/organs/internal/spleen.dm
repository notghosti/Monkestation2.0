#define SPLEEN_DEFAULT_BLOOD_REGEN //the rate at which blood regen is modified
#undef SPLEEN_DEFAULT_BLOOD_REGEN

/obj/item/organ/internal/spleen
	name = "spleen"
	icon_state = "spleen"
	visual = FALSE
	w_class = WEIGHT_CLASS_SMALL
	zone = BODY_ZONE_CHEST
	slot = ORGAN_SLOT_SPLEEN
	desc = "What the hell even is this"

	maxHealth = STANDARD_ORGAN_THRESHOLD
	healing_factor = STANDARD_ORGAN_HEALING
	decay_factor = STANDARD_ORGAN_DECAY // smack in the middle of decay times

	food_reagents = list(/datum/reagent/consumable/nutriment = 2, /datum/reagent/iron = 2, /datum/reagent/blood = 10)
	grind_results = list(/datum/reagent/consumable/nutriment/peptides = 4)

	var/operated = FALSE //whether the spleens been repaired with surgery and can be fixed again or not
	var/internal_blood_buffer_max = 24 //a buffer that hold blood unside the spleen, when you get low on blood it releases this and takes a while to regenerate it fully
	var/stored_blood = 0 //current blood in your spleen buffer

/obj/item/organ/internal/spleen/Initialize(mapload)
	. = ..()


/// Registers HANDLE_SPLEEN_MULT_BLOODGEN to owner
/obj/item/organ/internal/spleen/on_insert(mob/living/carbon/organ_owner, special)
	. = ..()
	RegisterSignal(organ_owner, HANDLE_SPLEEN_MULT_BLOODGEN, PROC_REF(blood_generation))
	RegisterSignal(organ_owner, HANDLE_SPLEEN_EMERGENCY, PROC_REF(emergency_release))

/// Unregisters HANDLE_SPLEEN_MULT_BLOODGEN from owner
/obj/item/organ/internal/spleen/on_remove(mob/living/carbon/organ_owner, special)
	. = ..()
	UnregisterSignal(organ_owner, HANDLE_SPLEEN_MULT_BLOODGEN)
	UnregisterSignal(organ_owner, HANDLE_SPLEEN_EMERGENCY, PROC_REF(emergency_release))
/**
 * Used for multiplying or acting on blood generation amounts in blood.dm
 * overide in new spleen organs for different effects
 **/
/obj/item/organ/internal/spleen/proc/blood_generation()
	SIGNAL_HANDLER
	var/efficiency = (damage / maxHealth) + 0.10 //regular spleen gives you 10% boost to blood gen yay
	return efficiency

/obj/item/organ/internal/spleen/proc/emergency_release()
	SIGNAL_HANDLER
	if(stored_blood < (internal_blood_buffer_max - 2))
		return 0
	var/released_blood = stored_blood
	stored_blood = 0
	return released_blood

/obj/item/organ/internal/spleen/on_life(seconds_per_tick, times_fired)
	. = ..()
	if(stored_blood < internal_blood_buffer_max)
		stored_blood += 0.02

/obj/item/organ/internal/liver/before_organ_replacement(obj/item/organ/replacement)
	. = ..()
	if(!istype(replacement, type))
		return

	var/datum/job/owner_job = owner.mind?.assigned_role
	if(!owner_job || !LAZYLEN(owner_job.liver_traits))
		return

	// Transfer over liver traits from jobs, if we should have them
	for(var/readded_trait in owner_job.liver_traits)
		if(!HAS_TRAIT_FROM(src, readded_trait, JOB_TRAIT))
			continue
		ADD_TRAIT(replacement, readded_trait, JOB_TRAIT)

#define HAS_SILENT_TOXIN 0 //don't provide a feedback message if this is the only toxin present
#define HAS_NO_TOXIN 1
#define HAS_PAINFUL_TOXIN 2

/obj/item/organ/internal/spleen/on_life(seconds_per_tick, times_fired)
	. = ..()
	//If your liver is failing, then we use the liverless version of metabolize
	//We don't check for TRAIT_LIVERLESS_METABOLISM here because we do want a functional liver if somehow we have one inserted

/obj/item/organ/internal/spleen/get_availability(datum/species/owner_species, mob/living/owner_mob)
	return owner_species.mutantliver

#undef SPLEEN_DEFAULT_BLOOD_REGEN
