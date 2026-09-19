extends CharacterBody3D
class_name Player

#region Stats
@export_range(1, 15) var movSpeed: float = 6
@export_range(1, 100) var accel: float = 15
@export_range(1, 100) var decel: float = 14.5
@export_range(1, 10) var jumpStr: float = 6.5

#endregion


var currentState: PlayerState
@onready var camera: Node = $Camera ## NOTE: You could also use player.camera to access this node
									## in your FSM code but its a tad messy

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	changeState("Movement")

func changeState(newStateName: String) -> void:
	if currentState: currentState.exitState()
	currentState = get_node(newStateName)
	if currentState: currentState.enterState(self, camera) ## NOTE: Gives reference to the player and camera nodes.

func _physics_process(delta: float) -> void:
	print(velocity)
	if !is_on_floor(): velocity += get_gravity() * delta
	if currentState: currentState.handlePhysicsState(delta) ## NOTE: Calls the custom Physics process
	move_and_slide()

func _process(delta: float) -> void:
	if currentState: currentState.handleProcessState(delta) ## NOTE: Calls the custom process state

func _unhandled_key_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("escape") && Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	elif Input.is_action_just_pressed("escape") && Input.get_mouse_mode() == Input.MOUSE_MODE_VISIBLE:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
