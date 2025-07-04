extends Node

var data_path = "res://Data/ItemData.json"
var item_data = {}

func _ready():
	#This will open the ItemData file, read all the data, and add it into a dictonary
	var item_data_file = FileAccess.get_file_as_string(data_path)
	var item_data_json = JSON.parse_string(item_data_file)
	item_data = item_data_json
	if(item_data == null):
		push_warning("shit is empty bro")
