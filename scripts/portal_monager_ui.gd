extends Control

@export var container : VBoxContainer
func _ready() -> void:
	for portal : Portal in get_tree().get_nodes_in_group('portals'):
		var pcui : PortalConnectionUI = preload("res://scenes/portal_connection_ui.tscn").instantiate()
		container.add_child(pcui)
		pcui.set_pcui(portal)
