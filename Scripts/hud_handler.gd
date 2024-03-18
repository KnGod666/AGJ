extends Control

@onready var tp_label = $tp_left


# Called when the node enters the scene tree for the first time.
func _ready():
	#update_tp_left()
	GlobalState.tp_left_changed.connect(update_tp_left)
	pass # Replace with function body.
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update_tp_left(prev,new):
	tp_label.text = str("teleports left: ",new)
	tp_label.queue_redraw()
