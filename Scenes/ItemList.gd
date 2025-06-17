extends ItemList
var rng = RandomNumberGenerator.new()
var Common = 64
var Rare = 28
var item_data = ItemData.item_data
var item_rarity
var random_item
#weights will assign a weight to each index, ie index 0 has a weight of 1, index
#4 has a weight of 0.5 meaning 1 is more likely to get picked
# Called when the node enters the scene tree for the first time.
func _ready():
	print(item_data)
	for item in range(4):
		#var texture = load(item["ItemImage"]) as Texture2D
		item_rarity = rng.randf_range(0, 100)
		if item_rarity <= Common:
			item_rarity = "Common"
		elif item_rarity > Common && item_rarity <= (Common + Rare):
			item_rarity = "Rare"
		elif item_rarity > Common + Rare:
			item_rarity = "Epic"

		random_item = item_data[item_rarity].keys().pick_random()
		print(random_item)
		var texture = load(item_data[item_rarity][random_item]["ItemImage"]) as Texture2D
		add_item(random_item, texture)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_item_activated(index):
	print("test")
	
	pass # Replace with function body.
