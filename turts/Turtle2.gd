extends CharacterBody2D

@export var description: String
@export var icon: Texture2D

const player = "turt2"
const SPEED = 100
var multiplier

#If health falls to zero your speed slows drastically
var health_buff = 0
var race_health
var health_check = true
var finished = false
var invincible = false
@onready var sprite = $AnimatedSprite2D

var passives
var items
var item_holding = load(Globals.turtle_stats[player]["Item"][0])
var cooldown = item_holding.cooldown
func _ready():
	multiplier = Globals.turtle_stats[player]["Multiplier"]
	race_health = Globals.turtle_stats[player]["Health"]
	passives = Globals.turtle_stats[player]["Passives"]
	#Initializes a group to check when a turt has crossed the finish line
	add_to_group("turt_player")
	add_to_group("turt2")
	sprite.play("Jog")
	race_health = race_health + health_buff
	
	for boost in passives:
		boost = load(boost)
		boost.apply(self, get_tree())
	
	sprite.speed_scale *= (multiplier / 3)
	
func _physics_process(delta):
	if finished == true:
		return
	if cooldown <= 0.0:
		var myself = self
		var enemy = get_turtle_by_name("turt2")
		use_item(get_tree(), myself, enemy) 
		cooldown = item_holding.cooldown
	cooldown -= delta
	velocity.y = SPEED * multiplier
	move_and_slide()
	
func get_turtle_by_name(myself):
	var turts = get_tree().get_nodes_in_group("turt_player")
	var shuffled = turts.duplicate()
	shuffled.shuffle()
	for t in shuffled:
		if t not in Globals.finished_turts:
			if t.player != myself:
				return t
	return null

func use_item(main, pos, target):
	if target == null:
		return
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
