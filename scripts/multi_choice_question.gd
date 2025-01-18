extends Node

@export var question: SerasiForm.Questions; 

@onready var choices_nodes = [
	$MultiChoiceBlock1,
	$MultiChoiceBlock2,
	$MultiChoiceBlock3,
	$MultiChoiceBlock4
]
var choices_picked = [
	false,
	false,
	false,
	false
]

var child_n = 4

func _ready():
	print(SerasiForm.FormData[SerasiForm.Questions.keys()[question]])
	

func redraw_choices():
	for i in range(child_n):
		if(choices_picked[i]):
			choices_nodes[i].pick();
		else:
			choices_nodes[i].un_pick();


func pick_choice(index: int, choice: SerasiForm.MultiChoice):
	for i in range(child_n):
		choices_picked[i] = false
	choices_picked[index] = true
	redraw_choices()
	SerasiForm.set_multi_choice(question, choice);
	print(SerasiForm.FormData[SerasiForm.Questions.keys()[question]])
	
