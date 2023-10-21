extends CharacterBody2D

const SPEED = 30.0
const JUMP_VELOCITY = -200.0
const MAX_HP = 1000000000
const SWORD_SPEED = 150
var current_hp = MAX_HP
var hp_bar_tween: Tween
var hp_bar: TextureProgressBar

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var all_interactions = []
@onready var interactLabel = $"Interaction Components/InteractLabel"

func _ready():
	#update_interactions()
	var node_path = NodePath("/root/World 1/Zach/Camera2D/Control/TextureProgress")
	hp_bar = get_node(node_path)
	if hp_bar == null:
		print("Error: HP bar node not found!")
	else:
		hp_bar.min_value = 0
		hp_bar.max_value = MAX_HP
		hp_bar.value = current_hp
		


func update_hp_bar(new_hp):
	current_hp = clamp(new_hp, 0, MAX_HP)
	hp_bar.value = current_hp
	
func take_damage(damage_amount: int):
	current_hp -= damage_amount
	current_hp = clamp(current_hp, 0, MAX_HP)
	update_hp_bar(current_hp)
	
func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	#if Input.is_action_just_pressed("Interact"):
		#execute_interaction()
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



#func _on_interaction_area_area_entered(area):
#	all_interactions.insert(0, area)
#	update_interactions()


#func _on_interaction_area_area_exited(area):
#	all_interactions.erase(area)
#	update_interactions()
	
#func update_interactions():
#	if all_interactions:
#		interactLabel.text = all_interactions[0].interact_label
#	else:
#		interactLabel.text = ""

#func execute_interaction():
#	if all_interactions:
#		var cur_interaction = all_interactions[0]
#		match cur_interaction.interact_type:
#			"print_text" : print(cur_interaction.interact_value)
