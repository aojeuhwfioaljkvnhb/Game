extends CanvasLayer

const CHAR_READ_RATE = 0.05

@onready var textbox_container = $"Textbox Container"
@onready var start_symbol = $"Textbox Container/MarginContainer/HBoxContainer/Start"
@onready var end_symbol = $"Textbox Container/MarginContainer/HBoxContainer/End"
@onready var label = $"Textbox Container/MarginContainer/HBoxContainer/Label"
@onready var riley = $"../../riley"
@onready var andrew = $"../../andrew"
@onready var dominick = $"../../dominick"
@onready var blake = $"../../blake"
@onready var alvyn = $"../../alvyn"
@onready var braden = $"../../braden"
@onready var bennett = $"../../bennett"
@onready var player = $"../../player"

# Conversation flags
var riley_convo_1: bool = false
var riley_convo_2: bool = true
var riley_convo_3: bool = true
var andrew_convo_1: bool = false
var andrew_convo_2: bool = true
var andrew_convo_3: bool = true
var dominick_convo_1: bool = false
var dominick_convo_2: bool = true
var dominick_convo_3: bool = true
var blake_convo_1: bool = false
var blake_convo_2: bool = true
var blake_convo_3: bool = true
var alvyn_convo_1: bool = false
var alvyn_convo_2: bool = true
var alvyn_convo_3: bool = true
var braden_convo_1: bool = false
var braden_convo_2: bool = true
var braden_convo_3: bool = true
var bennett_convo_1: bool = false
var bennett_convo_2: bool = true
var bennett_convo_3: bool = true

# Item posession flags
var riley_delivered: bool = false
var andrew_delivered: bool = false
var dominick_delivered: bool = false
var blake_delivered: bool = false
var alvyn_delivered: bool = false
var braden_delivered: bool = false
var bennett_delivered: bool = false

# Item spawn flags
var spawn_leash: bool = false
var spawn_stool: bool = false
var spawn_usb: bool = false
var spawn_baby_oil: bool = false
var spawn_body_pillow: bool = false
var spawn_feet_finder: bool = false
var spawn_furry_ears: bool = false

# Items delivered counter
var items_delivered: int = 0

enum State {
	READY,
	READING,
	FINISHED
}

var current_state = State.READY
var text_queue = []

# Conversation Listing

func _ready():
	print("Starting state: State.READY")
	hide_textbox()
	queue_text("...")


