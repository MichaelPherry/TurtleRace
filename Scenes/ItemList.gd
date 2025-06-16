extends ItemList
var rng = RandomNumberGenerator.new()
var weights = PackedFloat32Array([1, 1, 1, 1, 0.5])
#weights will assign a weight to each index, ie index 0 has a weight of 1, index
#4 has a weight of 0.5 meaning 1 is more likely to get picked
# Called when the node enters the scene tree for the first time.
func _ready():
	for item in ItemData.item_data:
		var texture = load(item["ItemImage"]) as Texture2D
		add_item(item, texture)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_item_activated(index):
	print("test")
	
	pass # Replace with function body.
