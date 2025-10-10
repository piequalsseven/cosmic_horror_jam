extends HBoxContainer
class_name PortalConnectionUI

@export var origin_portal : Portal
@export var possible_portals : Array[Portal]
@export var menu_button : MenuButton
@export var label : Label

func _ready() -> void:
	menu_button.get_popup().index_pressed.connect(switch_portal)
	
func switch_portal(id : int): 
	origin_portal.exit_portal = possible_portals[id]
	menu_button.text = possible_portals[id].portal_name
	
func set_pcui(origin_port : Portal) -> void:
	origin_portal = origin_port
	label.text = origin_port.portal_name
	for portal : Portal in get_tree().get_nodes_in_group('portals'):
		if portal == origin_port:
			continue
		possible_portals.append(portal)
		menu_button.get_popup().add_item(portal.name)
