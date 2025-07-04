extends Area2D

@export var speed: float = 1000
var target
var turn_speed = 200
var damage = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var to_target = (target.global_position - global_position).normalized()
	var target_angle = to_target.angle()
	rotation = lerp_angle(rotation, target_angle, turn_speed * delta)
	position += transform.x * speed * delta

func _on_body_entered(body):	
	if body == target:
		queue_free()
		if body.invincible == false:
			body.take_damage(damage)
			body.flash()
