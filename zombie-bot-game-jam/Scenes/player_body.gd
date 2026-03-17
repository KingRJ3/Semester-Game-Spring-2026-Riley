extends CharacterBody2D


const SPEED = 300.0



func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("right"):
		velocity.x = SPEED
	elif Input.is_action_pressed("left"):
		velocity.x = -SPEED
	else: # make go straight to zero if we want it to not slide afterwards
		velocity.x = move_toward(velocity.x, 0, 5 * SPEED * delta)
		
	if Input.is_action_pressed("up"):
		velocity.y = -SPEED
	elif Input.is_action_pressed("down"):
		velocity.y = SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, 5 * SPEED * delta)
	
	move_and_slide()
