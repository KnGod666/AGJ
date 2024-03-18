extends Node2D

signal player_death
signal turn_played
var states_stack = []

@onready var animation_player = $AnimationPlayer
var dead = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func die():
	animation_player.play("death_by_black_hole")
	dead = true
	player_death.emit()
	pass

func turn_passed():
	save_state()
	turn_played.emit()

func save_state():
	if states_stack.size() >=127:
		states_stack.pop_front()
	states_stack.push_back([position,scale,rotation,dead,GlobalState.tp_left])
	pass

func restore_state():
	if not states_stack.is_empty():
		var state = states_stack.pop_back()
		$AnimationPlayer.play("RESET")
		#interpolate on these
		position = state[0]
		scale = state[1]
		rotation = state[2]
		dead = state[3]
		GlobalState.set_tp_left(state[4])

func lock_movement():
	$player_movement.locked = true

func unlock_movement():
	$player_movement.locked = false
