extends Node

var character
var turtle_stats = {
	"turt1": {
		"Multiplier": 8,
		"Health": 3,
		"Item": ["res://Items/launcher.tres"],
		"Passives": []
	},
	"turt2": {
		"Multiplier": 6,
		"Health": 3,
		"Item": ["res://Items/teleporter.tres"],
		"Passives": ["res://Passives/coffee.tres"]
	},
	"turt3": {
		"Multiplier": 7,
		"Health": 3,
		"Item": ["res://Items/launcher.tres"],
		"Passives": []
	},
	"turt4": {
		"Multiplier": 7,
		"Health": 3,
		"Item": ["res://Items/launcher.tres"],
		"Passives": ["res://Passives/coffee.tres"]
	}
  }
var what_pos = {}
var shop = false
var race_order = []
var finished_turts
