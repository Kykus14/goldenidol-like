extends Label
@onready var label = $"../Label"

func _ready():
	Global.filled.connect(verify)
	label.hide()

func _process(delta):
	pass
	
func verify():
	print("received")
	if (
		get_child(0).text == "HENRY" 
		and 
		get_child(1).text == "DETECTIVE" 
		and 
		get_child(2).text == "CASE" 
		and 
		get_child(3).text == "CLUES" 
		and 
		get_child(4).text == "MURDER"
		and 
		get_child(5).text == "SOLVE"
		):
		print("ALL CORRECT")
		label.show()
		
	#Global.correct.connect(verify)
	#Global.filled.connect(verify)
	#
#func verify():
	#for child in get_children():
		#if slot.is_answer_correct == true:
			#good_answer_count += 1
			#print(good_answer_count)
#FOR CHILD IN CHILDREN
	#IF CORRECT ANSWER: +1

#IF TOTAL = NUMBER OF CHILDREN:
	#YOU WIN
	
#IF TOTAL = LESS:
	#ONE IS INCORRECT
