extends Area2D

@onready var textbox = $"../UI/Textbox"


func _process(_delta):
	if textbox.spawn_usb == true:
		visible = true
	else:
		visible = false
	

func _on_body_entered(body):
		if body.name == "player" and textbox.spawn_usb == true:
			queue_free()
			textbox.dominick_convo_1 = true
			textbox.dominick_convo_2 = true
			textbox.dominick_convo_3 = false
			textbox.dominick_delivered = true
