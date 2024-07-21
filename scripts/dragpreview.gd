extends Label
class_name Preview

const verb_style = preload("res://resources/verb.tres")
const concept_style = preload("res://resources/concept.tres")
const name_style = preload("res://resources/things.tres")

func _ready() -> void:
	if get_parent().type == get_parent().Type.VERB:
		add_theme_stylebox_override("normal", verb_style)
		add_theme_stylebox_override("hover", verb_style)
	if get_parent().type == get_parent().Type.CONCEPT:
		add_theme_stylebox_override("normal", concept_style)
		add_theme_stylebox_override("hover", concept_style)
	if get_parent().type == get_parent().Type.NAME:
		add_theme_stylebox_override("normal", name_style)
		add_theme_stylebox_override("hover", name_style)
	
	var tween = get_tree().create_tween()
	tween.tween_property(self, "rotation_degrees", 15.0, 1).set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_OUT)
	
func _process(delta) -> void:
	global_position = get_global_mouse_position()
	if Input.is_action_just_released("left_click"):
		queue_free()
		
