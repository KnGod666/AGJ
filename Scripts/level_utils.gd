extends Node2D
signal change_scene
signal rewind_action
# Called when the node enters the scene tree for the first time.
@export var level_initial_tp = 100
func _ready():
	GlobalState.set_tp_left(level_initial_tp)

func _input(event):
	if event.is_action_pressed("rewind"):
		rewind_action.emit()

func changeScene(scene):
	change_scene.emit(scene)
	pass
