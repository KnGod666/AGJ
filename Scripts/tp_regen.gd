extends Node2D

var states_stack = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_area_entered(area):
	if visible and area.name == "PlayerColission":
		#maybe add variable ammounts of charges
		GlobalState.set_tp_left(GlobalState.tp_left+1)
		visible = false#probably disable this some other way, i have to support rewind
	pass # Replace with function body.

func load_state():
	if not states_stack.is_empty():
		visible = states_stack.pop_back()


func save_state():
	if states_stack.size() > 30:
		states_stack.pop_front()
	states_stack.push_back(visible)
