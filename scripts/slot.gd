class_name Slot
extends Button


enum Type {VERB, CONCEPT, NAME}
@export var type: Type
@export var correct_answer: String
const verb_style = preload("res://resources/verb.tres")
const concept_style = preload("res://resources/concept.tres")
const name_style = preload("res://resources/things.tres")
signal correct
signal incorrect
signal empty

func _ready() -> void:
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
		
func _can_drop_data(at_position, data):
	if data["type"] == type:
		return true

func _drop_data(at_position, data):
	text = data["text"]
	verify()
	
func _on_pressed():
	text = ""
	empty.emit()
	verify()

func verify() -> void:
	if text == correct_answer:
		correct.emit()
	elif text != "":
		incorrect.emit()
