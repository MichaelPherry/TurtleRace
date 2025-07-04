extends "res://Items/items.gd"

func apply(main, user, target):
	var user_y = user.global_position.y
	var target_y = target.global_position.y
	user.global_position.y = target_y
	target.global_position.y = user_y
