extends Control

@onready var NamaInput: LineEdit = $"Panel2/HBoxContainer/MarginContainer/Fields/Nama Lengkap/LineEdit"
@onready var PanggilanInput: LineEdit = $"Panel2/HBoxContainer/MarginContainer/Fields/Nama Panggilan/LineEdit"
@onready var KelasOption: OptionButton = $"Panel2/HBoxContainer/MarginContainer/Fields/Kelas/Kelas Pick"


func _on_submit_pressed() -> void:
	if KelasOption.get_selected_id() == 0:
		print("Form Fault")
		return;
	SerasiForm.set_answer(SerasiForm.Questions.Nama, NamaInput.text)
	SerasiForm.set_answer(SerasiForm.Questions.Panggilan, PanggilanInput.text)
	var kelas = SerasiForm.Kelas.keys()[KelasOption.get_selected_id() - 1]
	SerasiForm.set_answer(SerasiForm.Questions.Kelas, kelas)
	
	
	print(SerasiForm.FormData)