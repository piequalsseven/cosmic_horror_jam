extends Area3D
class_name TransitionArea

@export var left_end : bool

func _ready() -> void:
	body_entered.connect(on_body_entered)

func on_body_entered(body : Node3D) -> void:
	if !body.has_meta("Player"):
		return
	if !left_end:
		AudioManager.transition_to_endingarea()
	else:
		AudioManager.leaving_endingarea()
		
	
