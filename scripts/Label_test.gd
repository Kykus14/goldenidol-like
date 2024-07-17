extends Label

enum Type {VERB, CONCEPT, NAME}
@export var type: Type
@export var DragPreview: PackedScene
const verb_style = preload("res://resources/verb.tres")
const concept_style = preload("res://resources/concept.tres")
const name_style = preload("res://resources/things.tres")

func _ready():
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)
	
	if type == Type.VERB:
		add_theme_stylebox_override("normal", verb_style)
		add_theme_stylebox_override("hover", verb_style)
	if type == Type.CONCEPT:
		add_theme_stylebox_override("normal", concept_style)
		add_theme_stylebox_override("hover", concept_style)
	if type == Type.NAME:
		add_theme_stylebox_override("normal", name_style)
		add_theme_stylebox_override("hover", name_style)
		
func _get_drag_data(position: Vector2):
	var data = {}
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
	
func _on_mouse_entered():
	var sizetween = get_tree().create_tween()
	pivot_offset = Vector2(size.x/2, size.y/2)
	sizetween.tween_property(self, "scale", Vector2(1.2,1.2), 0.07).set_trans(Tween.TRANS_BOUNCE)
	sizetween.tween_property(self, "scale", Vector2(1.1,1.1), 0.07).set_trans(Tween.TRANS_BOUNCE)

func _on_mouse_exited():
	var sizetween = get_tree().create_tween()
	sizetween.tween_property(self, "scale", Vector2(1,1), 0.07).set_trans(Tween.TRANS_ELASTIC)
