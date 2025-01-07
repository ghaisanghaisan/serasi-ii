extends Node

var FormData =  {
  "Nama": "Danish",
  "Panggilan": "Ghaisan",
  "Kelas": "XA",
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

var url = "localhost:8080"

func submit():
	var body = JSON.stringify(FormData)
	var headers = ["Content-Type: application/json"]
	print(body)

func set_answer(question: Questions, answer: String):
	var q = Questions.keys()[question]
	FormData[q] = answer
	
	
func set_multi_choice(question: Questions, answer: MultiChoice): 
	var q = Questions.keys()[question]
	var a = MultiChoice.keys()[answer]
	
	FormData[q] = a;
	
