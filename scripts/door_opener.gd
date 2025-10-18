extends RayCast3D

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("open_door"):
		if !is_colliding():
			return
		get_collider().change_state()
			
