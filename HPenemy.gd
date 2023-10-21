extends Control

var max_hp = 1000
var health = max_hp

var hp_bar: TextureProgressBar

func _ready() -> void:
	hp_bar = $TextureProgressBar
	hp_bar.min_value = 0
	hp_bar.max_value = max_hp
	hp_bar.value = health
	if health < 0:
		$AnimatedSprite2D.play("Died lol")
		await get_tree().create_timer(3)
		queue_free()

func update_hp_bar(new_hp):
	health = clamp(new_hp, 0, max_hp)
	hp_bar.value = health
func take_damage(damage_amount: int):
	health -= damage_amount
	health = clamp(health, 0, max_hp)
	update_hp_bar(health)
