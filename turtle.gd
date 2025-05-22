extends CharacterBody2D

const player = "human turtle"
const SPEED = 10
var multiplier = 4

#If health falls to zero your speed slows drastically
const full_health = 3
var health_buff = 0
var race_health = 3
var health_check = true
@onready var sprite = $AnimatedSprite2D

var passives = [preload("res://Passives/coffee.tres")]
var item_holding = []
var item_use = []

func _ready():
	#Initializes a group to check when a turt has crossed the finish line
	add_to_group("turt_player")
	sprite.play("Walking")
	race_health = full_health + health_buff
	
	for boost in passives:
		boost.apply(self)
	
	sprite.speed_scale *= multiplier
	
func _physics_process(delta):
	if health_check and race_health <= 0:
		health_check = false
		multiplier = 0.5
		print('Turt DEAD')
	velocity.y = SPEED * multiplier

	move_and_slide()

	
	
