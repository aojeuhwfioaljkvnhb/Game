extends AnimatedSprite2D


var player_in_range: bool = false


func _on_interact_body_entered(body):
	print("area entered")
	if body is CharacterBody2D:
		print("in range")
		player_in_range = true
		if body.has_node("interactlabel"):
			body.get_node("interactlabel").visible = true


func _on_interact_body_exited(body):
	print("area exited")
	player_in_range = false
	if body.has_node("interactlabel"):
			body.get_node("interactlabel").visible = false
