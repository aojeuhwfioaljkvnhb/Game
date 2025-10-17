extends CharacterBody2D

@onready var animation = $sprite
@export var speed := 400
var idle = true
var last_move = "front"
var move = true

func _physics_process(_delta):
	var direction = Vector2.ZERO
	if not Input.is_action_pressed("move_down") and not Input.is_action_pressed("move_left") and not Input.is_action_pressed("move_right") and not Input.is_action_pressed("move_up") or move == false:
		idle = true
	else:
		idle = false
	
	if move == true:
	
		if Input.is_action_pressed("move_right") and not Input.is_action_pressed("move_up") and not Input.is_action_pressed("move_down"):
			print("right")
			animation.play("walk_side")
			last_move = "right"
			$sprite.flip_h = true 
			direction.x += 1
		if Input.is_action_pressed("move_left") and not Input.is_action_pressed("move_up") and not Input.is_action_pressed("move_down"):
			print("left")
			animation.play("walk_side")
			last_move = "left"
			$sprite.flip_h = false
			direction.x -= 1
		if Input.is_action_pressed("move_down") and not Input.is_action_pressed("move_right") and not Input.is_action_pressed("move_left"):
			print("down")
			animation.play("walk_back")
			last_move = "down"
			direction.y += 1
		if Input.is_action_pressed("move_up") and not Input.is_action_pressed("move_right") and not Input.is_action_pressed("move_left"):
			print("up")
			animation.play("walk_front")
			last_move = "up"
			direction.y -= 1
		if Input.is_action_pressed("move_up") and Input.is_action_pressed("move_left"):
			print("left-up")
			animation.play("walk_diagonal_front")
			last_move = "up"
			$sprite.flip_h = false
			direction.x -=0.7
			direction.y -=0.7
		if Input.is_action_pressed("move_up") and Input.is_action_pressed("move_right"):
			print("right-up")
			animation.play("walk_diagonal_front")
			last_move = "up"
			$sprite.flip_h = true 
			direction.x +=0.7
			direction.y -=0.7
		if Input.is_action_pressed("move_down") and Input.is_action_pressed("move_left"):
			print("left-down")
			animation.play("walk_diagonal_back")
			last_move = "down"
			$sprite.flip_h = false
			direction.x -=0.7
			direction.y +=0.7
		if Input.is_action_pressed("move_down") and Input.is_action_pressed("move_right"):
			print("right-down")
			animation.play("walk_diagonal_back")
			last_move = "down"
			$sprite.flip_h = true 
			direction.x +=0.7
			direction.y +=0.7
	if idle == true:
		if last_move == "up":
			animation.play("idle_front")
		elif last_move == "down":
			animation.play("idle_back")
		elif last_move == "right":
			animation.play("idle_side")
		elif last_move == "left":
			animation.play("idle_side")

	direction = direction.normalized()
	velocity = direction * speed
	move_and_slide()
