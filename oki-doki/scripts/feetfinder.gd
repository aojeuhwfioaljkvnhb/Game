extends Area2D

@onready var textbox = $"../UI/Textbox"

func _process(_delta):
	if textbox.feetfinder == true:
		visible = true
	else:
		visible = false
	

func _on_body_entered(body):
		if body.name == "player" and textbox.feetfinder == true:
			queue_free()
			textbox.braden_convo_1 = true
			textbox.braden_convo_2 = true
			textbox.braden_convo_3 = false
