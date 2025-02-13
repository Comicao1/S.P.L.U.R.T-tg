// Ported drink bottles from S.P.L.U.R.T-Station-13
// New bottles for the barman
/obj/item/reagent_containers/cup/glass/bottle/cum_rum
	name = "NT Femboy Navy Cum Rum"
	desc = "Can't have female mates in the Navy! Sourced from NT femboy cum farms."
	icon = 'modular_zzplurt/icons/obj/drinks/drinks.dmi'
	icon_state = "cum_rum"
	volume = 100
	list_reagents = list(
		/datum/reagent/consumable/ethanol/navy_rum = 40,
		/datum/reagent/consumable/cum = 60
	)

/obj/item/reagent_containers/cup/glass/bottle/femcum_whiskey
	name = "2440's Special Femcum whiskey"
	desc = "For the womanizer detective."
	icon = 'modular_zzplurt/icons/obj/drinks/drinks.dmi'
	icon_state = "femcum_whiskey"
	volume = 100
	list_reagents = list(
		/datum/reagent/consumable/ethanol/whiskey = 40,
		/datum/reagent/consumable/femcum = 60
	)

/obj/item/reagent_containers/cup/glass/bottle/bloodwine
	name = "Stoker's Special reserve Bloodwine"
	desc = "Horribly sweet, wonderfuly wicked and aged to perfection."
	icon = 'modular_zzplurt/icons/obj/drinks/drinks.dmi'
	icon_state = "bloodwine"
	volume = 100
	list_reagents = list(
		/datum/reagent/consumable/ethanol/wine = 40,
		/datum/reagent/blood = 60
	)
/obj/item/reagent_containers/glass/bottle/mutetoxin
	name = "Mute Toxin Bottle"
	desc = "A small bottle of Mute Toxin. It stops the user from speaking."
	icon_state = "bottle20"
	list_reagents = list(/datum/reagent/toxin/mutetoxin = 30)

/obj/item/reagent_containers/glass/bottle/plushmium
	name = "\improper Plushmium Bottle"
	desc = "A small bottle of Plushmium. Seems almost fluffy, if not for it being a liquid."
	icon_state = "bottle20"
	list_reagents = list(/datum/reagent/fermi/plushmium = 5)
	possible_transfer_amounts = list(5)
	volume = 5

/obj/item/reagent_containers/glass/bottle/semen
	name = "Synthetized Semen"
	desc = "A dose of synthetic semen. This could prove useful to Succubus demons in dire situations."
	icon_state = "bottle20"
	list_reagents = list(/datum/reagent/consumable/semen = 30)
	possible_transfer_amounts = list(5)

/obj/item/reagent_containers/glass/bottle/female_ejaculate
	name = "bottle of female ejaculate"
	desc = "A dose of synthetic reproductive fluid. Historically used for artificial inseminations."
	icon_state = "bottle20"
	list_reagents = list(/datum/reagent/consumable/semen/femcum = 30)
	possible_transfer_amounts = list(5)
