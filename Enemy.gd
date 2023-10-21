extends CharacterBody2D

var speed = 50
var player_chase = false
var player = null
var hp_bar: TextureProgressBar
const MAX_HP = 10000000
var current_hp = MAX_HP

func _ready():
	hp_bar = $Control/TextureProgressBar
	if hp_bar == null:
		print("Error: HP bar node not found!")
	else:
		hp_bar.min_value = 0
		hp_bar.max_value = MAX_HP
		hp_bar.value = current_hp
	$Dragon.play("default")
	#if hp_bar.value < 250:
	#	get_tree().change_scene_to_file("res://Winning.tscn")
		
func update_hp_bar(new_hp):
	current_hp = clamp(new_hp, 0, MAX_HP)
	hp_bar.value = current_hp
	if hp_bar.value < 10:
		$Dragon.play("new_animation")
		await get_tree().create_timer(1).timeout
		self.queue_free()
	
func take_damage(damage_amount: int):
	current_hp -= damage_amount
	current_hp = clamp(current_hp, 0, MAX_HP)
	update_hp_bar(current_hp)

func _physics_process(delta):
	if player_chase:
		position += (player.position - position)/speed
		
		



func _on_detection_area_body_entered(body):
	player = body
	player_chase = true


func _on_detection_area_body_exited(body):
	player = null
	player_chase = false
