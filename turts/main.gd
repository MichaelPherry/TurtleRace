extends Node
var character
var turtles
var player_scene
var enemy_target
var shop = preload("res://Scenes/shop.tscn")
var change = false
# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.finished_turts = []
	Globals.what_pos = {"turt1": 0, "turt2": 0, "turt3": 0, "turt4": 0}
	character = Globals.character
	$shop.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	turtles = get_tree().get_nodes_in_group("turt_player")
	for turtle in turtles:
		Globals.what_pos[turtle.player] = turtle.global_position.y
	var order = Globals.what_pos.keys().map(func(k): return [k, Globals.what_pos[k]])
	order.sort_custom(func(a, b): return a[1] > b[1])
	Globals.race_order = order

func _on_finish_line_body_exited(body):
	if body.is_in_group("turt_player"):
		if body.name not in Globals.finished_turts:
			Globals.finished_turts.append(body)
			body.finished = true
			body.sprite.speed_scale = 1
			body.sprite.play("Standing")
			print("%s has finished the race!" % body.name)
			if len(Globals.finished_turts) >= 4:
				await get_tree().create_timer(0.3).timeout
				get_tree().paused = true
				await get_tree().create_timer(0.1).timeout
				$shop.visible = true
				Globals.shop = true
