extends CanvasLayer

@onready var textbox = $"../Textbox"

var time_elapsed := 0.0
var running := true

func _process(delta):
	if running:
		time_elapsed += delta
		$TimerLabel.text = format_time(time_elapsed)
		if textbox.riley_done == true and textbox.andrew_done == true and textbox.dominick_done == true and textbox.blake_done == true and textbox.alvyn_done == true and textbox.braden_done == true and textbox.bennett_done == true:
			running = false
func format_time(seconds):
	var mins = int(seconds / 60)
	var secs = int(seconds) % 60
	var ms = int((seconds - int(seconds)) * 100)
	return "%02d:%02d.%02d" % [mins, secs, ms]
