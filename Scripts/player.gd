extends Node2D
class_name Player

var world: World

func _process(delta: float) -> void:
	if Input.is_action_pressed("moveUp"):
		world.checkMoveTile("up")
	elif Input.is_action_pressed("moveDown"):
		world.checkMoveTile("down")
	elif Input.is_action_pressed("moveLeft"):
		world.checkMoveTile("left")
	elif Input.is_action_pressed("moveRight"):
		world.checkMoveTile("right")
	elif Input.is_action_pressed("action"):
		world.checkMoveTile("action")
	elif Input.is_action_pressed("reset"):
		world.checkMoveTile("reset")
