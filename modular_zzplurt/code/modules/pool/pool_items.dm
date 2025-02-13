/obj/item/pool/pool_noodle
	icon_state = "pool_noodle"
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	name = "pool noodle"
	desc = "A long noodle made of foam. Helping those with fears of swimming swim since the 1980s."
	var/suiciding = FALSE

/obj/item/pool/pool_noodle/attack(mob/target, mob/living/carbon/human/user)
	. = ..()
	if(ISWIELDED(src) && prob(50))
		INVOKE_ASYNC(src, PROC_REF(jedi_spin), user)

/obj/item/pool/pool_noodle/proc/jedi_spin(mob/living/user) //rip complex code, but this fucked up blocking
	user.emote("flip")

/obj/item/pool/pool_noodle/suicide_act(mob/living/user)
	if(suiciding)
		return SHAME
	suiciding = TRUE
	user.visible_message("<span class='notice'>[user] begins kicking their legs to stay afloat!</span>")
	var/mob/living/L = user
	if(istype(L))
		L.Immobilize(63)
	animate(user, time=20, pixel_y=18)
	sleep(20)
	animate(user, time=10, pixel_y=12)
	sleep(10)
	user.visible_message("<span class='notice'>[user] keeps swimming higher and higher!</span>")
	animate(user, time=10, pixel_y=22)
	sleep(10)
	animate(user, time=10, pixel_y=16)
	sleep(10)
	animate(user, time=15, pixel_y=32)
	sleep(15)
	user.visible_message("<span class='suicide'>[user] suddenly realised they aren't in the water and cannot float.</span>")
	animate(user, time=1, pixel_y=0)
	sleep(1)
	user.ghostize()
	user.gib()
	suiciding = FALSE
	return MANUAL_SUICIDE
