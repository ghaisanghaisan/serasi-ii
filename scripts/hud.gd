extends CanvasLayer

@onready var nama: Label = $Control/Profile/Profile/VBoxContainer/Nama
@onready var kelas: Label = $Control/Profile/Profile/VBoxContainer/Kelas
@onready var end_fade: ColorRect = $Control/EndFade
@onready var score_label: Label = $Control/Score/MarginContainer/Label
@onready var avatar: Panel = $Control/Profile/avatar

const aspire = preload("res://resources/aspire.tres")
const serren = preload("res://resources/serren.tres")

const MAX_NAME_LENGTH = 15;

var score = Globals.score

func _ready() -> void:
	nama.text = SerasiForm.FormData["Nama"].substr(0, MAX_NAME_LENGTH)
	kelas.text = SerasiForm.FormData["Kelas"]
	score_label.text = "Skor: " + give_score_padding(score)
	
	match Globals.avatar:
		Globals.Avatar.Aspire:
			avatar.add_theme_stylebox_override("panel", aspire)
		Globals.Avatar.Serren:
			avatar.add_theme_stylebox_override("panel", serren)
			
	
	
func give_score_padding(s: int) -> String:
	var score_str = str(s)
	return score_str.pad_zeros(4)

func _on_player_on_submit_or_win(_player_pos: Vector2) -> void:
	var focus_tween = get_tree().create_tween();
	print("Fading into black")
	
	focus_tween.tween_property(end_fade, "color", Color(0,0,0,1), 3)
	focus_tween.tween_callback(func(): get_tree().change_scene_to_file("res://scenes/end_screen.tscn"))


func _on_player_points_scored(points: int) -> void:
	score += points
	score_label.text = "Skor: " + give_score_padding(score)


func _on_player_moving_levels() -> void:
	Globals.score = score
