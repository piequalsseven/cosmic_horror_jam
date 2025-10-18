"""
    Asset: Godot Simple Portal System
    File: portal.gd
    Description: An area which teleports the player through the parent node's portal.
    Instructions: For detailed documentation, see the README or visit: https://github.com/Donitzo/godot-simple-portal-system
    Repository: https://github.com/Donitzo/godot-simple-portal-system
    License: CC0 License
"""

extends Area3D
class_name PortalTeleport

var _parent_portal:Portal

func _ready():
	_parent_portal = get_parent() as Portal
	if _parent_portal == null:
		push_error("The PortalTeleport \"%s\" is not a child of a Portal instance" % name)
	
	connect("area_entered", _on_area_entered)

func _on_area_entered(area:Area3D):
	if area.has_meta("teleportable_root"):
		print(_parent_portal.name)
		var root:Node3D = area.get_node(area.get_meta("teleportable_root"))
		var teleported_transform =  _parent_portal.real_to_exit_transform(root.global_transform)
		root.global_transform = teleported_transform
		if root.get("look_rotation") != null:
			root.base_rotation = root.rotation
			root.look_rotation.y = root.rotation.y
		if _parent_portal.change_enviroment_on_teleport:
			get_viewport().get_camera_3d().environment = _parent_portal.exit_environment
	
