extends Node

var character
var turtle_stats = {
	"turt1": {
		"Multiplier": 6,
		"Health": 3,
		"Cooldown": 0,
		"Projectile_speed": 1,
		"Item": ["res://Items/launcher.tres"],
		"Passives": [],
		"Placing": 1,
		"Gold": 0
	},
	"turt2": {
		"Multiplier": 6,
		"Health": 3,
		"Cooldown": 0,
		"Projectile_speed": 1,
		"Item": ["res://Items/launcher.tres"],
		"Passives": [],
		"Placing": 1,
		"Gold": 0
	},
	"turt3": {
		"Multiplier": 6,
		"Health": 3,
		"Cooldown": 0,
		"Projectile_speed": 1,
		"Item": ["res://Items/launcher.tres"],
		"Passives": [],
		"Placing": 1,
		"Gold": 0
	},
	"turt4": {
		"Multiplier": 6,
		"Health": 3,
		"Cooldown": 0,
		"Projectile_speed": 1,
		"Item": ["res://Items/launcher.tres"],
		"Passives": ["res://Passives/GunPowder.tres"],
		"Placing": 1,
		"Gold": 0
	}
  }
var what_pos = {}
var shop = false
var race_order = []
var finished_turts
