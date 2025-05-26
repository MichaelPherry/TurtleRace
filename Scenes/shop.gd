extends Node2D

#There's like for sure a better way to do this
var itemList = ["Coffee", "Test", "Test2"]
var itemImage = {"Coffee" : "res://Art/Coffee Mug 001 16x161.png", 
"Test" : "res://Art/Coffee Mug 001 16x161.png", 
"Test2" : "res://Art/Coffee Mug 001 16x161.png"}

# Called when the node enters the scene tree for the first time.
func _ready():
	#this will put all the items into the shop, we can change this to select a certain amount later
	#Can also mess with rarity and stuff like that later
	for item in itemList:
		get_node("ItemList").add_item(item, load(itemImage[item]))



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_item_list_item_activated(index):
	print("test")
	pass # Replace with function body.
