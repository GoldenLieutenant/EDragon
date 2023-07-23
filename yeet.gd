extends CharacterBody2D


const SPEED = 30.0
const JUMP_VELOCITY = -200.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	if Input.is_action_pressed("move_left"):
		$AnimatedSprite2D.play("Walk_left")
		$AnimatedSprite2D.flip_h = false
		global_position.x -= SPEED * delta
		
		
	elif Input.is_action_pressed("move_right"):
		$AnimatedSprite2D.play("Walk_left")
		$AnimatedSprite2D.flip_h = true
		global_position.x += SPEED * delta
		
		
	elif Input.is_action_just_pressed("move_up"):
		
		
		global_position.y += SPEED * delta
		
		
	elif Input.is_action_just_pressed("move_down"):
		
		
		global_position.y += SPEED * delta
		
		
	else:
		$AnimatedSprite2D.play("Idle")
		velocity.x = 0

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	move_and_slide()
