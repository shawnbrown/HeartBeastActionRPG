extends KinematicBody2D

const ACCELERATION = 10
const MAX_SPEED = 100
const FRICTION = 10

var velocity = Vector2()
var input_vector = Vector2()

onready var animation_player = get_node("AnimationPlayer")

func _physics_process(_delta):
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")

	if input_vector != Vector2.ZERO:
		if input_vector.x > 0:
			animation_player.play("RunRight")
		else:
			animation_player.play("RunLeft")
		velocity = velocity.move_toward(input_vector.normalized() * MAX_SPEED, ACCELERATION)
	else:
		animation_player.play("IdleRight")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION)

	velocity = move_and_slide(velocity)
