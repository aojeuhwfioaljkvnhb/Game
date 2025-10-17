extends Area2D

@onready var textbox = $"../UI/Textbox"


func _process(_delta):
	if textbox.spawn_baby_oil == true:
		visible = true
	else:
		visible = false
	

func _on_body_entered(body):
		if body.name == "player" and textbox.spawn_baby_oil == true:
			queue_free()
			textbox.blake_convo_1 = true
			textbox.blake_convo_2 = true
			textbox.blake_convo_3 = false
			textbox.blake_delivered = true
