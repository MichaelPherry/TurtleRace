extends "res://Items/items.gd"
@export var missile: PackedScene

var speed
func apply(main, user, target):
	var missile_instance = missile.instantiate()
	#var target_mark = target.get_node("AnimatedSprite2D/Marker2D")
	missile_instance.target = target
	missile_instance.user = user
	missile_instance.global_position = user.global_position
	fire_animation(main, user, target)
	main.root.add_child(missile_instance)

func fire_animation(main, user, target):
	speed = user.SPEED
	user.SPEED = 0
	if user.global_position.x > target.global_position.x:
		user.sprite.flip_h = true
		user.sprite.play('Fissile')
		await main.create_timer(0.5).timeout
		user.sprite.flip_h = false
		user.sprite.play('Jog')
	else:
		user.sprite.play('Fissile')
		await main.create_timer(0.5).timeout
		user.sprite.play('Jog')
	user.SPEED = speed
