extends "res://Passives/passive.gd"

var place
func apply(turt, tree):
	place = Globals.turtle_stats[turt.player]['Placing']
	if place != 1:
		place -= 1
		place *= 1.33
	turt.multiplier += place
