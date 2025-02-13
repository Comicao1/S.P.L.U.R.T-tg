/obj/item/clothing/underwear/socks
	name = "socks"
	desc = "A pair of socks."
	icon_state = "socks"
	body_parts_covered = FEET
	extra_slot_flags = ITEM_SLOT_SOCKS
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION

/obj/item/clothing/underwear/socks/equipped(mob/living/user, slot)
	. = ..()
	var/slot_noextra = slot & ~ITEM_SLOT_EXTRA
	if(!istype(user, /mob/living/carbon/human))
		return
	var/mob/living/carbon/human/human = user
	if(slot & ITEM_SLOT_EXTRA && slot_noextra & ITEM_SLOT_SOCKS)
		human.socks = name
	else
		human.socks = "Nude"

/obj/item/clothing/underwear/socks/dropped(mob/living/user)
	. = ..()
	if(!istype(user, /mob/living/carbon/human))
		return
	var/mob/living/carbon/human/human = user
	human.socks = "Nude"

/obj/item/clothing/underwear/socks/thigh/thigh_cow
	name = "cow thigh high socks"
	desc = "Moo?"
	icon_state = "socks_cow"
	icon = 'modular_zzplurt/icons/obj/clothing/underwear.dmi'
	worn_icon = 'modular_zzplurt/icons/mob/clothing/underwear.dmi'
	worn_icon_digi = 'modular_zzplurt/icons/mob/clothing/underwear_digi.dmi'

/obj/item/clothing/underwear/socks/thigh/fishnet
	name = "Fishnet tights"
	desc = "The thickest of thighs will make this net break rather easily"
	icon_state = "fishnet"
	icon = 'modular_zzplurt/icons/obj/clothing/underwear.dmi'
	worn_icon = 'modular_zzplurt/icons/mob/clothing/underwear.dmi'
	worn_icon_digi = 'modular_zzplurt/icons/mob/clothing/underwear_digi.dmi'
	body_parts_covered = FEET|LEGS|GROIN

/obj/item/clothing/underwear/socks/thigh/fishnet/white
	name = "White Fishnet tights"
	icon_state = "fishnet_w"


/**
 * Do not declare new shirt or bra objects directly through typepaths, use SHIRT_OBJECT(class)/BRA_OBJECT(class) instead
 * Example:
 *
SOCKS_OBJECT(test)
	name = "test socks"
	icon_state = "test"
	flags_1 = IS_PLAYER_COLORABLE_1
	gender = MALE
	...
*/
