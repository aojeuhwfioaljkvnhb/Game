extends Control


func _ready():
	pass

func _process(_delta):
	pass


func _on_button1_pressed():
	get_tree().change_scene_to_file("res://scenes/scene.tscn")


func _on_button2_pressed():
	get_tree().change_scene_to_file("res://scenes/options.tscn")


func _on_button3_pressed():
	get_tree().quit()
