extends Node

var character
var player_scene
# Called when the node enters the scene tree for the first time.
func _ready():
	$UI/ItemUse.connect("pressed", Callable(self, "_on_item_use_pressed"))
	player_scene = load("res://turts/" + character + ".tscn")
	player_scene = player_scene.instantiate()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_item_use_pressed():
	player_scene.use_item()
