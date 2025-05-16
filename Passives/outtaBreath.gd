extends "res://Passives/passive.gd"

func apply(turt):
	turt.sprite.play("Standing")
	turt.multiplier *= 0.7
	print("I'm outta breath")
