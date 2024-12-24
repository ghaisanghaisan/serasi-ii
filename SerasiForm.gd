extends Node

var form_data = {
	"Nama": "Charlie",
	"Kelas": "12C",
	"FasilitasA": "Gym",
	"FasilitasB": "Science Lab",
	"FasilitasC": "Auditorium",
	"KBMA": "Debate Team",
	"KBMB": "Math Olympiad",
	"KinerjaA": "Average",
	"KinerjaB": "Good",
	"KinerjaC": "Excellent",
	"EkskulA": "Soccer",
	"EkskulB": "Volleyball"
 }

func set_field(field: String, value: String):
	form_data[field] = value
