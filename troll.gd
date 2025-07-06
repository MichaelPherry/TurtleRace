extends Node2D
var main = preload("res://Scenes/main.tscn")

func _ready():
	await get_tree().create_timer(1.0).timeout
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
	#queue_free()
