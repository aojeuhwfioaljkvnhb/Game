extends Area2D

@onready var textbox = $"../UI/Textbox"


func _process(_delta):
	if textbox.spawn_leash == true:
		visible = true
	else:
		visible = false
	

func _on_body_entered(body):
		if body.name == "player" and textbox.spawn_leash == true:
			queue_free()
			textbox.riley_convo_1 = true
			textbox.riley_convo_2 = true
			textbox.riley_convo_3 = false
			textbox.riley_delivered = true
