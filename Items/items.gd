extends Resource
class_name Item

@export var name: String
@export var description: String
@export var icon: Texture2D

func apply(main, user, target):
	push_warning("apply() not implemented for %s" % name)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
