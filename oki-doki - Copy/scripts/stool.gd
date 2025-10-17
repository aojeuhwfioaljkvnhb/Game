extends Area2D

@onready var textbox = $"../UI/Textbox"


func _process(_delta):
	if textbox.spawn_stool == true:
		visible = true
	else:
		visible = false
	

func _on_body_entered(body):
		if body.name == "player" and textbox.spawn_stool == true:
			queue_free()
			textbox.andrew_convo_1 = true
			textbox.andrew_convo_2 = true
			textbox.andrew_convo_3 = false
			textbox.andrew_delivered = true
