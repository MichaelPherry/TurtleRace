extends CanvasLayer
# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("AnimationPlayer").play("TransIn")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_item_list_item_activated(index):
	print("test")
	pass # Replace with function body.


func _on_button_button_down() -> void:
	get_node("AnimationPlayer").play("TransOut")
	await get_tree().create_timer(1.0).timeout
	get_tree().paused = false
	
