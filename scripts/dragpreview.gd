extends Label

const verb_style = preload("res://resources/verb.tres")
const concept_style = preload("res://resources/concept.tres")
const name_style = preload("res://resources/things.tres")

func _ready():
	if get_parent().type == get_parent().Type.VERB:
		add_theme_stylebox_override("normal", verb_style)
		add_theme_stylebox_override("hover", verb_style)
	if get_parent().type == get_parent().Type.CONCEPT:
		add_theme_stylebox_override("normal", concept_style)
		add_theme_stylebox_override("hover", concept_style)
	if get_parent().type == get_parent().Type.NAME:
		add_theme_stylebox_override("normal", name_style)
		add_theme_stylebox_override("hover", name_style)
	
func _process(delta):
	global_position = get_global_mouse_position()
	if Input.is_action_just_released("left_click"):
		queue_free()
		
