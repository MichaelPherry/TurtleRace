extends "res://Passives/passive.gd"
#@export var missile: PackedScene
var missile = preload("res://Passives/missile.tscn")

func apply(turt, tree):
	#await tree.create_timer(2.0).timeout
	var turtles = tree.get_nodes_in_group("turt_player")
	var target = [null,0, null]
	print(len(turtles))
	for turtle in turtles:
		if turtle != turt:
			var turtle_pos = Globals.what_pos[turtle.player]
			print(turtle_pos)
			if turtle_pos > target[1]:
				target = [turtle, turtle_pos, turtle.player]
	print(target)
	await tree.create_timer(2.0).timeout
	var missile_instance = missile.instantiate()
	#var target_mark = target.get_node("AnimatedSprite2D/Marker2D")
	missile_instance.target = target[0]
	missile_instance.global_position = turt.global_position
	tree.root.add_child(missile_instance)
		
