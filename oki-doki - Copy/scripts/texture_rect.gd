extends Panel

@onready var textbox = $"../Textbox"


func _process(delta):
	if textbox.riley_convo_3 == false:
		$".".modulate = Color(1, 1, 1, 1)
	else:
		$".".modulate = Color(1, 1, 1, 0.2)
