extends "res://Passives/passive.gd"

func apply(turt, tree):
	turt.cooldown_decrease += 0.5
