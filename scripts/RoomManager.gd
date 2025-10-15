extends Node

enum KEYS {KEY_1, KEY_2, KEY_3}
var enviroment : WorldEnvironment

var keys : Array[Key] = [
	ResourceLoader.load("res://resources/First.tres"), ResourceLoader.load("res://resources/Second.tres"), ResourceLoader.load("res://resources/Third.tres")
]
var available_keys : Array[Key] 
var current_key : Key :
	set(k):
		current_key = k
		KeyChanged.emit(k)
		
signal KeyChanged

func _ready() -> void:
	available_keys = keys
	for portal : Portal in get_tree().get_nodes_in_group('portals'):
		print(portal.color_code)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("change_key"):
		var new_id : int = keys.find(current_key)
		current_key = available_keys[(new_id + 1)%available_keys.size()]
