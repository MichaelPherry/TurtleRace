extends ItemList

var itemList = ["Coffee", "Test", "Test2"]
var itemImage = {"Coffee" : "res://Art/Coffee Mug 001 16x161.png", 
"Test" : "res://Art/Coffee Mug 001 16x161.png", 
"Test2" : "res://Art/Coffee Mug 001 16x161.png"}


# Called when the node enters the scene tree for the first time.
func _ready():
	for item in itemList:
		var texture = load(itemImage[item]) as Texture2D
		add_item(item, texture)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_item_activated(index):
	print("test")
	
	pass # Replace with function body.
