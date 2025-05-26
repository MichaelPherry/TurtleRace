extends CharacterBody2D

const player = "computer turtle"
const SPEED = 10
var multiplier = 4
@onready var sprite = $AnimatedSprite2D

var passives = [preload("res://Passives/outtaBreath.tres")]
var items_lst = []

func _ready():
	#Initializes a group to check when a turt has crossed the finish line
	add_to_group("turt_player")
	sprite.play("Walking")
	
	for boost in passives:
		boost.apply(self)
		
	sprite.speed_scale *= multiplier
	
func _physics_process(delta):
	velocity.y = SPEED * multiplier

	move_and_slide()


