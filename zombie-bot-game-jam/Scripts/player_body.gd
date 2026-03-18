extends CharacterBody2D


const SPEED = 300.0
var x_direction_input : String = ""
var y_direction_input : String = ""
var override_direction_input : String = ""
@onready var claws_hitbox: CollisionShape2D = $Claws/ClawsHitbox


func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("right"):
		velocity.x = SPEED
		x_direction_input = "right"
		if not y_direction_input:
			override_direction_input = "right"
	elif Input.is_action_pressed("left"):
		velocity.x = -SPEED
		x_direction_input = "left"
		if not y_direction_input:
			override_direction_input = "left"
	else: # make go straight to zero if we want it to not slide afterwards
		if x_direction_input == override_direction_input:
			x_direction_input = ""
			override_direction_input = y_direction_input
		velocity.x = move_toward(velocity.x, 0, 5 * SPEED * delta)
		
	if Input.is_action_pressed("up"):
		velocity.y = -SPEED
		y_direction_input = "up"
		if not x_direction_input:
			override_direction_input = "up"
	elif Input.is_action_pressed("down"):
		velocity.y = SPEED
		y_direction_input = "down"
		if not x_direction_input:
			override_direction_input = "down"
	else:
		if y_direction_input == override_direction_input:
			y_direction_input = ""
			override_direction_input = x_direction_input
		velocity.y = move_toward(velocity.y, 0, 5 * SPEED * delta)
	
	move_and_slide()


func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("left-click"):
		if override_direction_input == "right":
			claws_hitbox.rotation = 0
			claws_hitbox.position = Vector2(23,0)
		elif override_direction_input == "left":
			claws_hitbox.rotation = 0
			claws_hitbox.position = Vector2(-23,0)
		elif override_direction_input == "up":
			claws_hitbox.rotation = PI/2
			claws_hitbox.position = Vector2(0,-23)
		elif override_direction_input == "down":
			claws_hitbox.rotation = PI/2
			claws_hitbox.position = Vector2(0,23)
		else:
			claws_hitbox.position = Vector2(0,0)
