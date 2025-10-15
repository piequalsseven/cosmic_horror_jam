extends Control

func _ready() -> void:
	RoomManager.KeyChanged.connect(change_key)
	
func change_key(new_key : Key) -> void:
	%KeyDisplay.texture = new_key.icon
