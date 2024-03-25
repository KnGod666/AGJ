extends Node2D

signal tp_enabled
signal player_moved

@export var player_node :Node2D
@onready var tp_probe = $TelepointChooser
var locked = false
var enabled = false
# Called when the node enters the scene tree for the first time.
func _ready():
	switch_enabled()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event is InputEventMouseMotion:
		var pos = get_global_mouse_position()
		pos = get_parent().to_local(floor((pos)/100)*100+Vector2(50,50))
		if position != pos:
			position  = pos
	if event is InputEventMouseButton and not locked:
		event = event as InputEventMouseButton
		if event.is_action_pressed("mouse_action"):
			tp_action()#debuguear bien fuerte
			pass
		pass

func tp_action():
	if GlobalState.tp_left > 0:
		var tp_list = []
		for x in range(-100,200,100):
			for y in range(-100,200,100):
				var pos = Vector2(x,y)
				var visible_space = get_viewport_rect()
				#tengo q revisar esto de aqui
				visible_space.position+=get_viewport().get_camera_2d().get_screen_center_position()-visible_space.size/2
				if visible_space.has_point(to_global(pos)):
					tp_probe.position = pos
					tp_probe.force_raycast_update()
					if not (tp_probe.is_colliding()):
						tp_list.push_back(pos)
					elif tp_probe.get_collider().name == "BlackHoleArea":
						tp_player(pos)
						return
					pass
		if tp_list.size() > 0:
			var tp_target = tp_list[randi_range(0,tp_list.size()-1)]
			#tp_target -= Vector2(50,50)
			tp_player(tp_target)

func tp_player(point):
	player_moved.emit()
	player_node.position = to_global(point)
	GlobalState.set_tp_left(GlobalState.tp_left-1)
	pass

func switch_enabled():
	position = Vector2(0,0)
	enabled = not enabled;
	visible = enabled
	#tp_enabled.emit(enabled)
func unlock():
	locked = false

func lock():
	locked = true
