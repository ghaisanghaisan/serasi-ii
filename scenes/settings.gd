extends Control
@onready var bgm: CheckButton = $Panel2/MarginContainer/VBoxContainer/CheckButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bgm.button_pressed = GlobalAudio.playing


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_back_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	


func _on_check_button_toggled(toggled_on: bool) -> void:
	GlobalAudio.playing = toggled_on
	


func _on_menfess_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menfes.tscn")
