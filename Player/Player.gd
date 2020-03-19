extends KinematicBody2D

const ACCELERATION = 10
const MAX_SPEED = 100
const FRICTION = 10

var velocity = Vector2.ZERO
var x = 0.0
var y = 0.0

func _physics_process(delta):
	x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")

	if x or y:
		velocity = velocity.move_toward(Vector2(x, y).normalized() * MAX_SPEED, ACCELERATION)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION)

	velocity = move_and_slide(velocity)
