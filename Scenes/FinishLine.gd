extends Area2D

var finished_turts = []
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_exited(body):
	if body.is_in_group("turt_player"):
		if body.name not in finished_turts:
			finished_turts.append(body)
			body.multiplier = 0
			body.sprite.speed_scale = 1
			body.sprite.play("Standing")
			print("%s has finished the race!" % body.name)
			if len(finished_turts) >= 2:
				#pass
				get_tree().change_scene_to_file("res://Scenes/shop.tscn")
