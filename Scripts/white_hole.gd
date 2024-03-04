extends Node

@export var next_scene : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_white_hole_area_area_entered(area):
	if area.name == "PlayerColission":
		#play the black hole animation
		#change scene
		pass
	pass # Replace with function body.
