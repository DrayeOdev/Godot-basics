extends PlayerState

func enterState(PlayerNode, CameraNode) -> void:
	super(PlayerNode, CameraNode)
	if player.is_on_floor():
		player.velocity.y = player.jumpStr
	## NOTE: You can do a lot more than just this here, in the past i've had this script calculate a
	## custom jump height based on specific conditions. And of course you can do animation handling :D

func handleProcessState(_delta: float) -> void:
	if Input.get_vector("left", "right", "forward", "backward") != Vector2.ZERO: player.changeState("Movement")
	else: player.changeState("Idle")

func exitState() -> void:
	pass
	## NOTE: Exit state handling
