extends Node

@export var Sense: float = 0.001:
	set(senseVal):
		Sense = clamp(senseVal, 0, 0.1)
@export_range(1, 2.5) var movementTiltVal = 1.75

var TwistInput: float = 0.0
var PitchInput: float = 0.0
var player: Player

@onready var cam: Camera3D = %Cam
@onready var TwistPivot: Node3D = %TwistPivot
@onready var PitchPivot: Node3D = %PitchPivot

var cameraPosDif: Vector3
var CamPosDif: Vector3

func _ready() -> void:
	Signals.connect("PlayerMovementDirection", cameraTiltHandling)
	player = get_parent()
	CamPosDif = player.global_position - TwistPivot.global_position
	TwistPivot.top_level = true

func cameraTiltHandling(playerMovDir: Vector2):
	var tween: Tween = create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_SINE).set_parallel(true)
	tween.tween_property(cam, "rotation:z", deg_to_rad(movementTiltVal) * -playerMovDir.x, 0.2)
	tween.tween_property(cam, "rotation:x", deg_to_rad(movementTiltVal) * playerMovDir.y, 0.2)

func _process(_delta: float) -> void:
	TwistPivot.rotate_y(TwistInput)
	PitchPivot.rotate_x(PitchInput)
	PitchPivot.rotation.x = clamp(PitchPivot.rotation.x,
	deg_to_rad(-90),
	deg_to_rad(90))
	TwistInput = 0.0
	PitchInput = 0.0

	#region Camera Interpolation
	var interpolatedPos: Transform3D = player.get_global_transform_interpolated()
	var camPos: Vector3 = interpolatedPos.origin - CamPosDif
	TwistPivot.global_position = camPos
	#endregion

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion && Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		TwistInput = -event.relative.x * Sense
		PitchInput = - event.relative.y * Sense
