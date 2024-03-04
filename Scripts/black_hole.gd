extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_area_entered(area):
	if area.name == "PlayerColission":
		get_tree().create_timer(0.2).connect("timeout", Callable(area.get_parent(),"die"))
		
		pass
	pass # Replace with function body.
