extends Node

enum KEYS {KEY_1, KEY_2, KEY_3}

var current_key : KEYS :
	set(c):
		if c > KEYS.values().size() - 1:
			c = 0 as KEYS
		current_key = c
		print(KEYS.values()[current_key])
		KeyChanged.emit(c)
		
signal KeyChanged

func _ready() -> void:
	for portal : Portal in get_tree().get_nodes_in_group('portals'):
		print(portal.color_code)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("change_key"):
		current_key = current_key + 1 as KEYS
