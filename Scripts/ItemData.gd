extends Node

var item_data = {}

func _ready():
	#This will open the ItemData file, read all the data, and add it into a dictonary
	var item_data_file = FileAccess.open("res://Data/ItemData.json", FileAccess.READ)
	var json = JSON.new()
	var item_data_json = json.parse(item_data_file.get_as_text())
	item_data_file.close()
	item_data = item_data_json
