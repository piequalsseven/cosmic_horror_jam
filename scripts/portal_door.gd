@tool
extends StaticBody3D
class_name PortalDoor

const ANIMATION_TIME : float = 1.0

@onready var _parent_portal : Portal = get_parent() :
	set(pp):
		_parent_portal = pp
		
@export var portal_connections : Array[Portal]

@export var connections : Dictionary[RoomManager.KEYS, Portal] = {
}
var open : bool : 
	set(o):
		open = o
		set_collision_layer_value(1, !open)
		
var anim_running : bool

@export_subgroup("Exported Nodes")
@export var anim_player : AnimationPlayer
@export var collionshape : CollisionShape3D

func _ready() -> void:
	_parent_portal._portal_door = self
	if portal_connections.size() > 3:
		print("too many connections in " + _parent_portal.name)
	portal_connections.resize(3)
	for i : int in range(3):
		if portal_connections[i]:
			connections[i as RoomManager.KEYS] = portal_connections[i]
		else:
			connections[i as RoomManager.KEYS] = null
	connections.make_read_only()

func change_state() -> void:
	if anim_running:
		return
	anim_running = true
	get_tree().create_timer(ANIMATION_TIME).timeout.connect(func (): anim_running = false)
	
	if open:
		close_door()
	else:
		open_door()
		
func open_door() -> void:
		_parent_portal.exit_portal = connections[RoomManager.get_current_key_id()]
		anim_player.play(&"Open")
		open = true
		var exit_door : PortalDoor = _parent_portal.exit_portal._portal_door
		if !exit_door:
			return
		exit_door.open_door_with_portal()
		if exit_door.portal_connections.has(_parent_portal):
			_parent_portal.exit_portal.exit_portal = _parent_portal
			
func open_door_with_portal() -> void:
		anim_player.play(&"Open")
		open = true
		
func close_door() -> void:
		anim_player.play(&"Close")
		open = false
