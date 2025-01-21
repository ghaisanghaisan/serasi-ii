extends Control
@onready var color_rect: ColorRect = $ColorRect


func _ready() -> void:
	var fade_tween = get_tree().create_tween()
	fade_tween.tween_property(color_rect, "color", Color(0,0,0,0), 2)


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menfes.tscn")
