extends Node2D

signal moved

@export var player_node :Node2D
@onready var raycast = $"../RayCast2D"
var locked = false
var enabled = true
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
			locked = true
			$"../TpTool".lock()
			if i.x != 0 and i.y !=0:
				i.y = 0
			raycast.target_position = i*100
			raycast.force_raycast_update()
			if not raycast.is_colliding():
				moved.emit()
				player_node.create_tween().tween_property(player_node,"position",player_node.position+i*100,0.2).finished.connect(movement_made)
			else:
				locked = false
				$"../TpTool".unlock()
	pass

func movement_made():
	unlock()
	$"../TpTool".unlock()
	pass

func unlock():
	var sup = sign(player_node.position)*50
	player_node.position = floor((player_node.position)/100)*100+Vector2(50,50)
	locked = false


func _on_tp_tool_tp_enabled(enabled):
	self.enabled = not enabled	#could give trouble in the future if set during movement
	pass # Replace with function body.
