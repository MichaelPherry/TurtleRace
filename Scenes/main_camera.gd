extends Camera2D
var min_pos = 0
var max_pos = 0
var center = 0
var turtles = null
var zoom_amt = 2
var last_dist = 0

func update_zoom(distance):
	if distance > last_dist and zoom_amt > 1.5:
		zoom_amt = zoom_amt - 0.001
	elif distance < last_dist and zoom_amt < 2:
		zoom_amt = zoom_amt + 0.001
	last_dist = distance
	zoom = zoom.lerp(Vector2(zoom_amt, zoom_amt), 0.001)

func _ready():
	zoom = Vector2(zoom_amt, zoom_amt)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var turtles = get_tree().get_nodes_in_group("turt_player")
	min_pos = turtles[0].global_position
	max_pos = turtles[0].global_position
	for turtle in turtles:
		var pos = turtle.global_position
		min_pos = Vector2(min(min_pos.x, pos.x), min(min_pos.y, pos.y))
		max_pos = Vector2(max(max_pos.x, pos.x), max(max_pos.y, pos.y))
		
	center = (min_pos + max_pos) * 0.5
	global_position = center  
	update_zoom(max_pos.y - min_pos.y)
	
#quick change

