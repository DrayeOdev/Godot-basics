extends PlayerState

func enterState(PlayerNode, CameraNode) -> void:
	super(PlayerNode, CameraNode)

func handlePhysicsState(delta: float) -> void:
	## NOTE: Used to prevent the player from sliding off in a direction infinitely...
	player.velocity.x = move_toward(player.velocity.x, 0, player.decel * delta)
	player.velocity.z = move_toward(player.velocity.z, 0, player.decel * delta)

	if Input.get_vector("left", "right", "forward", "backward") != Vector2.ZERO: player.changeState("Movement")
	elif Input.is_action_just_pressed("jump"): player.changeState("Jumping")


func exitState() -> void:
	print("Leaving idle state")
	## NOTE: Once again you could handle transitions here. I would have stuff here but i dont have an animation!
