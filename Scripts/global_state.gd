extends Node

signal tp_left_changed

var tp_left
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_tp_left(val):
	var prev_val = tp_left
	tp_left = val
	tp_left_changed.emit(prev_val, tp_left)
