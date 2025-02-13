/datum/reagent/drug/copium
	name = "Copium"
	description = "Cope and sssethe"
	reagent_state = LIQUID
	taste_description = "coping"
	color = "#0f0"
	trippy = FALSE
	overdose_threshold = 30

/datum/reagent/drug/copium/on_mob_life(mob/living/carbon/affected_mob)
	. = ..()

	if (!ishuman(affected_mob))
		return
	var/mob/living/carbon/human/H = affected_mob
	if (prob(10))
		to_chat(H, "<span class='notice'>You feel like you can cope!</span>")
		H.adjust_disgust(-10)
		affected_mob.add_mood_event("opium", /datum/mood_event/cope, name)

/datum/reagent/drug/copium/overdose_start(mob/living/carbon/affected_mob)
	to_chat(affected_mob, "<span class='userdanger'>What the fuck.</span>")
	affected_mob.add_mood_event("[type]_overdose", /datum/mood_event/overdose, name)

/datum/reagent/drug/copium/overdose_process(mob/living/carbon/affected_mob)
	var/mob/living/carbon/human/H = affected_mob
	if (prob(5))
		H.adjust_disgust(20)
		to_chat(H, "<span class='warning'>I can't stand it anymore!</span>")
	. = ..()
/datum/reagent/drug/aphrodisiac
	name = "Crocin"
	description = "Naturally found in the crocus and gardenia flowers, this drug acts as a natural and safe aphrodisiac."
	taste_description = "strawberries"
	color = "#FFADFF"//PINK, rgb(255, 173, 255)

/datum/reagent/drug/aphrodisiac/on_mob_life(mob/living/M)
	if(M && M.client?.prefs.arousable)
		if((prob(min(current_cycle/2,5))))
			M.emote(pick("moan","blush"))
		if(prob(min(current_cycle/4,10)))
			var/aroused_message = pick("You feel frisky.", "You're having trouble suppressing your urges.", "You feel in the mood.")
			to_chat(M, span_userlove("[aroused_message]"))
		if(ishuman(M))
			var/mob/living/carbon/human/H = M
			var/list/genits = H.adjust_arousal(current_cycle, "crocin", aphro = TRUE) // redundant but should still be here
			for(var/g in genits)
				var/obj/item/organ/genital/G = g
				to_chat(M, span_userlove("You feel aroused!"))
	..()

/datum/reagent/drug/aphrodisiacplus
	name = "Hexacrocin"
	description = "Chemically condensed form of basic crocin. This aphrodisiac is extremely powerful and addictive in most animals.\
					Addiction withdrawals can cause brain damage and shortness of breath. Overdosage can lead to brain damage and a \
					permanent increase in libido (commonly referred to as 'bimbofication')."
	taste_description = "liquid desire"
	color = "#FF2BFF"//dark pink
	addiction_types = list(/datum/addiction/maintenance_drugs = 20)
	overdose_threshold = 20

/datum/reagent/drug/aphrodisiacplus/on_mob_life(mob/living/M)
	if(M && M.client?.prefs.arousable) //if(M && M.client?.prefs.arousable && !(M.client?.prefs.cit_toggles & NO_APHRO))
		if(prob(5))
			if(prob(current_cycle))
				M.say(pick("Hnnnnngghh...", "Ohh...", "Mmnnn..."))
			else
				M.emote(pick("moan","blush"))
		if(prob(5))
			var/aroused_message
			if(current_cycle>25)
				aroused_message = pick("You need to fuck someone!", "You're bursting with sexual tension!", "You can't get sex off your mind!")
			else
				aroused_message = pick("You feel a bit hot.", "You feel strong sexual urges.", "You feel in the mood.", "You're ready to go down on someone.")
			to_chat(M, span_userlove("[aroused_message]"))
			REMOVE_TRAIT(M,TRAIT_NEVERBONER,TRAIT_APHRO)
		if(ishuman(M))
			var/mob/living/carbon/human/H = M
			var/list/genits = H.adjust_arousal(100, "hexacrocin", aphro = TRUE) // redundant but should still be here
			for(var/g in genits)
				var/obj/item/organ/genital/G = g
				to_chat(M, span_userlove("You feel aroused!"))
	..()

/datum/reagent/drug/aphrodisiacplus/addiction_act_stage2(mob/living/M)
	if(prob(30))
		M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 2)
	..()
/datum/reagent/drug/aphrodisiacplus/addiction_act_stage3(mob/living/M)
	if(prob(30))
		M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 3)

		..()
/datum/reagent/drug/aphrodisiacplus/addiction_act_stage4(mob/living/M)
	if(prob(30))
		M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 4)
	..()

/datum/reagent/drug/aphrodisiacplus/overdose_process(mob/living/M)
	if(M && M.client?.prefs.arousable && prob(33))
		if(prob(5) && ishuman(M) && M.has_dna() && HAS_TRAIT(M, TRAIT_BIMBO))
			if(!HAS_TRAIT(M,TRAIT_PERMABONER))
				to_chat(M, span_userlove("Your libido is going haywire! You have either been turned into a bimbo or made perma-horny by hexacrocin!"))
				M.log_message("Made perma-horny by hexacrocin.",LOG_EMOTE)
				ADD_TRAIT(M,TRAIT_PERMABONER,APHRO_TRAIT)
	..()


