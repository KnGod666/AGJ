extends Camera2D

@export var player:Node2D
@onready var tilemap = $"../TileMap"
var exploration_mode = false
var locked = false
var move_direction = Vector2(0,0)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if exploration_mode and Rect2(tilemap.get_used_rect()).has_point((position+move_direction*delta*300)/100):
		position += move_direction*delta*300
	pass

func _input(event):
	if(exploration_mode):
		move_direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
		pass
	if(event.is_action_pressed("exploration_mode_togle") and not locked):
		exploration_mode = not exploration_mode
		if exploration_mode:
			player.lock_movement()
			locked = true
			create_tween().tween_property(self,"zoom", Vector2(0.5,0.5),0.2).finished.connect(unlock)
		else:
			player.unlock_movement()
			locked = true
			var tween = create_tween()
			tween.set_parallel(true)
			tween.tween_property(self,"zoom", Vector2(1,1),0.2).finished.connect(unlock)
			tween.tween_property(self,"position",player.position,0.2)
			pass
		pass
	pass

func unlock():
	locked = false
