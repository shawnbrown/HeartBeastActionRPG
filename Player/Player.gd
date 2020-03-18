extends KinematicBody2D

var velocity = Vector2.ZERO

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		velocity.x = 10
	if Input.is_action_pressed("ui_left"):
		velocity.x = -10

	move_and_collide(velocity)
