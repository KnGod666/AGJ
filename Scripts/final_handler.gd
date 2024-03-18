extends Node
@onready var player = $"../Player"
@onready var label = $"../Camera2D/CanvasLayer/Label"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player.modulate.a > 0:
		player.modulate.a -=delta/10
		if player.modulate.a <= 0 and label.modulate.a < 255:
			create_tween().tween_property(label,"modulate",label.modulate+Color(0,0,0,1),3).finished.connect(tweenEnd)
			pass
	pass

func tweenEnd():
	var endClock = get_tree().create_timer(1)
	endClock.timeout.connect(get_tree().quit)
	pass
