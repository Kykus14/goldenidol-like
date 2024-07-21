class_name Draggable
extends Button

enum Type {VERB, CONCEPT, NAME, BLANK}
@export var type: Type
@export var DragPreview: PackedScene

const verb_style = preload("res://resources/verb.tres")
const concept_style = preload("res://resources/concept.tres")
const name_style = preload("res://resources/things.tres")
const blank_style = preload("res://resources/blank.tres")
const FONT = preload("res://resources/font.tres")

var sizetween: Tween

func _ready():
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)
	

	await get_tree().create_timer(0.1).timeout
	if type == Type.VERB:
		add_theme_stylebox_override("normal", verb_style)
		add_theme_stylebox_override("hover", verb_style)
		add_to_group("verb")
	if type == Type.CONCEPT:
		add_theme_stylebox_override("normal", concept_style)
		add_theme_stylebox_override("hover", concept_style)
		add_to_group("concept")
	if type == Type.NAME:
		add_theme_stylebox_override("normal", name_style)
		add_theme_stylebox_override("hover", name_style)
		add_to_group("name")
	if type == Type.BLANK:
		add_theme_stylebox_override("normal", blank_style)
		add_theme_stylebox_override("hover", blank_style)
		add_theme_stylebox_override("pressed", blank_style)
		add_to_group("blank_verb")
	var label = Label.new()
	if type != Type.BLANK:
		label.text = text
		label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		label.label_settings = FONT
		label.set_anchors_preset(Control.PRESET_FULL_RECT)
		add_child(label)
		
func _get_drag_data(position: Vector2):
	var data = {}
	if type != Type.BLANK:
		data["text"] = get_child(0).text
		data["type"] = type
		
		var drag_prev = DragPreview.instantiate()
		drag_prev.text = get_child(0).text
		add_child(drag_prev)
		
		return data
			
func _can_drop_data(at_position, data):
	return true
	
func _drop_data(at_position, data):
	return true

func start_tween():
	if sizetween:
		sizetween.kill()
		
	sizetween = get_tree().create_tween()
		
	
func _on_mouse_entered():
	if get_theme_stylebox("normal") != blank_style:
		start_tween()
		pivot_offset = Vector2(size.x/2, size.y/2)
		sizetween.tween_property(self, "scale", Vector2(1.2,1.2), 0.08).set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_IN_OUT)
		sizetween.tween_property(self, "scale", Vector2(1.1,1.1), 0.05).set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_IN_OUT)

func _on_mouse_exited():
	if StyleBox != blank_style:
		start_tween()
		#var sizetween = get_tree().create_tween()
		sizetween.tween_property(self, "scale", Vector2(1,1), 0.08).set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_IN_OUT)
