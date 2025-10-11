extends Area2D

@export var speed: float = 1000
var target
var damage = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	print('yay')
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var to_target = (target.global_position - global_position).normalized()
	position += transform.x * speed * delta
