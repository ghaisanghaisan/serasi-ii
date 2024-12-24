extends Node

@export var url = "http://localhost:8080/Aspirasi/post"

func submit_form() -> void:
	var body = JSON.stringify(SerasiForm.form_data)
	var headers = ["Content-Type: application/json"]
	$HTTPRequest.request(url, headers, HTTPClient.METHOD_POST, body)
