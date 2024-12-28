extends CanvasLayer

@export var question: SerasiForm.Questions;
@export var kalimat_pertanyaan: String;
@onready var label: Label = $Control/ColorRect/MarginContainer/VBoxContainer/Label
@onready var text_edit: TextEdit = $Control/ColorRect/MarginContainer/VBoxContainer/TextEdit

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.text = kalimat_pertanyaan;


func _on_button_pressed() -> void:
	visible = false;
	get_node("%Player").enable_movement()
	
	SerasiForm.set_answer(question, text_edit.text)
