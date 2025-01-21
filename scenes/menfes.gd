extends Control

@onready var chatroom: VBoxContainer = $content/MarginContainer/VBoxContainer/ScrollContainer/Chatroom
@onready var menfes_input: TextEdit = $content/MarginContainer/VBoxContainer/HBoxContainer/MenfesInput
const chat_msg = preload("res://scenes/chat_msg.tscn")

@export var url = "https://temporal-notch-ambert.glitch.me"
# Called when the node enters the scene tree for the first time.
var http_get = HTTPRequest.new()
var http_post = HTTPRequest.new()
var chat = []

func _ready() -> void:
	add_child(http_get)
	add_child(http_post)
	http_get.request_completed.connect(self._http_request_completed)

	http_get.request(url + "/messages")

func render_chat():
	for child in chatroom.get_children():
		child.queue_free()
		
	for i in range(len(chat) - 1, -1, -1):
		var c = chat[i]
		var msg = chat_msg.instantiate()
		msg.get_child(0).text = c.message
		chatroom.add_child(msg)
		
# Called when the HTTP request is completed.
func _http_request_completed(result, response_code, headers, body):
	var json = JSON.new()
	json.parse(body.get_string_from_utf8())
	var response = json.get_data()
	
	var r = response['chat']
	chat = r.duplicate()
	print(chat)
	render_chat()
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_menfes_kirim_pressed() -> void:
	var msg = menfes_input.text
	if (len(msg) > 0):
		var headers = ["Content-Type: application/json", "admin_key: seemsthatourfateisparallelnevercrossingyetfrustatinglyclose"]
		var body = JSON.stringify({"message": msg})
		http_post.request(url + "/message", headers, HTTPClient.METHOD_POST, body)
		
		chat.append({"message": msg})
		render_chat()
		menfes_input.clear()
	


func _on_timer_timeout() -> void:
	print("Refreshing messages")
	if( http_get.can_process()):
		http_get.request(url + "/messages")
		


func _on_back_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
