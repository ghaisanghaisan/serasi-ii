extends Block

class_name MultiChoiceBlock

const EMPTY_BLOCK = preload("res://assets/Sprites/EmptyBlock.png")
const FILLED_BLOCK = preload("res://assets/Sprites/FilledBlock.png")
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var label: Label = $Label
@onready var index = get_index()

@export var choice: SerasiForm.MultiChoice = SerasiForm.MultiChoice.TidakBaik


func _ready() -> void:
	label.text = SerasiForm.MultiChoice.keys()[choice]
	

func bump():
	super.bump()
	print(index)
	get_parent().pick_choice(index, choice)
	
	
func pick():
	sprite_2d.texture = FILLED_BLOCK
	
func un_pick():
	sprite_2d.texture = EMPTY_BLOCK
