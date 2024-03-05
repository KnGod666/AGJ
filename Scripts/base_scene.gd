extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func change_scene(scene:PackedScene):
	#TODO scene transition
	#free prev scene
	$Level.get_child(0).queue_free()
	#instantiate new scene
	$Level.add_child(scene.instantiate())
	
	pass
