extends Node
var finished_turts = []
var character
var player_scene
var enemy_target
var shop = preload("res://Scenes/shop.tscn")
var troll = preload("res://Scenes/troll.tscn")
var main = load("res://Scenes/main.tscn")
var change = false
# Called when the node enters the scene tree for the first time.
func _ready():
	character = Globals.character
	$shop.visible = false
	$UI/ItemUse.connect("pressed", Callable(self, "_on_item_use_pressed"))
	$UI/OptionButton.add_item("Select a target")
	$UI/OptionButton.add_item("Turtle 1")
	$UI/OptionButton.add_item("Turtle 2")
	$UI/OptionButton.add_item("Turtle 3")
	$UI/OptionButton.add_item("Turtle 4")
	player_scene = load("res://turts/" + character + ".tscn")
	player_scene = player_scene.instantiate()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if change == true and get_tree().paused == false:
		change = false
		print("wahoo")
		get_tree().change_scene_to_file("res://Scenes/troll.tscn")
		#get_tree().reload_current_scene()
		#queue_free()

func _on_item_use_pressed():
	if enemy_target == null:
		return
	var tree = get_tree()
	var temp_users = get_node(character)
	var temp_enemy = get_node(enemy_target)
	if temp_enemy.finished == false and temp_users.finished == false:
		player_scene.use_item(tree, temp_users, temp_enemy)


func _on_option_button_item_selected(index):
	var selected_text = $UI/OptionButton.get_item_text(index)
	match selected_text:
		"Select a target":
			enemy_target = null
		"Turtle 1":
			enemy_target = "Turtle"
		"Turtle 2":
			enemy_target = "Turtle2"
		"Turtle 3":
			enemy_target = "Turtle3"
		"Turtle 4":
			enemy_target = "Turtle4"


func _on_finish_line_body_exited(body):
	if body.is_in_group("turt_player"):
		if body.name not in finished_turts:
			finished_turts.append(body)
			body.finished = true
			body.sprite.speed_scale = 1
			body.sprite.play("Standing")
			print("%s has finished the race!" % body.name)
			if len(finished_turts) >= 4:
				print(get_tree())
				await get_tree().create_timer(0.3).timeout
				get_tree().paused = true
				await get_tree().create_timer(0.1).timeout
				$shop.visible = true
				change = true
				#get_tree().change_scene_to_packed(shop)
