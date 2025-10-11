extends "res://Items/items.gd"
@export var boomerang: PackedScene

func apply(main, user, target):
	print('hi')
	var boomerang_instance = boomerang.instantiate()
	#var target_mark = target.get_node("AnimatedSprite2D/Marker2D")
	boomerang_instance.target = target
	boomerang_instance.global_position = user.global_position
	main.root.add_child(boomerang_instance)
