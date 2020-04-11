extends Node2D

onready var animated_sprite = get_node("AnimatedSprite")

func _ready():
	animated_sprite.frame = 0
	animated_sprite.play("default")
