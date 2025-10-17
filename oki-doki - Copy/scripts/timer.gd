extends CanvasLayer

@onready var textbox = $"../Textbox"

var time_elapsed := 0.0


func _process(delta):
	if textbox.items_delivered <= 7:
		time_elapsed += delta
		$TimerLabel.text = format_time(time_elapsed)


func format_time(seconds):
	var mins = int(seconds / 60)
	var secs = int(seconds) % 60
	var ms = int((seconds - int(seconds)) * 100)
	return "%02d:%02d.%02d" % [mins, secs, ms]
