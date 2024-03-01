extends Node2D

@export var player_node :Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	var i = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	if i != Vector2(0,0):
		player_node.create_tween().tween_property(player_node,"position",player_node.position+i*100,0.2)
	pass
