extends Area3D
class_name TiltedArea

var tilt : Transform3D
@onready var parent_node : Node3D = get_parent()

func _ready() -> void:
	body_entered.connect(on_body_entered)
	body_exited.connect(on_body_exited)

func on_body_entered(body : Node3D) -> void:
	if body is Player:
		body.has_gravity = true

func on_body_exited(body : Node3D) -> void:
	if body is Player:
		body.has_gravity = false
