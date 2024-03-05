extends Node2D
signal change_scene
signal rewind_action
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event.is_action_pressed("rewind"):
		rewind_action.emit()

func changeScene(scene):
	change_scene.emit(scene)
	pass
