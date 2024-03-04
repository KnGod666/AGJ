extends Node2D

signal tp_enabled

@export var player_node :Node2D
@onready var tp_probe = $TelepointChooser
var locked = false
var enabled = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if enabled and not player_node.dead:
		var i = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
		if i != Vector2(0,0) and not locked:
			#locked = true
			if i.x != 0 and i.y !=0:
				i.y = 0
				i.x = sign(i.x)
			position += i*100
			print(position)
				#create_tween().tween_property(self,"position",position+i*100,0.2).finished.connect(unlock)
			#else:
			#	locked = false
		if Input.is_action_pressed("TP_confirm"):
			var tp_list = []
			for x in range(-100,200,100):
				for y in range(-100,200,100):
					var pos = Vector2(x,y)
					var visible_space = get_viewport_rect()
					visible_space.position+=get_viewport().get_camera_2d().get_screen_center_position()-visible_space.size/2
					if visible_space.has_point(to_global(pos)):
						tp_probe.position = pos
						tp_probe.force_raycast_update()
						if not (tp_probe.is_colliding()):
							tp_list.push_back(Vector2(x,y))
						elif tp_probe.get_collider().name == "BlackHoleArea":
							player_node.position = to_global(Vector2(x,y))
							switch_enabled()
							return
						pass
			if tp_list.size() > 0:
				var tp_target = to_global(tp_list[randi_range(0,tp_list.size()-1)])
				#tp_target -= Vector2(50,50)
				player_node.position = tp_target
				switch_enabled()
	if(event.is_action_pressed("TP_enable")):
		switch_enabled()
	pass

func switch_enabled():
	position = Vector2(0,0)
	enabled = not enabled;
	visible = enabled
	tp_enabled.emit(enabled)
func unlock():
	locked = false
