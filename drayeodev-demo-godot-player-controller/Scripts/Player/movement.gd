extends PlayerState

@onready var twistPivot: Node3D = %TwistPivot
@onready var pitchPivot: Node3D = %PitchPivot

func enterState(PlayerNode, CameraNode) -> void:
	super(PlayerNode, CameraNode)

func handlePhysicsState(delta: float) -> void:
	var inputDir: Vector2 = Input.get_vector("left", "right", "forward", "backward")
	var direction: Vector3 = (twistPivot.basis * Vector3(inputDir.x, 0, inputDir.y)).normalized()
	Signals.emit_signal("PlayerMovementDirection", inputDir)
	if direction:
		player.velocity.x = move_toward(player.velocity.x, player.movSpeed * direction.x, player.accel * delta)
		player.velocity.z = move_toward(player.velocity.z, player.movSpeed * direction.z, player.accel * delta)
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, player.decel * delta)
		player.velocity.z = move_toward(player.velocity.z, 0, player.decel * delta)


	if !inputDir: player.changeState("Idle")
	elif Input.is_action_just_pressed("jump"): player.changeState("Jumping")

func exitState() -> void:
	print("Exiting state")
	## NOTE: You could play a transition animation here
