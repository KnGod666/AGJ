extends Node2D

signal player_death

@onready var animation_player = $AnimationPlayer
var dead = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func die():
	animation_player.play("deat_by_black_hole")
	dead = true
	player_death.emit()
	pass
