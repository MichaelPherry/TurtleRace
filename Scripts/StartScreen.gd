extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func change_scene(player):
	Globals.character = player
	get_tree().change_scene_to_file("res://Scenes/main.tscn")

func _on_player_1_pressed():
	change_scene("Turtle")

func _on_player_2_pressed():
	change_scene("Turtle2")

func _on_player_3_pressed():
	change_scene("Turtle3")

func _on_player_4_pressed():
	change_scene("Turtle4")
