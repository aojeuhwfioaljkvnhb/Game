extends Area2D

@onready var textbox = $"../UI/Textbox"


func _process(_delta):
	if textbox.spawn_feet_finder == true:
		visible = true
	else:
		visible = false
	

func _on_body_entered(body):
		if body.name == "player" and textbox.spawn_feet_finder == true:
			queue_free()
			textbox.braden_convo_1 = true
			textbox.braden_convo_2 = true
			textbox.braden_convo_3 = false
			textbox.braden_delivered = true
