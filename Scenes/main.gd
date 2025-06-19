extends Node

var character
var player_scene
#@onready var temp_enemy = get_node("Turtle2/AnimatedSprite2D/Marker2D")
var main = load("res://Scenes/main.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	$UI/ItemUse.connect("pressed", Callable(self, "_on_item_use_pressed"))
	player_scene = load("res://turts/" + character + ".tscn")
	#temp_enemy = get_node("/root/Scenes/Main/Turtle2/Marker2D")
	player_scene = player_scene.instantiate()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_item_use_pressed():
	var tree = get_tree()
	var temp_users = get_node("Turtle/AnimatedSprite2D/Marker2D")
	var temp_enemy = get_node("Turtle2/AnimatedSprite2D/Marker2D")
	player_scene.use_item(tree, temp_users, temp_enemy)
