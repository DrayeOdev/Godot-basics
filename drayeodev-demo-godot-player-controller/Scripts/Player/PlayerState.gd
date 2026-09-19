extends Node
class_name PlayerState

var player: Player
var cam: Node

func enterState(PlayerNode, CameraNode) -> void:
	player = PlayerNode
	cam = CameraNode

func handlePhysicsState(delta: float) -> void:
	pass

func handleProcessState(delta: float) -> void:
	pass

func exitState() -> void:
	pass
