@tool
extends  Area3D
class_name KeyCollectible

@export var key_mesh : Node3D : 
	set(n):
		key_mesh = n
		key_mesh.rotation_degrees = Vector3(0,0,-90)
		key_mesh.scale = 0.05 * Vector3.ONE

@export var key : Key

func _on_body_entered(body: Node3D) -> void:
	if body.has_meta("Player"):
		RoomManager.available_keys.append(key)
		RoomManager.current_key = key
		queue_free()
