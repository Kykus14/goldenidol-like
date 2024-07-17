class_name Slot
extends Button


enum Type {VERB, CONCEPT, NAME}
@export var type: Type
@export var correct_answer: String
var is_filled := false
var is_answer_correct := false
const verb_style = preload("res://resources/verb.tres")
const concept_style = preload("res://resources/concept.tres")
const name_style = preload("res://resources/things.tres")
var good_answer_count: int
signal correct
signal filled

func _ready():
	pressed.connect(_on_pressed)
	if type == Type.VERB:
		add_theme_stylebox_override("normal", verb_style)
		add_theme_stylebox_override("hover", verb_style)
	if type == Type.CONCEPT:
		add_theme_stylebox_override("normal", concept_style)
		add_theme_stylebox_override("hover", concept_style)
	if type == Type.NAME:
		add_theme_stylebox_override("normal", name_style)
		add_theme_stylebox_override("hover", name_style)
	good_answer_count = 0
		
func _can_drop_data(at_position, data):
	if data["type"] == type:
		return true

func _drop_data(at_position, data):
	text = data["text"]
	is_filled = true
	verify()
	
func _on_pressed():
	text = ""
	is_answer_correct = false
	is_filled = false
	verify()

func verify():
	if text == correct_answer:
		print("yes")
		is_answer_correct = true
		correct.emit()
	else:
		is_answer_correct = false
	verify_more()

func verify_more():
	if is_filled:
		Global.filled.emit()
	
		#for child in get_parent().get_children():
				#if child.text != "" and child.is_answer_correct == true:
					#good_answer_count += 1
					#print(good_answer_count)
					#if good_answer_count == 6:
						#print("THIS IS SOLVED")
					
