extends HFlowContainer
@onready var label = $"../Label"
var answers := {"HENRY": 0, "DETECTIVE": 0, "CASE": 0, "CLUES": 0, "MURDER": 0, "SOLVE":0}
var list := []
var list2 := []
@onready var color_rect = $"../../ColorRect"
@onready var label_3 = $"../Label3"

@onready var label_2 = $"../Label2"


func _ready() -> void:
	color_rect.hide()
	label_2.hide()
	label_3.hide()
	get_child(1).correct.connect(adding1)
	get_child(3).correct.connect(adding2)
	get_child(5).correct.connect(adding3)
	get_child(7).correct.connect(adding4)
	get_child(10).correct.connect(adding5)
	get_child(12).correct.connect(adding6)
	get_child(1).incorrect.connect(removing1)
	get_child(3).incorrect.connect(removing2)
	get_child(5).incorrect.connect(removing3)
	get_child(7).incorrect.connect(removing4)
	get_child(10).incorrect.connect(removing5)
	get_child(12).incorrect.connect(removing6)
	get_child(1).empty.connect(empty1)
	get_child(3).empty.connect(empty2)
	get_child(5).empty.connect(empty3)
	get_child(7).empty.connect(empty4)
	get_child(10).empty.connect(empty5)
	get_child(12).empty.connect(empty6)
	
func adding1() -> void:
	answers["HENRY"] = 2
	verify()
func removing1():
	answers["HENRY"] = 1
	verify()
func empty1() -> void:
	answers["HENRY"] = 0
	verify()
func adding2() -> void:
	answers["DETECTIVE"] = 2
	verify()
func removing2() -> void:
	answers["DETECTIVE"] = 1
	verify()
func empty2() -> void:
	answers["DETECTIVE"] = 0
	verify()
func adding3() -> void:
	answers["CASE"] = 2
	verify()
func removing3() -> void:
	answers["CASE"] = 1
	verify()
func empty3() -> void:
	answers["CASE"] = 0
	verify()
func adding4() -> void:
	answers["CLUES"] = 2
	verify()
func removing4() -> void:
	answers["CLUES"] = 1
	verify()
func empty4() -> void:
	answers["CLUES"] = 0
	verify()
func adding5() -> void:
	answers["MURDER"] = 2
	verify()
func removing5() -> void:
	answers["MURDER"] = 1
	verify()
func empty5() -> void:
	answers["MURDER"] = 0
	verify()
func adding6() -> void:
	answers["SOLVE"] = 2
	verify()
func removing6() -> void:
	answers["SOLVE"] = 1
	verify()
func empty6() -> void:
	answers["SOLVE"] = 0
	verify()

func verify() -> void:
	if answers.values().count(2) == 6:
		label_2.hide()
		color_rect.show()
		label_3.hide()
		Global.solved.emit()
	elif answers.values().count(2) == 5 and !answers.values().has(0):
		label_2.show()		
		color_rect.hide()
		label_3.hide()
	elif answers.values().count(2) == 4 and !answers.values().has(0):
		label_2.hide()		
		color_rect.hide()
		label_3.show()
	if answers.values().has(0):
		label_2.hide()		
		color_rect.hide()
		label_3.hide()
