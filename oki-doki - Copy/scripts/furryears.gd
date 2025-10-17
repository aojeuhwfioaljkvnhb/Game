extends Area2D

@onready var textbox = $"../UI/Textbox"


func _process(_delta):
	if textbox.spawn_furry_ears == true:
		visible = true
	else:
		visible = false
	

func _on_body_entered(body):
		if body.name == "player" and textbox.spawn_furry_ears == true:
			queue_free()
			textbox.bennett_convo_1 = true
			textbox.bennett_convo_2 = true
			textbox.bennett_convo_3 = false
			textbox.bennett_delivered = true
