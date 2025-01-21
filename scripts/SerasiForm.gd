extends Node

var FormData =  {
  "Nama": "Danish",
  "Panggilan": "Ghaisan",
  "Kelas": "XA",
  "FasilitasA": "",
  "FasilitasB": "",
  "FasilitasC": "",
  "KBMA": "",
  "KBMB": "",
  "KinerjaA": "",
  "KinerjaB": "",
  "KinerjaC": "",
  "EkskulA": "",
  "EkskulB": ""
}

enum Kelas {
	# X – A to H
	XA, XB, XC, XD, XE, XF, XG, XH,

	# XI – A to H
	XIA, XIB, XIC, XID, XIE, XIF, XIG, XIH,

	# XII – A to H
	XIIA, XIIB, XIIC, XIID, XIIE, XIIF, XIIG, XIIH
}


enum MultiChoice {
	TidakBaik,
	KurangBaik,
	Baik,
	SangatBaik
}
enum Questions {
	Nama,
	Panggilan,
	Kelas,
	FasilitasA,
	FasilitasB,
	FasilitasC,
	KBMA,
	KBMB,
	KinerjaA,
	KinerjaB,
	KinerjaC,
	EkskulA,
	EkskulB
}

var url = "https://script.google.com/macros/s/AKfycbzlkIUAjWJIycrAm9N9FJUHeKCbTvf7HTYCFceRoiazcmh0X_zoFhSWbit0UOxgs3Iy/exec"
#var url = "http://localhost:8080/Aspirasi/post"
var HTTPNode = HTTPRequest.new()

func _ready():
	add_child(HTTPNode)

func submit():
	var body = JSON.stringify(FormData)
	var headers = ["Content-Type: application/json"]
	HTTPNode.request(url, headers, HTTPClient.METHOD_POST, body)
	print(body)

func set_answer(question: Questions, answer: String):
	var q = Questions.keys()[question]
	FormData[q] = answer
	
	
func set_multi_choice(question: Questions, answer: MultiChoice): 
	var q = Questions.keys()[question]
	var a = MultiChoice.keys()[answer]
	
	FormData[q] = a;
	
