extends Node2D

class_name Level

@onready var scene_transition_animation: AnimationPlayer = $SceneTransitionAnimation/AnimationPlayer

func _ready() -> void:
	scene_transition_animation.play("Fade_in")
