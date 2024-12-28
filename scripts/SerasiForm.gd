extends Node

var FormData =  {
  "Nama": null,
  "Kelas": null,
  "FasilitasA": null,
  "FasilitasB": null,
  "FasilitasC": null,
  "KBMA": null,
  "KBMB": null,
  "KinerjaA": null,
  "KinerjaB": null,
  "KinerjaC": null,
  "EkskulA": null,
  "EkskulB": null
}


enum MultiChoice {
	TidakBaik,
	KurangBaik,
	Baik,
	SangatBaik
}
enum Questions {
	Nama,
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

var url = "https://localhost:8080/Aspirasi/post"

func submit():
	var body = JSON.stringify(FormData)
	var headers = ["Content-Type: application/json"]
	$HTTPRequest.request(url, headers, HTTPClient.METHOD_POST, body)

func set_answer(question: Questions, answer: String):
	var q = Questions.keys()[question]
	FormData[q] = answer
	
	print(FormData)
	
func set_multi_choice(question: Questions, answer: MultiChoice): 
	var q = Questions.keys()[question]
	var a = MultiChoice.keys()[answer]
	
	FormData[q] = a;
	
	print(FormData)
