extends Node2D

#There's like for sure a better way to do this
var rng = RandomNumberGenerator.new()
var weights = PackedFloat32Array([1, 1, 1, 1, 0.5])
#weights will assign a weight to each index, ie index 0 has a weight of 1, index
#4 has a weight of 0.5 meaning 1 is more likely to get picked

var itemList = ["Coffee", "Test", "Test2", "test3", "test4"]
var itemImage = {"Coffee" : "res://Art/Coffee Mug 001 16x161.png", 
"Test" : "res://Art/Coffee Mug 001 16x161.png", 
"Test2" : "res://Art/Coffee Mug 001 16x161.png"}

# Called when the node enters the scene tree for the first time.
func _ready():
	#this will put all the items into the shop, we can change this to select a certain amount later
	#Can also mess with rarity and stuff like that later
	print("test")
	for item in itemList:
		get_node("ItemList").add_item(item, load(itemImage[item]))
	
	#for i in range(3):
	#	var item_picked = itemList[rng.rand_weighted(weights)]
	#	get_node("ItemList").add_item(item_picked, load(itemImage[item_picked]))
		
		



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_item_list_item_activated(index):
	print("test")
	pass # Replace with function body.
