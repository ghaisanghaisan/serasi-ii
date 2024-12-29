@tool
extends ItemList


func _ready() -> void:
	for kelas in SerasiForm.Kelas:
		add_item(String(kelas))
