extends Panel

@onready var textbox = $"../Textbox"

func _process(_delta):
	if textbox.dominick_convo_3 == false:
		$".".modulate = Color(1, 1, 1, 1)
	else:
		$".".modulate = Color(1, 1, 1, 0.2)
