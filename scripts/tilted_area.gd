extends Area3D
class_name TiltedArea

var tilt : Transform3D
@onready var parent_node : Node3D = get_parent()

func _ready() -> void:
	#set_gravity_direction(Vector3.DOWN.rotated(parent_node.rotation, parent_node.rotation.angle_to(Vector3.DOWN)).normalized())
	print(gravity_direction)
	