func _process(_delta):
	# Riley Conversation
	if riley.player_in_range == true and Input.is_action_pressed("Interact"):
		
		if riley_convo_1 == false and riley_convo_3 == true:
			text_queue.clear()
			queue_text("Hey excuse me, can you find me a dog leash?  -  Riley")
			queue_text("What do you need that for? Do you have a dog?  -  Player")
			queue_text("Nope!  -  Riley")
			queue_text("...  -  Player")
			
			riley_convo_1 = true
			spawn_leash = true
		
		if riley_convo_2 == false and riley_convo_3 == true:
			text_queue.clear()
			queue_text("I really need that dog leash!  -  Riley")
			
		if riley_convo_3 == false:
			text_queue.clear()
			queue_text("Thanks so much! I can finally ropeplay with Braden :D  -  Riley")
			queue_text("Bro... [ This guy has issues ]  -  Player")
			if riley_delivered == false:
				items_delivered += 1
				riley_delivered = true
			
		match current_state:
			State.READY:
				if text_queue and Input.is_action_just_pressed("Interact"):
					display_text()
			State.READING:
				end_symbol.text = "v"
				change_state(State.FINISHED)
			State.FINISHED:
				if Input.is_action_just_pressed("Interact"):
					player.move = true
					change_state(State.READY)
					if text_queue.is_empty():
						hide_textbox()
						if riley_convo_3 == true:
							riley_convo_2 = false
					elif riley_convo_2 == false or riley_convo_3 == false:
						hide_textbox()
					else:
						display_text()
		
	# Andrew Conversation
	if andrew.player_in_range == true:
		
		if andrew_convo_1 == false and andrew_convo_3 == true:
			text_queue.clear()
			queue_text("I am mad short, so I need a stepping stool  -  Andrew")
			queue_text("Honestly it's shocking how short you are  -  Player")
			queue_text(":(  -  Andrew")
			
			andrew_convo_1 = true
			spawn_stool = true
		
		if andrew_convo_2 == false and andrew_convo_3 == true:
			text_queue.clear()
			queue_text(":(((((((  -  Andrew")
			
		if andrew_convo_3 == false:
			text_queue.clear()
			queue_text("Yippeeeee  -  Andrew")
			queue_text("[ Someones excited... ]  -  Player")
			if andrew_delivered == false:
				items_delivered += 1
				andrew_delivered = true
		
		match current_state:
			State.READY:
				if text_queue and Input.is_action_just_pressed("Interact"):
					display_text()
			State.READING:
				end_symbol.text = "v"
				change_state(State.FINISHED)
			State.FINISHED:
				if Input.is_action_just_pressed("Interact"):
					player.move = true
					change_state(State.READY)
					if text_queue.is_empty():
						hide_textbox()
						if andrew_convo_3 == true:
							andrew_convo_2 = false
					elif andrew_convo_2 == false or andrew_convo_3 == false:
						hide_textbox()
					else:
						display_text()
	
	# Dominick Conversation
	if dominick.player_in_range == true and Input.is_action_pressed("Interact"):
		
		if dominick_convo_1 == false and dominick_convo_3 == true:
			text_queue.clear()
			queue_text("Yo the opps are on me!  -  Dominick")
			queue_text("How can I help?  -  Player")
			queue_text("Gimme a data clearer thingy  -  Dominick")
			
			dominick_convo_1 = true
			spawn_usb = true
		
		if dominick_convo_2 == false and dominick_convo_3 == true:
			text_queue.clear()
			queue_text("Mate im waiting  -  Dominick")
			
		if dominick_convo_3 == false:
			text_queue.clear()
			queue_text("Shots bro, I owe you one  -  Dominick")
			queue_text("Sure no problem  -  Player")
			if dominick_delivered == false:
				items_delivered += 1
				dominick_delivered = true
			
		match current_state:
			State.READY:
				if text_queue and Input.is_action_just_pressed("Interact"):
					display_text()
			State.READING:
				end_symbol.text = "v"
				change_state(State.FINISHED)
			State.FINISHED:
				if Input.is_action_just_pressed("Interact"):
					player.move = true
					change_state(State.READY)
					if text_queue.is_empty():
						hide_textbox()
						if dominick_convo_3 == true:
							dominick_convo_2 = false
					elif dominick_convo_2 == false or dominick_convo_3 == false:
						hide_textbox()
					else:
						display_text()
		
	# Blake Conversation
	if blake.player_in_range == true and Input.is_action_pressed("Interact"):
		
		if blake_convo_1 == false and blake_convo_3 == true:
			text_queue.clear()
			queue_text("Hey im kinda missing a key asset  -  Blake")
			queue_text("What does that mean?  -  Player")
			queue_text("... Just get me the baby oil  -  Blake")
			
			blake_convo_1 = true
			spawn_baby_oil = true
		
		if blake_convo_2 == false and blake_convo_3 == true:
			text_queue.clear()
			queue_text("QUICKLY AHHHHH  -  Blake")
			
		if blake_convo_3 == false:
			text_queue.clear()
			queue_text("Good choice, you don't want to see my dark side...  -  Blake")
			queue_text("Sure... [ What does he plan to do ]  -  Player")
			if blake_delivered == false:
				items_delivered += 1
				blake_delivered = true
			
		match current_state:
			State.READY:
				if text_queue and Input.is_action_just_pressed("Interact"):
					display_text()
			State.READING:
				end_symbol.text = "v"
				change_state(State.FINISHED)
			State.FINISHED:
				if Input.is_action_just_pressed("Interact"):
					player.move = true
					change_state(State.READY)
					if text_queue.is_empty():
						hide_textbox()
						if blake_convo_3 == true:
							blake_convo_2 = false
					elif blake_convo_2 == false or blake_convo_3 == false:
						hide_textbox()
					else:
						display_text()
		
	# Alvyn Conversation
	if alvyn.player_in_range == true and Input.is_action_pressed("Interact"):
		
		if alvyn_convo_1 == false and alvyn_convo_3 == true:
			text_queue.clear()
			queue_text("Look, im not feeling it right now...  -  Alvyn")
			queue_text("Not feeling what exactly?  -  Player")
			queue_text("Im missing something bro, can you find it?  -  Alvyn")
			queue_text("Im sure its something normal  -  Player")
			
			alvyn_convo_1 = true
			spawn_body_pillow = true
		
		if alvyn_convo_2 == false and alvyn_convo_3 == true:
			text_queue.clear()
			queue_text("I kinda need my pillow...  -  Alvyn")
			
		if alvyn_convo_3 == false:
			text_queue.clear()
			queue_text("Aye wait thats not mine... Kianavi? *takes it*  -  Alvyn")
			queue_text("Weirdo.  -  Player")
			if alvyn_delivered == false:
				items_delivered += 1
				alvyn_delivered = true
			
		match current_state:
			State.READY:
				if text_queue and Input.is_action_just_pressed("Interact"):
					display_text()
			State.READING:
				end_symbol.text = "v"
				change_state(State.FINISHED)
			State.FINISHED:
				if Input.is_action_just_pressed("Interact"):
					player.move = true
					change_state(State.READY)
					if text_queue.is_empty():
						hide_textbox()
						if alvyn_convo_3 == true:
							alvyn_convo_2 = false
					elif alvyn_convo_2 == false or alvyn_convo_3 == false:
						hide_textbox()
					else:
						display_text()
		
	# Braden Conversation
	if braden.player_in_range == true and Input.is_action_pressed("Interact"):
		
		if braden_convo_1 == false and braden_convo_3 == true:
			text_queue.clear()
			queue_text("Look im interested in starting a business  -  Braden")
			queue_text("What kind of business?  -  Player")
			queue_text("The feet kind...  -  Braden")
			
			braden_convo_1 = true
			spawn_feet_finder = true
		
		if braden_convo_2 == false and braden_convo_3 == true:
			text_queue.clear()
			queue_text("I need that app gng  -  Braden")
			
		if braden_convo_3 == false:
			text_queue.clear()
			queue_text("Lets goo, I can finally sell the pics  -  Braden")
			queue_text("I might sign up honestly  -  Player")
			if braden_delivered == false:
				items_delivered += 1
				braden_delivered = true
			
		match current_state:
			State.READY:
				if text_queue and Input.is_action_just_pressed("Interact"):
					display_text()
			State.READING:
				end_symbol.text = "v"
				change_state(State.FINISHED)
			State.FINISHED:
				if Input.is_action_just_pressed("Interact"):
					player.move = true
					change_state(State.READY)
					if text_queue.is_empty():
						hide_textbox()
						if braden_convo_3 == true:
							braden_convo_2 = false
					elif braden_convo_2 == false or braden_convo_3 == false:
						hide_textbox()
					else:
						display_text()
		
	# Bennett Conversation
	if bennett.player_in_range == true and Input.is_action_pressed("Interact"):
		
		if bennett_convo_1 == false and bennett_convo_3 == true:
			text_queue.clear()
			queue_text("I lost a piece of my attire sadly  -  Bennett")
			queue_text("What piece exactly?  -  Player")
			queue_text("Its a supriseeeee  -  Bennett")
			queue_text("Oh no...  -  Player")
			
			bennett_convo_1 = true
			spawn_furry_ears = true
		
		if bennett_convo_2 == false and bennett_convo_3 == true:
			text_queue.clear()
			queue_text("Find me thy final piece  -  Bennett")
			
		if bennett_convo_3 == false:
			text_queue.clear()
			queue_text("Pay extra and ill put it on now ;D  -  Bennett")
			if bennett_delivered == false:
				items_delivered += 1
				bennett_delivered = true
			
		match current_state:
			State.READY:
				if text_queue and Input.is_action_just_pressed("Interact"):
					display_text()
			State.READING:
				end_symbol.text = "v"
				change_state(State.FINISHED)
			State.FINISHED:
				if Input.is_action_just_pressed("Interact"):
					player.move = true
					change_state(State.READY)
					if text_queue.is_empty():
						hide_textbox()
						if bennett_convo_3 == true:
							bennett_convo_2 = false
					elif bennett_convo_2 == false or bennett_convo_3 == false:
						hide_textbox()
					else:
						display_text()


func queue_text(next_text):
	text_queue.push_back(next_text)

# Textbox Visibily Control

func hide_textbox():
	start_symbol.text = ""
	end_symbol.text = ""
	label.text = ""
	textbox_container.hide()


func show_textbox():
	start_symbol.text = "*"
	textbox_container.show()


func display_text():
	player.move = false
	var next_text = text_queue.pop_front()
	label.text = next_text
	change_state(State.READING)
	show_textbox()

# Different Conversation Management

func change_state(next_state):
	current_state = next_state
	match current_state:
		State.READY:
			print("Changing state to: State.READY")
		State.READING:
			print("Changing state to: State.READING")
		State.FINISHED:
			print("Changing state to: State.FINISHED")

func _on_Tween_tween_completed(_object, _key):
	end_symbol.text = "v"
	change_state(State.FINISHED)
