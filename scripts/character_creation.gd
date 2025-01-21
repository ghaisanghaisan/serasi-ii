extends Control

@onready var NamaInput: TextEdit = $"Panel2/HBoxContainer/MarginContainer/Fields/Nama Lengkap/LineEdit"
@onready var PanggilanInput: TextEdit = $"Panel2/HBoxContainer/MarginContainer/Fields/Nama Panggilan/LineEdit"
@onready var scene_transition_animation: AnimationPlayer = $SceneTransitionAnimation/AnimationPlayer
@onready var gambar: Panel = $Panel2/HBoxContainer/Avatar/gambar
@onready var kelas: OptionButton = $Panel2/HBoxContainer/MarginContainer/Fields/Kelas/HBoxContainer/Kelas
@onready var kelas_ab: OptionButton = $Panel2/HBoxContainer/MarginContainer/Fields/Kelas/HBoxContainer/KelasAb

const aspire = preload("res://resources/aspire.tres")
const serren = preload("res://resources/serren.tres")

func _on_submit_pressed() -> void:
	if NamaInput.text.length() == 0 || PanggilanInput.text.length() == 0:
		print("Bad form data")
		return;
	SerasiForm.set_answer(SerasiForm.Questions.Nama, NamaInput.text)
	SerasiForm.set_answer(SerasiForm.Questions.Panggilan, PanggilanInput.text)
	var kelas = kelas.text + kelas_ab.text
	SerasiForm.set_answer(SerasiForm.Questions.Kelas, kelas)
	
	
	scene_transition_animation.play("Fade_out")
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://scenes/levels/level_intro.tscn")


func _on_back_btn_button_down() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_aspire_pressed() -> void:
	gambar.add_theme_stylebox_override("panel", aspire)
	Globals.avatar = Globals.Avatar.Aspire


func _on_serren_pressed() -> void:
	gambar.add_theme_stylebox_override("panel", serren)
	Globals.avatar = Globals.Avatar.Serren
