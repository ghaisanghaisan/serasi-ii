extends CanvasLayer

@onready var nama: Label = $Control/Profile/Profile/VBoxContainer/Nama
@onready var kelas: Label = $Control/Profile/Profile/VBoxContainer/Kelas
@onready var end_fade: ColorRect = $Control/EndFade


const MAX_NAME_LENGTH = 15;

func _ready() -> void:
	nama.text = SerasiForm.FormData["Nama"].substr(0, MAX_NAME_LENGTH)
	kelas.text = SerasiForm.FormData["Kelas"]


func _on_player_on_submit_or_win(player_pos: Vector2) -> void:
	var focus_tween = get_tree().create_tween();
	print("Fading into black")
	
	focus_tween.tween_property(end_fade, "color", Color(0,0,0,1), 3)
	focus_tween.tween_callback(func(): get_tree().change_scene_to_file("res://scenes/end_screen.tscn"))
