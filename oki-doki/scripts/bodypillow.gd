extends Area2D

@onready var textbox = $"../UI/Textbox"

func _process(_delta):
	if textbox.bodypillow == true:
		visible = true
	else:
		visible = false
	

func _on_body_entered(body):
		if body.name == "player" and textbox.bodypillow == true:
			queue_free()
			textbox.alvyn_convo_1 = true
			textbox.alvyn_convo_2 = true
			textbox.alvyn_convo_3 = false
