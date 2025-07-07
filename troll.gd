extends Node2D

var player_scene
func _ready():
	await get_tree().create_timer(1.0).timeout
	Globals.turtle_stats["turt1"]["Multiplier"] -= 1
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
	#queue_free()
