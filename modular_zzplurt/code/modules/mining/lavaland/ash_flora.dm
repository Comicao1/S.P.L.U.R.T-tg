/obj/item/reagent_containers/glass/bowl/mushroom_bowl
	name = "mushroom bowl"
	desc = "A bowl made out of mushrooms. Not food, though it might have contained some at some point."
	icon = 'icons/obj/lavaland/ash_flora.dmi'
	icon_state = "mushroom_bowl"

/obj/item/reagent_containers/glass/bowl/mushroom_bowl/update_icon_state()
	if(!reagents || !reagents.total_volume)
		icon_state = "mushroom_bowl"

/obj/item/reagent_containers/glass/bowl/mushroom_bowl/update_overlays()
	. = ..()
	if(reagents && reagents.total_volume)
		. += mutable_appearance('icons/obj/lavaland/ash_flora.dmi', "fullbowl", color = mix_color_from_reagents(reagents.reagent_list))

/obj/item/reagent_containers/glass/bowl/mushroom_bowl/attackby(obj/item/I,mob/user, params)
	if(istype(I, /obj/item/reagent_containers/food/snacks))
		var/obj/item/reagent_containers/food/snacks/S = I
		if(I.w_class > WEIGHT_CLASS_SMALL)
			to_chat(user, "<span class='warning'>The ingredient is too big for [src]!</span>")
		else if(contents.len >= 20)
			to_chat(user, "<span class='warning'>You can't add more ingredients to [src]!</span>")
		else
			if(reagents.has_reagent(/datum/reagent/water, 10)) //are we starting a soup or a salad?
				var/obj/item/reagent_containers/food/snacks/customizable/A = new/obj/item/reagent_containers/food/snacks/customizable/soup/ashsoup(get_turf(src))
				A.initialize_custom_food(src, S, user)
			else
				var/obj/item/reagent_containers/food/snacks/customizable/A = new/obj/item/reagent_containers/food/snacks/customizable/salad/ashsalad(get_turf(src))
				A.initialize_custom_food(src, S, user)
	else
		. = ..()

//what you can craft with these things
/datum/crafting_recipe/mushroom_bowl
	name = "Mushroom Bowl"
	result = /obj/item/reagent_containers/glass/bowl/mushroom_bowl
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/ash_flora/shavings = 5)
	time = 30
	category = CAT_FOOD

/obj/item/reagent_containers/food/snacks/customizable/salad/ashsalad
	desc = "Very ashy."
	trash = /obj/item/reagent_containers/glass/bowl/mushroom_bowl
	icon = 'icons/obj/lavaland/ash_flora.dmi'
	icon_state = "mushroom_bowl"

/obj/item/reagent_containers/food/snacks/customizable/soup/ashsoup
	desc = "A bowl with ash and... stuff in it."
	trash = /obj/item/reagent_containers/glass/bowl/mushroom_bowl
	icon = 'icons/obj/lavaland/ash_flora.dmi'
	icon_state = "mushroom_soup"

/obj/item/reagent_containers/food/snacks/grown/ash_flora/shavings
	name = "lavaland flora shavings"
	desc = "Some shavings from lavaland flora. They're known to have weak healing properties."
	icon_state = "flora_shavings"
	food_color = "#FF4500"
	food_reagents = list(
		/datum/reagent/medicine/c2/aiuri = 2,
		/datum/reagent/consumable/nutriment = 3
	)
	tastes = list("ash" = 1)
	foodtypes = VEGETABLES
