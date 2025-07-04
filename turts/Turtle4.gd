extends CharacterBody2D

@export var description: String
@export var icon: Texture2D

const player = "human turtle"
const SPEED = 100
var multiplier = 4

#If health falls to zero your speed slows drastically
const full_health = 3
var health_buff = 0
var race_health = 3
var health_check = true
var finished = false
var invincible = false
@onready var sprite = $AnimatedSprite2D

var passives = [preload("res://Passives/coffee.tres")]
var item_holding = []
var item_use = []

func _ready():
	#Initializes a group to check when a turt has crossed the finish line
	add_to_group("turt_player")
	add_to_group("turt4")
	sprite.play("Jog")
	race_health = full_health + health_buff
	
	for boost in passives:
		boost.apply(self)
	
	sprite.speed_scale *= (multiplier / 3)
	
func _physics_process(delta):
	if finished == true:
		return
	if health_check and race_health <= 0:
		health_check = false
		multiplier *= 0.5
		print('Turt DEAD')
	velocity.y = SPEED * multiplier
	move_and_slide()
	
func use_item(main, pos, target):
	item_holding.apply(main, pos, target)
	
func take_damage(amt):
	race_health -= amt
	
func flash():
	invincible = true
	var sprite = $AnimatedSprite2D
	multiplier /= -5
	sprite.modulate = Color(1, 1, 1, 0.2)
	await get_tree().create_timer(0.1).timeout
	sprite.modulate = Color(1, 1, 1, 1) 
	await get_tree().create_timer(0.1).timeout
	sprite.modulate = Color(1, 1, 1, 0.2)
	await get_tree().create_timer(0.1).timeout
	sprite.modulate = Color(1, 1, 1, 1) 
	await get_tree().create_timer(0.1).timeout
	sprite.modulate = Color(1, 1, 1, 0.2)
	await get_tree().create_timer(0.1).timeout
	sprite.modulate = Color(1, 1, 1, 1) 
	multiplier *= -5
	invincible = false
