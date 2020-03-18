extends KinematicBody2D

var velocity = Vector2.ZERO

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		velocity.x = 4
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -4
	else:
		velocity.x = 0

	move_and_collide(velocity)
