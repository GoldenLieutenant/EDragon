extends Sprite2D

var can_fire = true
var bullet = preload("res://swordy.tscn")



func _physics_process(delta):
	position.x = lerp(position.x, get_parent().position.x - 5 , 0.5)
	position.y = lerp(position.y, get_parent().position.y - 20, 0.5)
	var mouse_pos = get_global_mouse_position()
	look_at(mouse_pos)

	if Input.is_action_pressed("Attack") and can_fire:
		var bullet_instance = bullet.instantiate()
		bullet_instance.rotation = rotation
		bullet_instance.global_position = $Marker2D.global_position
		get_parent().add_child(bullet_instance)
		can_fire = false
		await get_tree().create_timer(0.001).timeout
		can_fire = true
