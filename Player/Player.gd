extends KinematicBody2D

const ACCELERATION = 10
const MAX_SPEED = 100
const FRICTION = 10

enum {
	MOVE,
	ROLL,
	ATTACK
}

var state = MOVE
var velocity = Vector2()
var input_vector = Vector2()

onready var animation_player = get_node("AnimationPlayer")
onready var animation_tree = get_node("AnimationTree")
onready var state_machine = animation_tree.get("parameters/playback")

func _ready():
	animation_tree.active = true

func _physics_process(_delta):
	match state:
		MOVE:
			move_state()
		ROLL:
			pass
		ATTACK:
			attack_state()

func move_state():
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")

	if input_vector != Vector2.ZERO:
		input_vector = input_vector.normalized()
		animation_tree.set("parameters/Idle/blend_position", input_vector)
		animation_tree.set("parameters/Run/blend_position", input_vector)
		state_machine.travel("Run")
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION)
	else:
		state_machine.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION)

	velocity = move_and_slide(velocity)

	if Input.is_action_just_pressed("attack"):
		state = ATTACK

func attack_state():
	pass
