extends Area2D

@onready var textbox = $"../UI/Textbox"

func _process(_delta):
	if textbox.furryears == true:
		visible = true
	else:
		visible = false
	

func _on_body_entered(body):
		if body.name == "player" and textbox.furryears == true:
			queue_free()
			textbox.bennett_convo_1 = true
			textbox.bennett_convo_2 = true
			textbox.bennett_convo_3 = false
