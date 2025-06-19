extends "res://Items/items.gd"
@export var missile: PackedScene

func apply(main, user, target):
	var missile_instance = missile.instantiate()
	missile_instance.target = target
	missile_instance.global_position = user.global_position
	main.root.add_child(missile_instance)
