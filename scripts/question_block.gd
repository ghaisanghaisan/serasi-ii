extends Block 

@export var question_ui: Node;


func bump():
	super.bump()
	
	question_ui.visible = true;
	get_node("%Player").disable_movement()
