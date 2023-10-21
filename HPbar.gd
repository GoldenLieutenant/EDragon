extends Control

var max_hp = 10000000000
var character_hp = max_hp

var hp_bar: TextureProgressBar

func _ready():
	hp_bar = get_node("/root/World 1/Zach/Camera2D/Control/TextureProgress")
	hp_bar.min_value = 0
	hp_bar.max_value = max_hp

	# Set the initial HP value
	hp_bar.value = character_hp

# Function to update the HP bar
func update_hp_bar(new_hp):
	character_hp = clamp(new_hp, 0, max_hp)
	hp_bar.value = character_hp
func take_damage(damage_amount: int):
	character_hp -= damage_amount
	character_hp = clamp(character_hp, 0, max_hp)
	update_hp_bar(character_hp)
